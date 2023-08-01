import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/pages/authentication/login_page/login_page.dart';
import 'package:pikachu_education/pages/home_page/home_page.dart';
import 'package:pikachu_education/routes/route_management.dart';
import 'package:firebase_core/firebase_core.dart';
import 'blog/blog_login_page/login_bloc.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        localizationsDelegates: const [FormBuilderLocalizations.delegate],
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
