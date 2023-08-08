import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../pages/authentication/component/dialog_custom.dart';

class LoginService {


  static Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
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
      return false;
    }
    return true;
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }


  static Future<bool> checkAlreadyLogin() async {
    var userId = FirebaseAuth.instance.currentUser;
    if(userId==null){
      return false;
    }
    else {
      return true;
    }
  }

  static Future<String> getUserId() async {
    var currentUserId =
        await FirebaseAuth.instance.currentUser?.uid.toString() ?? '';
    return currentUserId;
  }




}
