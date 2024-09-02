class Alert {
  final String type;
  final String message;
  final DateTime timestamp;

  Alert({
    required this.type,
    required this.message,
    required this.timestamp,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      type: json['type'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
