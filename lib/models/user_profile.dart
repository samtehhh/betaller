class UserProfile {
  final String name;
  final String gender;
  final String birthDate;
  final double currentHeight;
  final double weight;
  final double fatherHeight;
  final double motherHeight;
  final DateTime createdAt;

  UserProfile({
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.currentHeight,
    required this.weight,
    required this.fatherHeight,
    required this.motherHeight,
    DateTime? createdAt,
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
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        name: json['name'],
        gender: json['gender'],
        birthDate: json['birthDate'],
        currentHeight: (json['currentHeight'] as num).toDouble(),
        weight: (json['weight'] as num).toDouble(),
        fatherHeight: (json['fatherHeight'] as num).toDouble(),
        motherHeight: (json['motherHeight'] as num).toDouble(),
        createdAt: DateTime.parse(json['createdAt']),
      );

  UserProfile copyWith({
    String? name,
    String? gender,
    String? birthDate,
    double? currentHeight,
    double? weight,
    double? fatherHeight,
    double? motherHeight,
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
      );
}
