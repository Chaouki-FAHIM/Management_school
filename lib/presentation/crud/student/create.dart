import 'package:flutter/material.dart';
import '../../../model/session.dart';

class CreateStudent extends StatefulWidget {
  const CreateStudent({super.key});
  @override
  State<CreateStudent> createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  // Contrôleurs pour les champs de texte
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _matriculeController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Valeur par défaut du choix Sexe
  String _selectedGender = 'Homme';
  Color firstNameColor = Colors.grey;
  Color lastNameColor = Colors.grey;
  Color matriculeColor = Colors.grey;
  Color userNameColor = Colors.grey;
  Color passwordColor = Colors.grey;
  Color confirmPasswordColor = Colors.grey;

  // Fonction du contrôle
  void _handleSubmit() {
    // Vérifiez chaque champ et affichez un message si nécessaire
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _matriculeController.text.isEmpty ||
        _userNameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs !!')),
      );
    } else if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('La confirmation du mot de passe est incorrecte !!')),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    if (!sessionManager.isAuthenticated) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/auth'));
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Ajouter un nouveau étudiant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // ligne 1
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      color: Colors.grey,
                      child: TextField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          hintText: 'Nom',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      color: Colors.grey,
                      child: TextField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          hintText: 'Prénom',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // ligne 2
              Container(
                padding: const EdgeInsets.all(1.0),
                color: Colors.grey,
                child: TextField(
                  controller: _matriculeController,
                  decoration: const InputDecoration(
                    hintText: 'Matricule',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // ligne 3
              const Text(
                'Sexe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 'Homme',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                      const Text('Homme'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Femme',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                      const Text('Femme'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // ligne 4
              Row(
                children: [
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
              const SizedBox(height: 16),
              // ligne 5
              Container(
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
              const SizedBox(height: 16),
              // ligne 6
              Container(
                padding: const EdgeInsets.all(1.0),
                color: Colors.grey,
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirmation du mot de passe',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // ligne 7
              ElevatedButton(
                onPressed: _handleSubmit,
                child: const Center(child: Text('Enregistrer')),
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
