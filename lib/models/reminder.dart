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
  }) =>
      Reminder(
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
