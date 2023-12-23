import 'package:ui_authentification/model/type_personne.dart';

import 'personne.dart';
import 'devoir.dart';
import 'sexe.dart';

class Professeur extends Personne {
  String _matiere;
  List<Devoir> _listeDevoirs;
  // Constructeur
  Professeur(int id, String nom, String prenom, String matricule, Sexe sexe,
      this._matiere, this._listeDevoirs)
      : super(id, nom, prenom, matricule, TypePersonne.PROFESSEUR, sexe);
  Professeur.compte(
      int id,
      String nom,
      String prenom,
      String matricule,
      Sexe sexe,
      this._matiere,
      this._listeDevoirs,
      String username,
      String motPasse)
      : super(id, nom, prenom, matricule, TypePersonne.PROFESSEUR, sexe,
            username: username, motPasse: motPasse);

  // Getter pour la liste des devoirs
  List<Devoir> get listeDevoirs => _listeDevoirs;

  // Méthode pour ajouter un devoir à la liste
  void ajouterDevoir(Devoir devoir) {
    _listeDevoirs.add(devoir);
  }

  // Méthode pour afficher les détails du professeur, y compris la liste des devoirs
  @override
  void afficherDetails() {
    super.afficherDetails();
    print('Liste des Devoirs:');
    for (var devoir in _listeDevoirs) {
      print(
          'ID de Devoir: ${devoir.id}, Référence: ${devoir.reference}, Date de Création: ${devoir.dateCreation}, Date Limite: ${devoir.dateLimite}');
    }
  }
}
