import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/dialog_custom.dart';

class LoginWithEmail {
  static Future<void> login(
      String email, String password, BuildContext context) async {
    bool checkLogin;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {}
      if (e.code == 'user-not-found') {
        print(e.code);
        showDialog(
          context: context,
          builder: (context) => DialogCustom.dialogOfInvalidEmail(context),
        );
      }
      if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) => DialogCustom.dialogOfWrongPassword(context),
        );
      }
    }
  }
}
