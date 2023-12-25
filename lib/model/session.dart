import 'personne.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  Personne? currentUser;

  bool get isAuthenticated => currentUser != null;
}

final sessionManager = SessionManager();
