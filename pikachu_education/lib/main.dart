import 'package:flutter/material.dart';
import 'package:pikachu_education/pages/detail_answer_with_like_page.dart';
import 'package:pikachu_education/pages/signup_page/profile_page.dart';
import 'package:pikachu_education/pages/list_answer_page.dart';
import 'package:pikachu_education/pages/login_page.dart';
import 'package:pikachu_education/routes/route_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const LoginPage(),
      onGenerateRoute: generateRoute,
    );
  }
}
