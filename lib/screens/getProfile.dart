import 'package:benin_quiz/screens/loginScreen.dart';
import 'package:benin_quiz/services/signup_api_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: FutureBuilder<Map<String, dynamic>?>(
      future: ApiService().fetchUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data != null) {
          final user = snapshot.data!;
          final nom = user['nom'] ?? '';
          final prenom = user['prenom'] ?? '';
          final initials = "${prenom.isNotEmpty ? prenom[0] : ''}${nom.isNotEmpty ? nom[0] : ''}".toUpperCase();

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("$prenom $nom"),
                accountEmail: Text(user['email'] ?? ''),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(initials, style: const TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Accueil'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profil'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Déconnexion'),
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  }
                },
              ),
            ],
          );
        } else {
          return const Center(child: Text("Erreur de chargement du profil"));
        }
      },
    ),
  );
}
