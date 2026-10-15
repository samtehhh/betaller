import '../l10n/app_localizations.dart';
import '../models/user_profile.dart';
import 'calculations.dart';

/// Concrete numbers for one day, worked out from the user's own age, sex,
/// weight and how often they train. Every screen that names a nutrient
/// target reads it from here, so the app never says 600 IU in one place
/// and 3,000 IU in another.
class DailyTargets {
  final int proteinG;
  final int proteinPerMealG;
  final int calciumMg;
  final int vitaminDIu;
  final int zincMg;
  final int magnesiumMg;
  final double waterL;
  final double sleepH;
  final int kcal;

  /// Minutes of movement a day (WHO: 60 for 5-17, about 30 for adults).
  final int activeMinutes;

  const DailyTargets({
    required this.proteinG,
    required this.proteinPerMealG,
    required this.calciumMg,
    required this.vitaminDIu,
    required this.zincMg,
    required this.magnesiumMg,
    required this.waterL,
    required this.sleepH,
    required this.kcal,
    required this.activeMinutes,
  });

  /// [weeklyWorkout] is the onboarding answer: '0-2', '3-5' or '6+'.
  /// [trainingDay] adds water for the session.
  factory DailyTargets.forProfile(
    UserProfile p, {
    String weeklyWorkout = '',
    int meals = 3,
    bool trainingDay = false,
  }) {
    final age = p.age;
    final male = p.gender == 'male';
    final kg = p.weight;

    final proteinPerKg = switch (weeklyWorkout) {
      '6+' => 1.6,
      '3-5' => 1.5,
      _ => 1.3,
    };
    final protein = (kg * proteinPerKg).round();
    final mealCount = meals.clamp(2, 6);

    final calcium = age <= 18 ? 1300 : 1000;
    // Maintenance doses well under the 4,000 IU daily upper limit set for
    // everyone aged 9 and over.
    final vitD = age <= 13 ? 1000 : (age <= 17 ? 2000 : 3000);
    final zinc = age <= 13 ? 8 : (male ? 11 : (age <= 18 ? 9 : 8));
    final magnesium = age <= 13
        ? 240
        : age <= 18
            ? (male ? 410 : 360)
            : (male ? 400 : 310);

    final activity = switch (weeklyWorkout) {
      '6+' => 1.8,
      '3-5' => 1.6,
      _ => 1.4,
    };
    final kcal = (Calculations.dailyCalorieNeed(p) / 1.55 * activity).round();

    final water =
        Calculations.dailyWaterNeed(kg) + (trainingDay ? 0.5 : 0.0);

    return DailyTargets(
      proteinG: protein,
      proteinPerMealG: (protein / mealCount).round(),
      calciumMg: calcium,
      vitaminDIu: vitD,
      zincMg: zinc,
      magnesiumMg: magnesium,
      waterL: double.parse(water.toStringAsFixed(1)),
      sleepH: Calculations.dailySleepNeed(age),
      kcal: kcal,
      activeMinutes: age < 18 ? 60 : 30,
    );
  }
}

/// What a day of the week is for.
enum PlanDayKind { strength, jump, mobility, sport, posture, rest }

class PlanDay {
  final int weekday; // DateTime.monday..sunday
  final PlanDayKind kind;

  /// Routine ids from defaultRoutines, in order.
  final List<String> routineIds;
  final int minutes;

  const PlanDay(this.weekday, this.kind, this.routineIds, this.minutes);
}

/// A week built around growth-age training: bodyweight strength, bone
/// loading (jumps, rope, sprints), daily mobility and posture work, sport,
/// and a rest day. More sessions for people who already train more.
class WeeklyPlan {
  final List<PlanDay> days;
  const WeeklyPlan(this.days);

  PlanDay get today => days[DateTime.now().weekday - 1];

  int get trainingDays => days.where((d) => d.kind != PlanDayKind.rest).length;

  factory WeeklyPlan.forAnswers({String weeklyWorkout = '', int age = 16}) {
    const strength = ['squats', 'deadlift_stretch', 'pilates_core'];
    const jump = ['jumping', 'skipping_rope', 'sprint_intervals'];
    const mobility = ['morning_stretch', 'cobra_stretch', 'evening_yoga'];
    const posture = ['wall_stand', 'neck_stretches', 'shoulder_rolls'];
    const sport = ['swimming_basketball'];
    const hang = ['bar_hanging'];

    final light = weeklyWorkout != '3-5' && weeklyWorkout != '6+';
    final heavy = weeklyWorkout == '6+';
    return WeeklyPlan([
      const PlanDay(DateTime.monday, PlanDayKind.strength,
          [...strength, ...hang], 30),
      const PlanDay(DateTime.tuesday, PlanDayKind.jump, jump, 25),
      PlanDay(DateTime.wednesday, PlanDayKind.mobility,
          [...mobility, ...posture], light ? 15 : 20),
      PlanDay(DateTime.thursday,
          light ? PlanDayKind.posture : PlanDayKind.strength,
          light ? posture : [...strength, ...hang], light ? 15 : 30),
      const PlanDay(DateTime.friday, PlanDayKind.jump, jump, 25),
      PlanDay(DateTime.saturday, PlanDayKind.sport, sport, heavy ? 60 : 45),
      PlanDay(DateTime.sunday,
          heavy ? PlanDayKind.mobility : PlanDayKind.rest,
          heavy ? mobility : const ['evening_yoga'], heavy ? 20 : 10),
    ]);
  }
}

String planKindLabel(AppLocalizations l, PlanDayKind k) => switch (k) {
      PlanDayKind.strength => l.planStrength,
      PlanDayKind.jump => l.planJump,
      PlanDayKind.mobility => l.planMobility,
      PlanDayKind.sport => l.planSport,
      PlanDayKind.posture => l.planPosture,
      PlanDayKind.rest => l.planRest,
    };
