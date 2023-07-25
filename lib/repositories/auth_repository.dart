import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoty {
  final _firebaseAuth = FirebaseAuth.instance;

  //registration method
  Future signUp({required String email, required String password}) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('Wrong password');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email');
      }
      throw Exception(e.toString());
    }
  }
}
