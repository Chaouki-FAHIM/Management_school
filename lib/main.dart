import 'package:flutter/material.dart';
import 'presentation/home.dart';
import 'presentation/authentication.dart';
import 'presentation/crud/student/create.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(), // Route par défaut
        '/auth': (context) => AuthenticationPage(),
        '/etudiant/create': (context) => CreateStudent(title: "Mama"),
      },
      // La propriété 'home' a été supprimée pour éviter la confusion
    );
  }
}
