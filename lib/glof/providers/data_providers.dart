// lib/providers/data_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sensor_data.dart';
import '../models/alert.dart';
import '../services/api_service.dart';

class Data {
  final ApiService apiService =
      ApiService('https://portal.opentopography.org/API/');

  Future<SensorData> fetchSensorData() async {
    try {
      return await apiService.fetchSensorData();
    } catch (e) {
      throw Exception('Failed to fetch sensor data: $e');
    }
  }

  Future<List<Alert>> fetchAlerts() async {
    try {
      return await apiService.fetchAlerts();
    } catch (e) {
      throw Exception('Failed to fetch alerts: $e');
    }
  }
}

// Provider for Data class
final dataProvider = Provider<Data>((ref) => Data());

// Provider for Sensor Data
final sensorDataProvider = FutureProvider<SensorData>((ref) async {
  final data = ref.read(dataProvider);
  return await data.fetchSensorData();
});
