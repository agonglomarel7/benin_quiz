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

  static Future<http.Response> connexion(Map<String, dynamic> data) {
    return http.post(
      Uri.parse('$baseUrl/auth/connexion'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<Map<String, dynamic>?> fetchUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('https://benin-quiz-api.onrender.com/api/auth/profil'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['utilisateur']; // ✅ On retourne directement l'objet utilisateur
    } else {
      return null;
    }
  }


}
