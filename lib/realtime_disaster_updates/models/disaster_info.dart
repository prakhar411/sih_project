class DisasterInfo {
  final String title;
  final String category;
  final String description;
  final DateTime timestamp;

  DisasterInfo({
    required this.title,
    required this.category,
    required this.description,
    required this.timestamp,
  });

  factory DisasterInfo.fromJson(Map<String, dynamic> json) {
    return DisasterInfo(
      title: json['title'],
      category: json['category'],
      description: json['description'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
