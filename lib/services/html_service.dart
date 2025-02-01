// iOS http_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class HttpService {
  final String raspberryPiIp;

  HttpService({required this.raspberryPiIp});

  Future<Map<String, dynamic>?> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://$raspberryPiIp:8080/'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint("📥 Received Data: \$data");
        return data;
      } else {
        debugPrint("⚠️ Failed to fetch data: \${response.statusCode}");
      }
    } catch (e) {
      debugPrint("❌ Error fetching data: \$e");
    }
    return null;
  }

  Future<bool> sendData(Map<String, dynamic> updatedData) async {
    try {
      final response = await http.post(
        Uri.parse('http://$raspberryPiIp:8080/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        debugPrint("📤 Data sent successfully");
        return true;
      } else {
        debugPrint("⚠️ Failed to send data: \${response.statusCode}");
      }
    } catch (e) {
      debugPrint("❌ Error sending data: \$e");
    }
    return false;
  }
}