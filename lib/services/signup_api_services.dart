import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'https://benin-quiz-api.onrender.com/api';
  //final String baseUrl = "https://benin-quiz-api.onrender.com/api";

  static Future<http.Response> inscription(Map<String, dynamic> data) {
    return http.post(
      Uri.parse('$baseUrl/auth/inscription'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  static Future<http.Response> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return http.get(
      Uri.parse('$baseUrl/user/profil'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }
}
