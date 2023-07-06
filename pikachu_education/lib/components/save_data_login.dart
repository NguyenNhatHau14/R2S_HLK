import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveDataForLogin(BuildContext context,String user, String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', user);
  await prefs.setString('password', password);
}
