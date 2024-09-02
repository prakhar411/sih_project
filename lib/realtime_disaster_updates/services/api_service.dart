import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/disaster_info.dart';

class ApiService {
  Future<List<DisasterInfo>> fetchDisasterInfo() async {
    try {
      final response = await rootBundle.loadString('assets/mock_data.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => DisasterInfo.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load disaster info');
    }
  }
}
