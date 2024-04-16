import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String nom;
  final String prenom;
  final String sexe;
  final String description;
  final Timestamp date;

  Users({
    required this.nom,
    required this.prenom,
    required this.sexe,
    required this.description,
    required this.date,
  });

  factory Users.formData(dynamic data) {
    return Users(
        nom: data["Nom"],
        prenom: data["prenom"],
        sexe: data["sexe"],
        description: data["description"],
        date: data["date"]);
  }
}
