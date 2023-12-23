import 'professeur.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  Professeur? currentUser;

  bool get isAuthenticated => currentUser != null;
}

final sessionManager = SessionManager();
