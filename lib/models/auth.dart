import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<User?> getOrCreateUser() async {
    if (currentUser != null) {
      print(currentUser);
      //await _firebaseAuth.signInAnonymously();
    } else
      print("User is not signed in");
    return currentUser;
  }
}
