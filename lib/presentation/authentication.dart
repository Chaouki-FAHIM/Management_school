import 'package:flutter/material.dart';
import '../main.dart';

class AuthenticationPage extends StatelessWidget {
  // Contrôleurs pour les champs de texte
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un nouveau étudiant"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        width: 500,
        height: 350,
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.person,
              size: 70,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(1.0),
                    color: Colors.grey,
                    child: TextField(
                      controller: _userNameController,
                      decoration: const InputDecoration(
                        hintText: "Nom d'utilisateur",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(1.0),
                    color: Colors.grey,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Mot de passe',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_userNameController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Veuillez remplir tous les champs !!')),
                  );
                } else {
                  bool isAuthenticated = authenticate(
                    _userNameController.text,
                    _passwordController.text,
                  );
                  if (isAuthenticated) {
                    Navigator.pushNamed(context, '/');
                  } else {
                    // Afficher un message d'erreur ou effectuer une autre action
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Échec de l'authentification")),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Couleur de fond du bouton
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
