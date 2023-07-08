import 'package:flutter/material.dart';

import 'package:pikachu_education/pages/home_page_test.dart';

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
      home:  HomePage(),
      onGenerateRoute: generateRoute,
    );
  }
}
