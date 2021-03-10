import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<bool> logInOrRegister(String email, String password) async {
    bool isLoggedIn = false;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isLoggedIn = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        isLoggedIn = true;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        isLoggedIn = false;
      }
    }
    return isLoggedIn;
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
