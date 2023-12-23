import 'package:flutter/material.dart';
import '../model/session.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // test d'exsitance de la session d'authentification
    if (!sessionManager.isAuthenticated) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/auth'));
      return Scaffold(body: Center(child: CircularProgressIndicator()));
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
      body: Center(
        child: Text("Liste des devoirs"),
      ),
    );
  }
}
