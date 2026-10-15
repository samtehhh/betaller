import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/utils/daily_plan.dart';
import 'package:boyuzatma_app/utils/daily_targets.dart';
import 'package:boyuzatma_app/utils/meal_plan.dart';

UserProfile _profile({
  int age = 15,
  double kg = 55,
  String gender = 'male',
  List<String> meals = const ['08:00', '13:00', '19:00'],
}) =>
    UserProfile(
      name: 'Test',
      gender: gender,
      birthDate: '${DateTime.now().year - age - 1}-12-31',
      currentHeight: 165,
      weight: kg,
      fatherHeight: 178,
      motherHeight: 164,
      mealTimes: meals,
    );

void main() {
  group('program generator', () {
    for (final answer in ['', '0-2', '3-5', '6+']) {
      test('70 days, 10 levels, every day has moves ($answer)', () {
        final plan = WeeklyPlan.forAnswers(weeklyWorkout: answer);
        final program = plan.program;
        expect(program.length, kProgramDays);
        expect(kProgramDays, 70);
        for (final d in program) {
          expect(d.moves, isNotEmpty, reason: 'day ${d.index}');
          expect(d.level, d.index ~/ 7);
          expect(d.template, plan.days[d.index % 7]);
          expect(d.minutes, greaterThan(0));
        }
      });
    }

    test('plank goes 30 s to 90 s and the hang 20 s to 60 s', () {
      final first = moveDose('plank', level: 0)!;
      final last = moveDose('plank', level: 9)!;
      expect(first.amount, 30);
      expect(last.amount, 90);
      expect(moveDose('dead_hang_active', level: 0)!.amount, 20);
      expect(moveDose('dead_hang_active', level: 9)!.amount, 60);
    });

    test('every move only gets harder from one level to the next', () {
      final plan = WeeklyPlan.forAnswers(weeklyWorkout: '3-5');
      for (var day = 0; day < 7; day++) {
        for (var level = 1; level < kProgramLevelCount; level++) {
          final before = plan.programDay((level - 1) * 7 + day).moves;
          final after = plan.programDay(level * 7 + day).moves;
          expect(after.length, before.length);
          for (var i = 0; i < before.length; i++) {
            expect(after[i].routineId, before[i].routineId);
            expect(after[i].volume, greaterThanOrEqualTo(before[i].volume),
                reason: '${after[i].routineId} level $level');
            expect(after[i].sets, greaterThanOrEqualTo(before[i].sets));
          }
        }
      }
      // And level 10 is clearly more than level 1 on a strength day.
      final l1 = plan.programDay(0).minutes;
      final l10 = plan.programDay(63).minutes;
      expect(l10, greaterThan(l1 * 1.5));
    });

    test('plan minutes are what the level-1 doses take', () {
      final plan = WeeklyPlan.forAnswers(weeklyWorkout: '3-5');
      for (final d in plan.days) {
        expect(d.minutesAt(0), d.minutes, reason: d.kind.name);
      }
    });

    test('today\'s plan is the weekday block plus the daily habits', () {
      final monday = DateTime(2026, 10, 12);
      final ids = dailyPlanIds(monday, '3-5');
      final block = WeeklyPlan.forAnswers(weeklyWorkout: '3-5').days[0];
      expect(ids.take(block.routineIds.length), block.routineIds);
      expect(ids, containsAll(kDailyCoreRoutineIds));
      expect(ids.toSet().length, ids.length);
    });

    test('firstOpenProgramDay and currentProgramLevel', () {
      expect(firstOpenProgramDay({}), 0);
      expect(firstOpenProgramDay({0, 1, 2}), 3);
      expect(firstOpenProgramDay({0, 2}), 1);
      expect(currentProgramLevel({for (var i = 0; i < 14; i++) i}), 2);
      expect(firstOpenProgramDay({for (var i = 0; i < 70; i++) i}), 70);
      expect(currentProgramLevel({for (var i = 0; i < 70; i++) i}), 9);
    });
  });

  group('program day gate', () {
    late AppProvider p;
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      p = AppProvider();
      await p.loadData();
      p.setProfile(_profile());
      p.setOnboardingAnswers({'weeklyWorkout': '3-5'});
    });

    test('a day needs every move ticked, and only one day a day', () {
      expect(p.currentProgramDay, 0);
      expect(p.markProgramDayComplete(0), isFalse);
      expect(p.completedProgramDays, isEmpty);

      final moves = p.weeklyPlan.programDay(0).moves;
      for (final m in moves.skip(1)) {
        p.toggleProgramMove(0, m.routineId);
      }
      expect(p.canCompleteProgramDay(0), isFalse);
      p.toggleProgramMove(0, moves.first.routineId);
      expect(p.canCompleteProgramDay(0), isTrue);
      expect(p.markProgramDayComplete(0), isTrue);
      expect(p.completedProgramDays, {0});
      expect(p.programChecksFor(0), isEmpty);

      // Day 2 is next, but not before tomorrow.
      expect(p.currentProgramDay, 1);
      for (final m in p.weeklyPlan.programDay(1).moves) {
        p.toggleProgramMove(1, m.routineId);
      }
      expect(p.programDayDoneToday, isTrue);
      expect(p.markProgramDayComplete(1), isFalse);
      // Skipping ahead is not allowed either.
      expect(p.canCompleteProgramDay(5), isFalse);
    });

    test('nutrition checklist is date keyed and keeps habits in step', () {
      expect(p.nutritionChecks, isEmpty);
      p.toggleNutritionCheck('calcium');
      p.toggleNutritionCheck('meal0');
      expect(p.todayNutritionChecks, {'calcium', 'meal0'});
      expect(p.nutritionChecks.length, 1);

      // Protein is also a habit in today's plan: ticking one ticks both.
      final protein = p.todayRoutines.firstWhere((r) => r.id == 'protein');
      expect(protein.completed, isFalse);
      p.toggleNutritionCheck('protein');
      expect(protein.completed, isTrue);
      expect(p.nutritionCheckDone('protein'), isTrue);
      p.toggleNutritionCheck('protein');
      expect(protein.completed, isFalse);
      expect(p.nutritionCheckDone('protein'), isFalse);
    });
  });

  group('meal math', () {
    final cases = [
      (_profile(age: 15, kg: 55), '3-5'),
      (_profile(age: 13, kg: 40, gender: 'female'), '0-2'),
      (
        _profile(
            age: 17,
            kg: 80,
            meals: const ['07:00', '10:30', '13:00', '16:30', '20:00']),
        '6+'
      ),
      (
        _profile(
            age: 21, kg: 62, gender: 'female', meals: const ['12:00', '20:00']),
        '3-5'
      ),
      (
        _profile(
            age: 16, kg: 95, meals: const ['08:00', '13:00', '16:00', '19:30']),
        '6+'
      ),
    ];

    for (final (profile, workout) in cases) {
      test('${profile.age} y, ${profile.weight} kg, ${profile.mealCount} meals',
          () {
        final t = DailyTargets.forProfile(profile,
            weeklyWorkout: workout, meals: profile.mealCount);
        final week = buildWeekMenu(t, profile.mealTimes);
        expect(week.length, 7);
        for (final day in week) {
          expect(day.meals.length, profile.mealCount);
          // Calcium is met every day.
          expect(day.calcium, greaterThanOrEqualTo(t.calciumMg),
              reason: 'day ${day.variant} calcium');
          // Protein is met, and close to the target: the dairy that covers
          // calcium sets a floor, so a small teen may land a bit above.
          expect(day.protein, greaterThanOrEqualTo(t.proteinG * 0.95),
              reason: 'day ${day.variant} protein');
          final ceiling = t.proteinG >= 75 ? t.proteinG * 1.12 : 90.0;
          expect(day.protein, lessThanOrEqualTo(ceiling),
              reason: 'day ${day.variant} protein ${day.protein}');
          // The totals are the sum of the items.
          final sum = day.meals
              .expand((m) => m.items)
              .fold(0.0, (s, i) => s + i.protein);
          expect(day.protein, closeTo(sum, 0.001));
          for (final m in day.meals) {
            expect(m.items, isNotEmpty);
            for (final i in m.items) {
              expect(i.amount, greaterThan(0));
            }
          }
        }
      });
    }

    test('oats 60 g and milk 250 ml', () {
      const oats = MealItem(Food('oats', 13.2, 52, 0, 3.6, 138, 379), 60);
      final milk = MealItem(kFoods['milk']!, 250);
      expect(oats.protein + milk.protein, closeTo(16.2, 0.1));
      expect(oats.calcium + milk.calcium, closeTo(331, 1));
    });

    test('eggs are counted in pieces of 50 g', () {
      final eggs = MealItem(kFoods['eggs']!, 2);
      expect(eggs.grams, 100);
      expect(eggs.protein, closeTo(12.6, 0.01));
    });

    test('meal slots follow the clock', () {
      expect(slotsForTimes(['08:00', '13:00', '19:00']),
          [MealSlot.breakfast, MealSlot.lunch, MealSlot.dinner]);
      expect(slotsForTimes(['12:00', '20:00']),
          [MealSlot.lunch, MealSlot.dinner]);
      expect(slotsForTimes(['07:00', '10:30', '13:00', '16:30', '20:00']), [
        MealSlot.breakfast,
        MealSlot.snack,
        MealSlot.lunch,
        MealSlot.snack,
        MealSlot.dinner,
      ]);
      expect(proteinSplit(90, [MealSlot.breakfast, MealSlot.lunch,
          MealSlot.dinner]), [30, 30, 30]);
    });

    test('every food has a name key', () {
      // plFood + capitalised id, as the screen looks them up.
      for (final id in kFoods.keys) {
        expect(RegExp(r'^[a-z][A-Za-z]+$').hasMatch(id), isTrue, reason: id);
      }
    });
  });
}
