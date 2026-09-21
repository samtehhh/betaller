/// What the app actually asks of the user on a given day, week and month.
///
/// The catalogue holds 29 routines, but nobody runs 29 of them in a day. The
/// day's plan is the weekday's training block plus the habits that repeat
/// every day, which is what progress and streaks are measured against.
library;

/// Training block per weekday, Monday first.
const List<List<String>> kWeekdayRoutineIds = [
  ['morning_stretch', 'bar_hanging', 'jumping', 'posture_check'],
  ['cobra_stretch', 'evening_yoga', 'water', 'quality_sleep'],
  ['morning_stretch', 'swimming_basketball', 'protein', 'posture_check'],
  ['bar_hanging', 'sprint_intervals', 'calcium_vitamin_d', 'no_screen'],
  ['cobra_stretch', 'hiit_workout', 'zinc_intake', 'sleep_environment'],
  ['morning_stretch', 'pilates_core', 'water', 'vitamin_d_sunlight'],
  ['evening_yoga', 'inversion_hang', 'pre_sleep_routine', 'quality_sleep'],
];

/// Habits that carry every day regardless of the training block.
const List<String> kDailyCoreRoutineIds = [
  'water',
  'protein',
  'quality_sleep',
  'posture_check',
];

/// The routines expected today, in a stable order and without duplicates.
List<String> dailyPlanIds([DateTime? date]) {
  final day = date ?? DateTime.now();
  final weekday = kWeekdayRoutineIds[(day.weekday - 1) % 7];
  final ids = <String>[];
  for (final id in [...weekday, ...kDailyCoreRoutineIds]) {
    if (!ids.contains(id)) ids.add(id);
  }
  return ids;
}

/// Monday of the week [date] falls in, as a yyyy-MM-dd key.
String weekKey([DateTime? date]) {
  final d = date ?? DateTime.now();
  final monday = DateTime(d.year, d.month, d.day)
      .subtract(Duration(days: d.weekday - 1));
  return '${monday.year}-${monday.month.toString().padLeft(2, '0')}-${monday.day.toString().padLeft(2, '0')}';
}

/// yyyy-MM key for [date].
String monthKey([DateTime? date]) {
  final d = date ?? DateTime.now();
  return '${d.year}-${d.month.toString().padLeft(2, '0')}';
}

/// What a full week of discipline looks like.
const int kWeeklyPerfectDays = 5;
const int kWeeklyWorkouts = 3;
const int kWeeklyMeasurements = 1;

/// And a full month.
const int kMonthlyPhotos = 1;
const int kMonthlyPostureChecks = 1;
const int kMonthlyMeasurements = 2;
