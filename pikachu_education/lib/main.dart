import 'package:flutter/material.dart';
import 'package:pikachu_education/pages/login_page.dart';
import 'package:pikachu_education/routes/route_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const LoginPage(),
      onGenerateRoute: generateRoute,
    );
  }
}
