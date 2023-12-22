import 'package:ui_authentification/model/type_personne.dart';

import 'personne.dart';

class Etudiant extends Personne {
  String _anneeScolaire;

  // Constructeur
  Etudiant(
      int id, String nom, String prenom, String matricule, this._anneeScolaire)
      : super(id, nom, prenom, matricule, TypePersonne.ETUDIANT);

  // Getter et Setter pour l'année scolaire
  String get anneeScolaire => _anneeScolaire;
  set anneeScolaire(String value) => _anneeScolaire = value;

  // Méthode pour afficher les détails de l'étudiant
  @override
  void afficherDetails() {
    super.afficherDetails();
    print('Année Scolaire: $_anneeScolaire');
  }
}
