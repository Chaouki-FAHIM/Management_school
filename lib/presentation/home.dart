import 'package:flutter/material.dart';
import '../model/session.dart';
import '../main.dart';
import '../widgets/card/professeur.dart';
import '../widgets/card/etudiant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // test d'exsitance de la session d'authentification
    if (!sessionManager.isAuthenticated) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/auth'));
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page d'accueil"),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profil'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text('Etudiants'),
                onTap: () {
                  Navigator.pushNamed(context, '/etudiant/create');
                },
              ),
              ListTile(
                leading: const Icon(Icons.cast_for_education),
                title: const Text('Professeurs'),
                onTap: () {
                  Navigator.pushNamed(context, '/professor/create');
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Déconnexion'),
                onTap: () {
                  sessionManager.currentUser = null;
                  Navigator.pushNamed(context, '/auth');
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Text(
            'Liste des Professeurs',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),ListView.builder(
              itemCount: professeurs.length,
              itemBuilder: (context, index) {
                return ProfesseurTile(professeur: professeurs[index]);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return EdutiantTile(etudiant: students[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
