class Routine {
  final String id;
  final String title;
  final String description;
  final String category;
  final String duration;
  final String icon;
  bool completed;

  // New optional fields
  final List<String> musclesTargeted;
  final String scientificBasis;
  final String formDescription;
  final String setsReps;
  final int? timerSeconds;
  final String difficulty;

  Routine({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.duration,
    required this.icon,
    this.completed = false,
    this.musclesTargeted = const [],
    this.scientificBasis = '',
    this.formDescription = '',
    this.setsReps = '',
    this.timerSeconds,
    this.difficulty = 'beginner',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'duration': duration,
        'icon': icon,
        'completed': completed,
        'musclesTargeted': musclesTargeted,
        'scientificBasis': scientificBasis,
        'formDescription': formDescription,
        'setsReps': setsReps,
        'timerSeconds': timerSeconds,
        'difficulty': difficulty,
      };

  factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        duration: json['duration'],
        icon: json['icon'],
        completed: json['completed'] ?? false,
        musclesTargeted: (json['musclesTargeted'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            const [],
        scientificBasis: json['scientificBasis'] ?? '',
        formDescription: json['formDescription'] ?? '',
        setsReps: json['setsReps'] ?? '',
        timerSeconds: json['timerSeconds'] as int?,
        difficulty: json['difficulty'] ?? 'beginner',
      );
}
