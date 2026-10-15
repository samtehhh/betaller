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
    const strength = ['squats', 'glute_bridge', 'plank', 'deadlift_stretch'];
    const jump = ['jumping', 'skipping_rope', 'calf_raise', 'sprint_intervals'];
    const mobility = ['cat_cow', 'cobra_stretch', 'hip_flexor_stretch', 'evening_yoga'];
    const posture = ['wall_stand', 'neck_stretches', 'shoulder_rolls'];
    const sport = ['swimming_basketball'];
    const hang = ['dead_hang_active'];

    final light = weeklyWorkout != '3-5' && weeklyWorkout != '6+';
    final heavy = weeklyWorkout == '6+';
    // Minutes are what the level-1 doses actually take, sets and rests
    // included, so the card on Home and the workout itself agree.
    PlanDay day(int weekday, PlanDayKind kind, List<String> ids,
            {int? minutes}) =>
        PlanDay(weekday, kind, ids, minutes ?? planMinutes(ids));
    return WeeklyPlan([
      day(DateTime.monday, PlanDayKind.strength, [...strength, ...hang]),
      day(DateTime.tuesday, PlanDayKind.jump, jump),
      day(DateTime.wednesday, PlanDayKind.mobility, [...mobility, ...posture]),
      day(
        DateTime.thursday,
        light ? PlanDayKind.posture : PlanDayKind.strength,
        light ? posture : [...strength, ...hang],
      ),
      day(DateTime.friday, PlanDayKind.jump, jump),
      day(DateTime.saturday, PlanDayKind.sport, sport,
          minutes: heavy ? 60 : 45),
      day(
        DateTime.sunday,
        heavy ? PlanDayKind.mobility : PlanDayKind.rest,
        heavy ? mobility : const ['evening_yoga'],
      ),
    ]);
  }

  /// One of the program's [kProgramDays] days. Day `n` repeats weekday
  /// `n % 7` of this week at level `n ~/ 7`: the same week, getting harder
  /// ten times over.
  ProgramDay programDay(int index) {
    final i = index.clamp(0, kProgramDays - 1);
    final template = days[i % kProgramLevelDays];
    return ProgramDay(i, template, template.movesAt(i ~/ kProgramLevelDays));
  }

  /// All [kProgramDays] days, in order.
  List<ProgramDay> get program =>
      List.generate(kProgramDays, programDay, growable: false);
}

// ═════════════════════════════════════════════════════════════════════════
//  Doses: how many sets of how much, per move, per program level
// ═════════════════════════════════════════════════════════════════════════

/// The program: 10 levels of 7 days.
const int kProgramLevelCount = 10;
const int kProgramLevelDays = 7;
const int kProgramDays = kProgramLevelCount * kProgramLevelDays;

/// How a move is measured.
enum DoseKind {
  /// Repetitions per set.
  reps,

  /// Seconds held per set.
  hold,

  /// Seconds of continuous work per set (rope, sprints).
  timed,

  /// One block of minutes (a yoga flow, a game of sport).
  session,
}

/// One move, dosed: [sets] of [amount] (reps, seconds or minutes, by
/// [kind]) with [restSeconds] between sets.
class MoveDose {
  final String routineId;
  final DoseKind kind;
  final int sets;
  final int amount;

  /// Both sides are worked, one after the other, in every set.
  final bool perSide;
  final int restSeconds;

  /// How long one repetition takes, for [DoseKind.reps].
  final int secondsPerRep;

  const MoveDose({
    required this.routineId,
    required this.kind,
    required this.sets,
    required this.amount,
    this.perSide = false,
    this.restSeconds = 30,
    this.secondsPerRep = 3,
  });

  /// Seconds of work in one set.
  int get workSeconds {
    final sides = perSide ? 2 : 1;
    return switch (kind) {
      DoseKind.reps => amount * secondsPerRep * sides,
      DoseKind.hold || DoseKind.timed => amount * sides,
      DoseKind.session => amount * 60,
    };
  }

  /// Work plus the rests between sets.
  int get totalSeconds =>
      sets * workSeconds + (sets > 1 ? (sets - 1) * restSeconds : 0);

  /// Rounded to the minute, never zero.
  int get minutes => (totalSeconds / 60).round().clamp(1, 600);

  /// Total work in the move's own unit (reps or seconds over all sets, or
  /// minutes for a session), for comparing one level with the next.
  int get volume => kind == DoseKind.session ? amount : sets * amount;
}

/// A move's dose from level 1 to level 10. Levels in between are
/// interpolated and rounded to [step].
class _Curve {
  final DoseKind kind;
  final int setsFrom, setsTo;
  final int from, to;
  final int step;
  final bool perSide;
  final int rest;
  final int secondsPerRep;
  const _Curve(
    this.kind,
    this.setsFrom,
    this.setsTo,
    this.from,
    this.to, {
    this.step = 1,
    this.perSide = false,
    this.rest = 30,
    this.secondsPerRep = 3,
  });
}

/// Bodyweight doses for a teen or young adult. Level 1 is a first week any
/// healthy beginner can do; level 10 triples the holds and adds a set.
const Map<String, _Curve> _curves = {
  // strength
  'squats': _Curve(DoseKind.reps, 3, 4, 12, 20, rest: 60),
  'glute_bridge': _Curve(DoseKind.reps, 3, 4, 12, 20, rest: 45),
  'plank': _Curve(DoseKind.hold, 3, 3, 30, 90, step: 5, rest: 45),
  'deadlift_stretch': _Curve(DoseKind.hold, 2, 3, 30, 60, step: 5, rest: 20),
  'dead_hang_active': _Curve(DoseKind.hold, 3, 3, 20, 60, step: 5, rest: 60),
  'bar_hanging': _Curve(DoseKind.hold, 3, 3, 20, 60, step: 5, rest: 60),
  'overhead_press': _Curve(DoseKind.reps, 3, 4, 10, 15, rest: 45),
  // bone loading
  'jumping': _Curve(DoseKind.reps, 3, 4, 15, 30, rest: 45, secondsPerRep: 2),
  'skipping_rope': _Curve(DoseKind.timed, 3, 5, 60, 90, step: 15, rest: 45),
  'calf_raise':
      _Curve(DoseKind.reps, 3, 4, 15, 25, rest: 30, secondsPerRep: 2),
  'sprint_intervals': _Curve(DoseKind.timed, 6, 10, 15, 20, step: 5, rest: 45),
  'hiit_workout': _Curve(DoseKind.session, 1, 1, 10, 20),
  // mobility
  'cat_cow': _Curve(DoseKind.reps, 2, 3, 10, 15, rest: 15, secondsPerRep: 4),
  'cobra_stretch': _Curve(DoseKind.hold, 3, 3, 20, 45, step: 5, rest: 15),
  'hip_flexor_stretch': _Curve(DoseKind.hold, 2, 3, 30, 60,
      step: 5, perSide: true, rest: 15),
  'evening_yoga': _Curve(DoseKind.session, 1, 1, 10, 20),
  'morning_stretch': _Curve(DoseKind.session, 1, 1, 5, 10),
  'pilates_core': _Curve(DoseKind.session, 1, 1, 10, 20),
  // posture
  'wall_stand': _Curve(DoseKind.hold, 2, 3, 60, 120, step: 15, rest: 20),
  'neck_stretches': _Curve(DoseKind.hold, 2, 3, 20, 30,
      step: 5, perSide: true, rest: 10),
  'shoulder_rolls':
      _Curve(DoseKind.reps, 2, 3, 10, 20, rest: 15, secondsPerRep: 2),
  // sport
  'swimming_basketball': _Curve(DoseKind.session, 1, 1, 45, 60, step: 5),
};

/// Whether [id] is a move with a dose, as opposed to a daily habit.
bool hasMoveDose(String id) => _curves.containsKey(id);

/// [id] dosed for program [level] (0 is level 1). Null for habits.
MoveDose? moveDose(String id, {int level = 0}) {
  final c = _curves[id];
  if (c == null) return null;
  final t = level.clamp(0, kProgramLevelCount - 1) / (kProgramLevelCount - 1);
  int lerp(int a, int b, int step) {
    final v = a + (b - a) * t;
    final lo = a < b ? a : b;
    final hi = a < b ? b : a;
    return ((v / step).round() * step).clamp(lo, hi);
  }

  return MoveDose(
    routineId: id,
    kind: c.kind,
    sets: lerp(c.setsFrom, c.setsTo, 1),
    amount: lerp(c.from, c.to, c.step),
    perSide: c.perSide,
    restSeconds: c.rest,
    secondsPerRep: c.secondsPerRep,
  );
}

/// Minutes a list of moves takes at [level], sets and rests included.
int planMinutes(List<String> ids, {int level = 0}) {
  var total = 0;
  for (final id in ids) {
    total += moveDose(id, level: level)?.minutes ?? 0;
  }
  return total;
}

extension PlanDayDoses on PlanDay {
  /// This day's moves dosed for [level]. A sport day keeps the plan's own
  /// minutes when they are longer (people who train 6+ times play longer).
  List<MoveDose> movesAt(int level) {
    final out = <MoveDose>[];
    for (final id in routineIds) {
      final d = moveDose(id, level: level);
      if (d == null) continue;
      if (kind == PlanDayKind.sport &&
          d.kind == DoseKind.session &&
          minutes > d.amount) {
        out.add(MoveDose(
          routineId: id,
          kind: DoseKind.session,
          sets: 1,
          amount: minutes,
        ));
      } else {
        out.add(d);
      }
    }
    return out;
  }

  /// Minutes at [level].
  int minutesAt(int level) =>
      movesAt(level).fold(0, (sum, d) => sum + d.minutes);
}

/// One day of the 70-day program.
class ProgramDay {
  /// 0-based, 0..69: the index AppProvider.completedProgramDays stores.
  final int index;
  final PlanDay template;
  final List<MoveDose> moves;
  const ProgramDay(this.index, this.template, this.moves);

  int get level => index ~/ kProgramLevelDays;
  int get dayInLevel => index % kProgramLevelDays;
  PlanDayKind get kind => template.kind;
  int get minutes => moves.fold(0, (sum, d) => sum + d.minutes);
}

/// The first program day not completed yet, or [kProgramDays] when done.
int firstOpenProgramDay(Set<int> completed) {
  for (var i = 0; i < kProgramDays; i++) {
    if (!completed.contains(i)) return i;
  }
  return kProgramDays;
}

/// The level being worked through, whose doses apply today.
int currentProgramLevel(Set<int> completed) =>
    (firstOpenProgramDay(completed) ~/ kProgramLevelDays)
        .clamp(0, kProgramLevelCount - 1);

String planKindLabel(AppLocalizations l, PlanDayKind k) => switch (k) {
      PlanDayKind.strength => l.planStrength,
      PlanDayKind.jump => l.planJump,
      PlanDayKind.mobility => l.planMobility,
      PlanDayKind.sport => l.planSport,
      PlanDayKind.posture => l.planPosture,
      PlanDayKind.rest => l.planRest,
    };
