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

    final water = Calculations.dailyWaterNeed(kg) + (trainingDay ? 0.5 : 0.0);

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

/// A two-week program in two flavours, picked by `trainPlace`.
///
/// At home ('home', the default): bodyweight only, plus a pull-up bar for
/// hangs and pull-ups. In a gym or with dumbbells ('gym'): the same week
/// shape, but Monday, Tuesday, Thursday and Friday swap in dumbbell, band
/// and carry moves (the weights group in move_catalog.dart). Either way a
/// week holds strength, jump, mobility and posture days, sprints and hangs,
/// a HIIT session on Saturday for people who train 3+ times a week, and a
/// rest day with two light stretches. More sessions for people who already
/// train more.
class WeeklyPlan {
  final List<PlanDay> days;

  /// The alternate week: the same shape (strength, jumps, mobility...) made
  /// of different moves. The program runs week A, week B, week A...; with
  /// none given it is week A every week.
  final List<PlanDay> daysB;
  const WeeklyPlan(this.days, [this.daysB = const []]);

  /// Whether [date] falls in a B week (odd weeks, counted from a fixed
  /// Monday, so the answer is the same on every device and every launch).
  static bool isWeekB(DateTime date) {
    final monday = DateTime(
      date.year,
      date.month,
      date.day,
    ).subtract(Duration(days: date.weekday - 1));
    final weeks = monday.difference(DateTime(2024, 1, 1)).inDays ~/ 7;
    return weeks.isOdd;
  }

  /// The seven days of the week [date] falls in.
  List<PlanDay> weekOf(DateTime date) =>
      daysB.isNotEmpty && isWeekB(date) ? daysB : days;

  PlanDay get today {
    final now = DateTime.now();
    return weekOf(now)[now.weekday - 1];
  }

  int get trainingDays => days.where((d) => d.kind != PlanDayKind.rest).length;

  factory WeeklyPlan.forAnswers({
    String weeklyWorkout = '',
    int age = 16,
    String trainPlace = 'home',
  }) {
    final gym = trainPlace == 'gym';
    final light = weeklyWorkout != '3-5' && weeklyWorkout != '6+';
    final heavy = weeklyWorkout == '6+';
    // Minutes are what the level-1 doses actually take, sets and rests
    // included, so the card on Home and the workout itself agree.
    PlanDay day(
      int weekday,
      PlanDayKind kind,
      List<String> ids, {
      int? minutes,
    }) => PlanDay(weekday, kind, ids, minutes ?? planMinutes(ids));
    // Gym and home differ only on Monday, Tuesday, Thursday (strength)
    // and Friday; Wednesday, Saturday and Sunday are the same in both.
    PlanDay saturday(List<String> hard, List<String> easy) => day(
      DateTime.saturday,
      light ? PlanDayKind.mobility : PlanDayKind.strength,
      light ? easy : hard,
    );
    PlanDay sunday(List<String> rest, List<String> busy) => day(
      DateTime.sunday,
      heavy ? PlanDayKind.mobility : PlanDayKind.rest,
      heavy ? busy : rest,
    );
    PlanDay thursday(
      List<String> easy,
      List<String> homeIds,
      List<String> gymIds,
    ) => light
        ? day(DateTime.thursday, PlanDayKind.posture, easy)
        : day(DateTime.thursday, PlanDayKind.strength, gym ? gymIds : homeIds);
    PlanDay pick(
      int weekday,
      PlanDayKind kind,
      List<String> homeIds,
      List<String> gymIds,
    ) => day(weekday, kind, gym ? gymIds : homeIds);

    return WeeklyPlan(
      [
        // Week A
        pick(
          DateTime.monday,
          PlanDayKind.strength,
          const [
            'squats',
            'push_ups',
            'glute_bridge',
            'plank',
            'dead_hang_active',
          ],
          const [
            'goblet_squat',
            'dumbbell_deadlift',
            'dumbbell_row',
            'plank',
            'dead_hang_active',
          ],
        ),
        pick(
          DateTime.tuesday,
          PlanDayKind.jump,
          const [
            'masai_jumps',
            'jump_squats',
            'burpees',
            'sprint_intervals',
            'toe_touch',
          ],
          const [
            'masai_jumps',
            'jump_squats',
            'sprint_intervals',
            'farmer_carry',
            'toe_touch',
          ],
        ),
        day(DateTime.wednesday, PlanDayKind.mobility, const [
          'cobra_stretch',
          'downward_dog',
          'hip_flexor_stretch',
          'toe_touch',
          'deadlift_stretch',
          'dead_hang_active',
        ]),
        thursday(
          const [
            'neck_stretches',
            'deadlift_stretch',
            'wall_stand',
            'bar_hanging',
          ],
          const ['lunges', 'pull_ups', 'side_plank', 'superman', 'bar_hanging'],
          const [
            'overhead_press',
            'lunges',
            'pull_ups',
            'band_pull_apart',
            'bar_hanging',
          ],
        ),
        pick(
          DateTime.friday,
          PlanDayKind.jump,
          const [
            'pogo_jumps',
            'broad_jumps',
            'high_knees',
            'sprint_intervals',
            'hip_flexor_stretch',
          ],
          const [
            'tuck_jumps',
            'broad_jumps',
            'burpees',
            'sprint_intervals',
            'hip_flexor_stretch',
          ],
        ),
        saturday(
          const ['hiit_workout', 'plank', 'cobra_stretch', 'dead_hang_active'],
          const [
            'cobra_stretch',
            'downward_dog',
            'toe_touch',
            'dead_hang_active',
          ],
        ),
        sunday(
          const ['hip_flexor_stretch', 'toe_touch'],
          const [
            'cobra_stretch',
            'downward_dog',
            'hip_flexor_stretch',
            'deadlift_stretch',
          ],
        ),
      ],
      [
        // Week B
        pick(
          DateTime.monday,
          PlanDayKind.strength,
          const [
            'step_ups',
            'push_ups',
            'dead_bug',
            'scapular_pull',
            'hanging_knee_raise',
          ],
          const [
            'dumbbell_deadlift',
            'goblet_squat',
            'push_ups',
            'dumbbell_row',
            'hanging_knee_raise',
          ],
        ),
        pick(
          DateTime.tuesday,
          PlanDayKind.jump,
          const [
            'masai_jumps',
            'tuck_jumps',
            'single_leg_hops',
            'sprint_intervals',
            'seated_forward_fold',
          ],
          const [
            'masai_jumps',
            'pogo_jumps',
            'single_leg_hops',
            'sprint_intervals',
            'seated_forward_fold',
          ],
        ),
        day(DateTime.wednesday, PlanDayKind.mobility, const [
          'low_lunge_arch',
          'spinal_twist',
          'chest_stretch',
          'seated_forward_fold',
          'standing_side_stretch',
          'mountain_pose',
        ]),
        thursday(
          const [
            'dead_bug',
            'side_plank',
            'scapular_retraction',
            'dead_hang_active',
          ],
          const [
            'squats',
            'wall_sit',
            'side_plank',
            'pull_ups',
            'dead_hang_active',
          ],
          const [
            'overhead_press',
            'step_ups',
            'farmer_carry',
            'pull_ups',
            'dead_hang_active',
          ],
        ),
        // Friday of week B is the same in both places.
        day(DateTime.friday, PlanDayKind.jump, const [
          'jump_squats',
          'burpees',
          'skipping_rope',
          'sprint_intervals',
          'standing_side_stretch',
        ]),
        saturday(
          const [
            'hiit_workout',
            'side_plank',
            'seated_forward_fold',
            'bar_hanging',
          ],
          const [
            'low_lunge_arch',
            'seated_forward_fold',
            'spinal_twist',
            'dead_hang_active',
          ],
        ),
        sunday(
          const ['seated_forward_fold', 'standing_side_stretch'],
          const [
            'low_lunge_arch',
            'spinal_twist',
            'chest_stretch',
            'seated_forward_fold',
          ],
        ),
      ],
    );
  }

  /// One of the program's [kProgramDays] days. Day `n` repeats weekday
  /// `n % 7` of this week at level `n ~/ 7`: the same week, getting harder
  /// ten times over.
  ProgramDay programDay(int index) {
    final i = index.clamp(0, kProgramDays - 1);
    // Odd program weeks run week B, when the plan has one.
    final week = daysB.isNotEmpty && (i ~/ kProgramLevelDays).isOdd
        ? daysB
        : days;
    final template = week[i % kProgramLevelDays];
    return ProgramDay(i, template, template.movesAt(programLevelOf(i)));
  }

  /// All [kProgramDays] days, in order.
  List<ProgramDay> get program =>
      List.generate(kProgramDays, programDay, growable: false);
}

// ═════════════════════════════════════════════════════════════════════════
//  Doses: how many sets of how much, per move, per program level
// ═════════════════════════════════════════════════════════════════════════

/// The program: 10 levels over weeks of 7 days. By default each level is
/// one week (70 days). Someone who said in the onboarding by when they hope
/// to have grown gets the same ten levels stretched over that many days, so
/// a level then lasts more than a week.
const int kProgramLevelCount = 10;

/// Days in a program week (the row of day tiles the Discipline tab shows).
const int kProgramLevelDays = 7;

const int _kDefaultProgramDays = kProgramLevelCount * kProgramLevelDays;
int _programDays = _kDefaultProgramDays;

/// How many days the program runs for this user.
int get kProgramDays => _programDays;

/// Sets the program's length from the onboarding answer: '90', '120', '180'
/// or '365' days; anything else (not asked, or "as much as I can") keeps
/// the 70-day default. AppProvider calls this when the answers load or
/// change.
void setProgramGoal(Object? goal) {
  final days = int.tryParse('$goal');
  _programDays = days != null && days >= _kDefaultProgramDays && days <= 366
      ? days
      : _kDefaultProgramDays;
}

int get _programWeeks => (_programDays / kProgramLevelDays).ceil();

/// The level (0..9) whose doses apply on program day [day]: the week's place
/// along the program, mapped onto the ten levels.
int programLevelOf(int day) {
  final week = day.clamp(0, _programDays - 1) ~/ kProgramLevelDays;
  return (week * kProgramLevelCount ~/ _programWeeks).clamp(
    0,
    kProgramLevelCount - 1,
  );
}

/// The program days that belong to [level], in order.
List<int> programDaysOfLevel(int level) => [
  for (var d = 0; d < _programDays; d++)
    if (programLevelOf(d) == level) d,
];

/// A string that names the default length ("70-day Discipline") with this
/// user's own number of days in it.
String programText(String s) => _programDays == _kDefaultProgramDays
    ? s
    : s.replaceAll('$_kDefaultProgramDays', '$_programDays');

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
  'masai_jumps': _Curve(DoseKind.timed, 3, 3, 20, 40, step: 5, rest: 30),
  // ── The Nov 2026 additions ───────────────────────────────────────────────
  'pogo_jumps': _Curve(DoseKind.timed, 3, 4, 20, 40, step: 5, rest: 30),
  'jump_squats': _Curve(DoseKind.reps, 3, 4, 8, 15, rest: 45),
  'tuck_jumps': _Curve(DoseKind.reps, 3, 4, 6, 12, rest: 45),
  'broad_jumps': _Curve(DoseKind.reps, 3, 4, 5, 10, rest: 45, secondsPerRep: 5),
  'single_leg_hops': _Curve(DoseKind.reps, 2, 3, 8, 15, perSide: true),
  'high_knees': _Curve(DoseKind.timed, 3, 4, 20, 40, step: 5, rest: 30),
  'burpees': _Curve(DoseKind.reps, 3, 4, 5, 12, rest: 60, secondsPerRep: 4),
  'mountain_pose': _Curve(DoseKind.hold, 2, 3, 20, 45, step: 5, rest: 15),
  'pelvic_shift': _Curve(
    DoseKind.reps,
    2,
    3,
    10,
    20,
    rest: 20,
    secondsPerRep: 4,
  ),
  'table_top': _Curve(DoseKind.hold, 2, 3, 15, 40, step: 5, rest: 20),
  'childs_pose': _Curve(DoseKind.hold, 2, 3, 30, 60, step: 5, rest: 10),
  'puppy_pose': _Curve(DoseKind.hold, 2, 3, 20, 45, step: 5, rest: 15),
  'seated_forward_fold': _Curve(DoseKind.hold, 2, 3, 20, 45, step: 5, rest: 15),
  'standing_side_stretch': _Curve(
    DoseKind.hold,
    2,
    3,
    15,
    30,
    step: 5,
    perSide: true,
    rest: 10,
  ),
  'low_lunge_arch': _Curve(
    DoseKind.hold,
    2,
    3,
    20,
    40,
    step: 5,
    perSide: true,
    rest: 15,
  ),
  'bow_pose': _Curve(DoseKind.hold, 2, 3, 10, 30, step: 5, rest: 20),
  'pilates_roll_over': _Curve(DoseKind.reps, 2, 3, 5, 10, secondsPerRep: 6),
  'legs_up_wall': _Curve(DoseKind.session, 1, 1, 3, 8),
  'spinal_twist': _Curve(
    DoseKind.hold,
    2,
    2,
    20,
    45,
    step: 5,
    perSide: true,
    rest: 10,
  ),
  'chest_stretch': _Curve(
    DoseKind.hold,
    2,
    3,
    20,
    40,
    step: 5,
    perSide: true,
    rest: 10,
  ),
  'scapular_retraction': _Curve(DoseKind.reps, 2, 3, 10, 20, rest: 20),
  'thoracic_extension': _Curve(
    DoseKind.reps,
    2,
    3,
    8,
    15,
    rest: 20,
    secondsPerRep: 4,
  ),
  'hanging_knee_raise': _Curve(DoseKind.reps, 3, 4, 5, 12, rest: 60),
  'scapular_pull': _Curve(DoseKind.reps, 3, 4, 5, 12, rest: 60),
  'pull_ups': _Curve(DoseKind.reps, 3, 4, 2, 8, rest: 90, secondsPerRep: 4),
  'bird_dog': _Curve(DoseKind.reps, 2, 3, 8, 15, perSide: true, rest: 20),
  'dead_bug': _Curve(DoseKind.reps, 2, 3, 8, 15, perSide: true, rest: 20),
  'side_plank': _Curve(
    DoseKind.hold,
    2,
    3,
    15,
    45,
    step: 5,
    perSide: true,
    rest: 20,
  ),
  'wall_sit': _Curve(DoseKind.hold, 3, 3, 20, 60, step: 5, rest: 30),
  'lunges': _Curve(DoseKind.reps, 3, 4, 8, 15, perSide: true, rest: 45),
  'step_ups': _Curve(DoseKind.reps, 3, 4, 8, 15, perSide: true),
  'push_ups': _Curve(DoseKind.reps, 3, 4, 5, 15, rest: 45),
  'single_leg_calf_raise': _Curve(DoseKind.reps, 3, 4, 8, 15, perSide: true),
  'goblet_squat': _Curve(DoseKind.reps, 3, 4, 8, 12, rest: 60),
  'dumbbell_deadlift': _Curve(DoseKind.reps, 3, 4, 8, 12, rest: 60),
  'dumbbell_row': _Curve(DoseKind.reps, 3, 4, 8, 12, perSide: true, rest: 45),
  'farmer_carry': _Curve(DoseKind.timed, 3, 4, 20, 40, step: 5, rest: 45),
  'band_pull_apart': _Curve(DoseKind.reps, 2, 3, 12, 20),
  'calf_pulses': _Curve(DoseKind.timed, 3, 3, 20, 40, step: 5, rest: 20),
  'toe_touch': _Curve(DoseKind.hold, 2, 3, 20, 40, step: 5, rest: 15),
  'downward_dog': _Curve(DoseKind.hold, 2, 3, 20, 45, step: 5, rest: 15),
  'wall_angels': _Curve(DoseKind.reps, 2, 3, 8, 15, rest: 20, secondsPerRep: 3),
  'superman': _Curve(DoseKind.reps, 2, 3, 8, 15, rest: 20, secondsPerRep: 3),
  'knee_circles': _Curve(DoseKind.timed, 2, 2, 15, 30, step: 5, rest: 10),
  'upward_salute': _Curve(DoseKind.hold, 2, 3, 15, 30, step: 5, rest: 10),
  'wall_dog': _Curve(DoseKind.hold, 2, 3, 20, 45, step: 5, rest: 15),
  'chin_tucks': _Curve(DoseKind.reps, 2, 3, 8, 15, rest: 15, secondsPerRep: 3),
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
  'calf_raise': _Curve(DoseKind.reps, 3, 4, 15, 25, rest: 30, secondsPerRep: 2),
  'sprint_intervals': _Curve(DoseKind.timed, 6, 10, 15, 20, step: 5, rest: 45),
  'hiit_workout': _Curve(DoseKind.session, 1, 1, 10, 20),
  // mobility
  'cat_cow': _Curve(DoseKind.reps, 2, 3, 10, 15, rest: 15, secondsPerRep: 4),
  'cobra_stretch': _Curve(DoseKind.hold, 3, 3, 20, 45, step: 5, rest: 15),
  'hip_flexor_stretch': _Curve(
    DoseKind.hold,
    2,
    3,
    30,
    60,
    step: 5,
    perSide: true,
    rest: 15,
  ),
  'evening_yoga': _Curve(DoseKind.session, 1, 1, 10, 20),
  'morning_stretch': _Curve(DoseKind.session, 1, 1, 5, 10),
  'pilates_core': _Curve(DoseKind.session, 1, 1, 10, 20),
  // posture
  'wall_stand': _Curve(DoseKind.hold, 2, 3, 60, 120, step: 15, rest: 20),
  'neck_stretches': _Curve(
    DoseKind.hold,
    2,
    3,
    20,
    30,
    step: 5,
    perSide: true,
    rest: 10,
  ),
  'shoulder_rolls': _Curve(
    DoseKind.reps,
    2,
    3,
    10,
    20,
    rest: 15,
    secondsPerRep: 2,
  ),
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
        out.add(
          MoveDose(
            routineId: id,
            kind: DoseKind.session,
            sets: 1,
            amount: minutes,
          ),
        );
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

  int get level => programLevelOf(index);
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
    programLevelOf(firstOpenProgramDay(completed));

String planKindLabel(AppLocalizations l, PlanDayKind k) => switch (k) {
  PlanDayKind.strength => l.planStrength,
  PlanDayKind.jump => l.planJump,
  PlanDayKind.mobility => l.planMobility,
  PlanDayKind.sport => l.planSport,
  PlanDayKind.posture => l.planPosture,
  PlanDayKind.rest => l.planRest,
};
