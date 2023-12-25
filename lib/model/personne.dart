import 'package:ui_authentification/model/type_personne.dart';
import 'sexe.dart';

abstract class Personne {
  int _id;
  String _nom;
  String _prenom;
  String _matricule;
  TypePersonne _type;
  Sexe _sexe;
  String? username;
  String? motPasse;

  // Constructeur
  Personne(this._id, this._nom, this._prenom, this._matricule, this._type,
      this._sexe,
      {this.username, this.motPasse});
  Personne.compte(this._id, this._nom, this._prenom, this._matricule,
      this._sexe, this._type, this.username, this.motPasse);

  int get id => _id;
  set id(int value) => _id = value;

  String get nom => _nom;
  set nom(String value) => _nom = value;

  String get prenom => _prenom;
  set prenom(String value) => _prenom = value;

  String get matricule => _matricule;
  set matricule(String value) => _matricule = value;

  Sexe get sexe => _sexe;
  set sexe(Sexe value) => _sexe = value;

  void afficherDetails() {
    print('ID: $_id');
    print('Nom: $_nom');
    print('Prénom: $_prenom');
    print('Matricule: $_matricule');
  }
}
