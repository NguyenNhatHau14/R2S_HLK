import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/pages/home_page.dart';
import 'package:pikachu_education/pages/list_answer_page.dart';
import 'package:pikachu_education/routes/route_management.dart';

import 'components/draft.dart';

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
      home: HomePage(),
      localizationsDelegates: const [FormBuilderLocalizations.delegate],
      onGenerateRoute: generateRoute,
    );
  }
}
