import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<void> logInOrRegister(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('user signed out');
    } catch (e) {
      print(e);
    }
  }
}
