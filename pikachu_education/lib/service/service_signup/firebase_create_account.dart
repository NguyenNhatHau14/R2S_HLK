import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/dialog_custom.dart';

class CreateAccount {
  static Future<void> signup(String user, String email, String password,BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (context) => DialogCustom.dialogOfEmailUseAlready(context),
        );
      }
    }
  }
}

