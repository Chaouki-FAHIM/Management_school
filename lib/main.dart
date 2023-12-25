import 'package:flutter/material.dart';
import 'presentation/home.dart';
import 'presentation/authentication.dart';
import 'presentation/student/create.dart';
import 'presentation/professor/create.dart';
import 'model/professeur.dart';
import 'model/etudiant.dart';
import 'model/sexe.dart';
import 'model/session.dart';

bool authenticate(String username, String password) {
  for (var prof in professeurs) {
    if (prof.username == username && prof.motPasse == password) {
      sessionManager.currentUser = prof;
      return true;
    }
  }

  for (var std in students) {
    if (std.username == username && std.motPasse == password) {
      sessionManager.currentUser = std;
      return true;
    }
  }
  return false;
}

List<Professeur> professeurs = [];
List<Etudiant> students = [];

void main() {
  professeurs = [
    Professeur.compte(professeurs.length + 1, "Dupont", "Jean", "1234",
        Sexe.HOMME, "Mathématiques", [], "prof1", "Dupont"),
    Professeur.compte(professeurs.length + 1, "Martin", "Alice", "5678",
        Sexe.FEMME, "Histoire", [], "prof2", "Martin"),
  ];
  students = [
    Etudiant.compte(professeurs.length + 1, "Dupont", "Jean", "1234",
        Sexe.HOMME, 2023, "etud3", "Asmae"),
    Etudiant.compte(professeurs.length + 1, "Martin", "Alice", "5678",
        Sexe.FEMME, 2023, "etud4", "Lina"),
  ];

  // Ajout de devoirs pour le test
  // professeurs[0].ajouterDevoir(Devoir(1, "Devoir1", DateTime.now(), DateTime.now().addpro(Duration(days: 7))));
  // professeurs[1].ajouterDevoir(Devoir(2, "Devoir2", DateTime.now(), DateTime.now().add(Duration(days: 14))));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/auth': (context) => AuthenticationPage(),
        '/etudiant/create': (context) => const CreateStudent(),
        '/professor/create': (context) => const CreateProfessor(),
      },
    );
  }
}
