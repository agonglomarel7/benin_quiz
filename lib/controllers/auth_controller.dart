import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'dart:convert';
import '../services/signup_api_services.dart';

class AuthController {
  static Future<void> inscrire(
      BuildContext context, {
        required String nom,
        required String prenom,
        required String pseudo,
        required String email,
        required String motDePasse,
      }) async {
    try {
      final response = await ApiService.inscription({
        'nom': nom,
        'prenom': prenom,
        'pseudo': pseudo,
        'email': email,
        'mot_de_passe': motDePasse,
      });

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        final utilisateur = User.fromJson(data['utilisateur']);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Succès"),
            content: Text("Votre compte a été bien créé ${utilisateur.prenom}!"),
          ),
        );

// Attendre un peu, puis fermer le dialog et naviguer
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Ferme le dialogue
          Navigator.pop(context); // Navigue vers login
        });


      } else {
        final data = jsonDecode(response.body);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Erreur"),
            content: Text(data['erreur'] ?? 'Erreur inconnue'),
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Erreur"),
          content: Text("Échec de l'inscription : $e"),
        ),
      );
    }
  }
}
