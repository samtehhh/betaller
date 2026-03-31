class HeightRecord {
  final String date;
  final double height;

  HeightRecord({required this.date, required this.height});

  Map<String, dynamic> toJson() => {'date': date, 'height': height};

  factory HeightRecord.fromJson(Map<String, dynamic> json) => HeightRecord(
        date: json['date'],
        height: (json['height'] as num).toDouble(),
      );
}
