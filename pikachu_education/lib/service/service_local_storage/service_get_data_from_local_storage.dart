import 'dart:ui';

import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetDataFromLocal {

  static Future<void> loadDataForLogin(
      {required String emailController, required String passwordController, required VoidCallback setState}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user') ?? '';
    var password = prefs.getString('password') ?? '';
    emailController=user;
    passwordController=password;
    setState;
  }


}