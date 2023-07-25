import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount {
  static Future<void> signup(String user, String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}

