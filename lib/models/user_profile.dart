/// The minute of the day a habit sits at, stored as "HH:mm".
///
/// Kept as a string rather than a TimeOfDay so it survives JSON without a
/// converter, and sorts the way it reads.
typedef ClockTime = String;

class UserProfile {
  final String name;
  final String gender;
  final String birthDate;
  final double currentHeight;
  final double weight;
  final double fatherHeight;
  final double motherHeight;
  final DateTime createdAt;
  final String ethnicity;

  /// When the user usually goes to sleep. The sleep reminder is scheduled
  /// against this rather than a fixed 22:00 that suits nobody in particular.
  final ClockTime bedtime;

  /// When they usually train, for the exercise reminder.
  final ClockTime workoutTime;

  /// The times they eat, in order. Its length is how many meals a day they
  /// have, so the two questions share one answer.
  final List<ClockTime> mealTimes;

  /// Grams of protein a day, as the user reckons it.
  final int dailyProtein;

  /// Calories a day, as the user reckons it.
  final int dailyCalories;

  UserProfile({
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.currentHeight,
    required this.weight,
    required this.fatherHeight,
    required this.motherHeight,
    DateTime? createdAt,
    this.ethnicity = '',
    this.bedtime = '23:00',
    this.workoutTime = '18:00',
    this.mealTimes = const ['08:00', '13:00', '19:00'],
    this.dailyProtein = 0,
    this.dailyCalories = 0,
  }) : createdAt = createdAt ?? DateTime.now();

  int get age {
    final birth = DateTime.parse(birthDate);
    final now = DateTime.now();
    int a = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      a--;
    }
    return a;
  }

  /// How many meals a day — the answer to "kaç öğün", read off [mealTimes].
  int get mealCount => mealTimes.length;

  /// [bedtime] as (hour, minute), or null if it was never answered properly.
  static (int, int)? parseTime(ClockTime value) {
    final parts = value.split(':');
    if (parts.length != 2) return null;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null) return null;
    if (h < 0 || h > 23 || m < 0 || m > 59) return null;
    return (h, m);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'birthDate': birthDate,
        'currentHeight': currentHeight,
        'weight': weight,
        'fatherHeight': fatherHeight,
        'motherHeight': motherHeight,
        'createdAt': createdAt.toIso8601String(),
        'ethnicity': ethnicity,
        'bedtime': bedtime,
        'workoutTime': workoutTime,
        'mealTimes': mealTimes,
        'dailyProtein': dailyProtein,
        'dailyCalories': dailyCalories,
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        name: (json['name'] as String?) ?? 'User',
        gender: (json['gender'] as String?) ?? 'male',
        birthDate: (json['birthDate'] as String?) ?? '2000-01-01',
        currentHeight: (json['currentHeight'] as num?)?.toDouble() ?? 170.0,
        weight: (json['weight'] as num?)?.toDouble() ?? 65.0,
        fatherHeight: (json['fatherHeight'] as num?)?.toDouble() ?? 175.0,
        motherHeight: (json['motherHeight'] as num?)?.toDouble() ?? 162.0,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'] as String)
            : DateTime.now(),
        ethnicity: (json['ethnicity'] as String?) ?? '',
        // Anyone who onboarded before these questions existed keeps the
        // defaults rather than an empty schedule.
        bedtime: (json['bedtime'] as String?) ?? '23:00',
        workoutTime: (json['workoutTime'] as String?) ?? '18:00',
        mealTimes: (json['mealTimes'] as List?)?.cast<String>() ??
            const ['08:00', '13:00', '19:00'],
        dailyProtein: (json['dailyProtein'] as num?)?.toInt() ?? 0,
        dailyCalories: (json['dailyCalories'] as num?)?.toInt() ?? 0,
      );

  UserProfile copyWith({
    String? name,
    String? gender,
    String? birthDate,
    double? currentHeight,
    double? weight,
    double? fatherHeight,
    double? motherHeight,
    String? ethnicity,
    ClockTime? bedtime,
    ClockTime? workoutTime,
    List<ClockTime>? mealTimes,
    int? dailyProtein,
    int? dailyCalories,
  }) =>
      UserProfile(
        name: name ?? this.name,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        currentHeight: currentHeight ?? this.currentHeight,
        weight: weight ?? this.weight,
        fatherHeight: fatherHeight ?? this.fatherHeight,
        motherHeight: motherHeight ?? this.motherHeight,
        createdAt: createdAt,
        ethnicity: ethnicity ?? this.ethnicity,
        bedtime: bedtime ?? this.bedtime,
        workoutTime: workoutTime ?? this.workoutTime,
        mealTimes: mealTimes ?? this.mealTimes,
        dailyProtein: dailyProtein ?? this.dailyProtein,
        dailyCalories: dailyCalories ?? this.dailyCalories,
      );
}
