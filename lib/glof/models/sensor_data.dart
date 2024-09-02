class SensorData {
  final double elevation;
  final double slope;
  final double aspect;

  SensorData({
    required this.elevation,
    required this.slope,
    required this.aspect,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      elevation: json['elevation'],
      slope: json['slope'],
      aspect: json['aspect'],
    );
  }
}
