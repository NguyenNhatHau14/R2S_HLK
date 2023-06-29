import 'package:flutter/material.dart';
import 'package:pikachu_education/pages/signup_page/profile_page.dart';

import 'package:pikachu_education/routes/route_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const ProfilePage(),
      onGenerateRoute: generateRoute,
    );
  }
}
