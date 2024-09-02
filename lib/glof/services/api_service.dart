import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sensor_data.dart';
import '../models/alert.dart';

class ApiService {
  final String baseUrl;
  final String apiKey =
      '89ba1fc621bb6575f9e931b857a7540d'; // Replace with your API key if needed

  ApiService(this.baseUrl);

  Future<SensorData> fetchSensorData() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/dem?query=glacial_lake&api_key=$apiKey'),
      );
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return SensorData.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load sensor data');
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
      throw Exception('Failed to fetch sensor data: $e');
    }
  }

  Future<List<Alert>> fetchAlerts() async {
    // Implement alert fetching if the API provides such data
    final response = await http.get(
      Uri.parse('$baseUrl/alerts?api_key=$apiKey'),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Alert.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load alerts');
    }
  }
}
