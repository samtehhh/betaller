class Routine {
  final String id;
  final String title;
  final String description;
  final String category;
  final String duration;
  final String icon;
  bool completed;

  Routine({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.duration,
    required this.icon,
    this.completed = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'duration': duration,
        'icon': icon,
        'completed': completed,
      };

  factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        duration: json['duration'],
        icon: json['icon'],
        completed: json['completed'] ?? false,
      );
}
