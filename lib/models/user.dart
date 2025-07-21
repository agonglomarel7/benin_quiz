class User {
  final int id;
  final String nom;
  final String prenom;
  final String pseudo;
  final String email;
  final DateTime dateCreation;

  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.pseudo,
    required this.email,
    required this.dateCreation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      pseudo: json['pseudo'],
      email: json['email'],
      dateCreation: DateTime.parse(json['date_creation']),
    );
  }
}
