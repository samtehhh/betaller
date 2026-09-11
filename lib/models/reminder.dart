/// A reminder the user controls: one of the built-in categories, or one they
/// created themselves.
class Reminder {
  /// Stable id. Built-in reminders use their category name, custom ones a
  /// timestamp, so ids never collide.
  final String id;

  /// water | exercise | routine | sleep | posture | nutrition | measurement
  /// | custom
  final String category;

  /// Only custom reminders carry their own words.
  final String label;

  final bool enabled;
  final int hour;
  final int minute;

  /// Empty means every day. Otherwise DateTime.monday..sunday.
  final List<int> weekdays;

  const Reminder({
    required this.id,
    required this.category,
    this.label = '',
    this.enabled = true,
    required this.hour,
    required this.minute,
    this.weekdays = const [],
  });

  bool get isCustom => category == 'custom';
  bool get isDaily => weekdays.isEmpty || weekdays.length == 7;

  String get timeLabel =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  Reminder copyWith({
    bool? enabled,
    int? hour,
    int? minute,
    List<int>? weekdays,
    String? label,
  }) => Reminder(
    id: id,
    category: category,
    label: label ?? this.label,
    enabled: enabled ?? this.enabled,
    hour: hour ?? this.hour,
    minute: minute ?? this.minute,
    weekdays: weekdays ?? this.weekdays,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'label': label,
    'enabled': enabled,
    'hour': hour,
    'minute': minute,
    'weekdays': weekdays,
  };

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
    id: json['id'] as String? ?? 'custom',
    category: json['category'] as String? ?? 'custom',
    label: json['label'] as String? ?? '',
    enabled: json['enabled'] as bool? ?? true,
    hour: (json['hour'] as num?)?.toInt() ?? 9,
    minute: (json['minute'] as num?)?.toInt() ?? 0,
    weekdays: ((json['weekdays'] as List?) ?? [])
        .map((e) => (e as num).toInt())
        .toList(),
  );
}

/// What the app suggests before the user changes anything.
const List<Reminder> kDefaultReminders = [
  Reminder(id: 'exercise', category: 'exercise', hour: 7, minute: 30),
  Reminder(id: 'nutrition', category: 'nutrition', hour: 12, minute: 0),
  Reminder(id: 'water', category: 'water', hour: 14, minute: 0),
  Reminder(id: 'posture', category: 'posture', hour: 16, minute: 0),
  Reminder(id: 'routine', category: 'routine', hour: 20, minute: 30),
  Reminder(id: 'sleep', category: 'sleep', hour: 22, minute: 0),
  Reminder(
    id: 'measurement',
    category: 'measurement',
    hour: 10,
    minute: 0,
    weekdays: [DateTime.sunday],
  ),
];

/// The suggested reminders, set against the hours the user actually keeps.
///
/// The constants above are a guess at an average day. Somebody who trains at
/// six in the morning does not want to be told to at half past seven, and a
/// night owl nudged to sleep at ten has already learned to ignore the app. The
/// onboarding asks; this is where the answers land.
///
/// Anything the profile does not know keeps its default.
List<Reminder> remindersForProfile({
  required String bedtime,
  required String workoutTime,
  required List<String> mealTimes,
}) {
  (int, int)? parse(String value) {
    final parts = value.split(':');
    if (parts.length != 2) return null;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null || h < 0 || h > 23 || m < 0 || m > 59) {
      return null;
    }
    return (h, m);
  }

  /// Wind a time back by [minutes], wrapping past midnight.
  (int, int) earlier((int, int) t, int minutes) {
    final total = (t.$1 * 60 + t.$2 - minutes + 24 * 60) % (24 * 60);
    return (total ~/ 60, total % 60);
  }

  final bed = parse(bedtime);
  final workout = parse(workoutTime);

  // The middle meal is the one worth a nudge: the first is usually habit and
  // the last rarely gets forgotten.
  final meals = mealTimes.map(parse).whereType<(int, int)>().toList();
  final nutrition = meals.isEmpty ? null : meals[meals.length ~/ 2];

  return [
    for (final r in kDefaultReminders)
      switch (r.category) {
        // Half an hour before training, which is when it is still useful.
        'exercise' when workout != null => () {
          final at = earlier(workout, 30);
          return r.copyWith(hour: at.$1, minute: at.$2);
        }(),
        'nutrition' when nutrition != null => r.copyWith(
          hour: nutrition.$1,
          minute: nutrition.$2,
        ),
        // An hour before bed: late enough to be relevant, early enough to act
        // on.
        'sleep' when bed != null => () {
          final at = earlier(bed, 60);
          return r.copyWith(hour: at.$1, minute: at.$2);
        }(),
        // The evening routine belongs between dinner and bed.
        'routine' when bed != null => () {
          final at = earlier(bed, 150);
          return r.copyWith(hour: at.$1, minute: at.$2);
        }(),
        _ => r,
      },
  ];
}

/// The next reminder that will actually fire, and when.
///
/// Returns null when nothing is enabled. Used to surface "what is coming"
/// rather than making the user open the panel to find out.
({Reminder reminder, DateTime at})? nextReminder(
  List<Reminder> reminders, {
  DateTime? from,
}) {
  final now = from ?? DateTime.now();
  ({Reminder reminder, DateTime at})? best;

  for (final r in reminders) {
    if (!r.enabled) continue;

    DateTime? candidate;
    if (r.isDaily) {
      var t = DateTime(now.year, now.month, now.day, r.hour, r.minute);
      if (!t.isAfter(now)) t = t.add(const Duration(days: 1));
      candidate = t;
    } else {
      for (final day in r.weekdays) {
        var t = DateTime(now.year, now.month, now.day, r.hour, r.minute);
        while (t.weekday != day || !t.isAfter(now)) {
          t = t.add(const Duration(days: 1));
        }
        if (candidate == null || t.isBefore(candidate)) candidate = t;
      }
    }

    if (candidate == null) continue;
    if (best == null || candidate.isBefore(best.at)) {
      best = (reminder: r, at: candidate);
    }
  }
  return best;
}
