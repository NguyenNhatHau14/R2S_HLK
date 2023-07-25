import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/pages/answer_page/list_answer_page.dart';
import 'package:pikachu_education/pages/authentication/login_page.dart';
import 'package:pikachu_education/pages/home_page/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pikachu_education/routes/route_management.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginPage(),
      localizationsDelegates: const [FormBuilderLocalizations.delegate],
      onGenerateRoute: generateRoute,
    );
  }
}
