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
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        name: (json['name'] as String?) ?? 'User',
        gender: (json['gender'] as String?) ?? 'male',
        birthDate: (json['birthDate'] as String?) ?? '2000-01-01',
        currentHeight: (json['currentHeight'] as num?)?.toDouble() ?? 170.0,
        weight: (json['weight'] as num?)?.toDouble() ?? 65.0,
        fatherHeight: (json['fatherHeight'] as num?)?.toDouble() ?? 175.0,
        motherHeight: (json['motherHeight'] as num?)?.toDouble() ?? 162.0,
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
        ethnicity: (json['ethnicity'] as String?) ?? '',
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
      );
}
