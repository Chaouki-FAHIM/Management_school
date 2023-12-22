import 'package:ui_authentification/model/type_personne.dart';

import 'personne.dart';
import 'devoir.dart';

class Professeur extends Personne {
  List<Devoir> _listeDevoirs;

  // Constructeur
  Professeur(
      int id, String nom, String prenom, String matricule, this._listeDevoirs)
      : super(id, nom, prenom, matricule, TypePersonne.PROFESSEUR);

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
