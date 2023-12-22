import 'package:flutter/material.dart';
import 'home.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un nouveau étudiant"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Container(
        width: 500,
        height: 350,
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(212, 115, 212, 1), // Correction
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.person,
              size: 70,
              color: Colors.white,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Enter your username",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(fontSize: 5, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Enter your password",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(fontSize: 5, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Couleur de fond du bouton
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
