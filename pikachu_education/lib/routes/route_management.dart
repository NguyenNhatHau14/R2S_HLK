import 'package:flutter/material.dart';
import 'package:pikachu_education/pages/answer_page.dart';
import 'package:pikachu_education/pages/change_password_page.dart';
import 'package:pikachu_education/routes/page_name.dart';
import 'package:pikachu_education/pages/login_page.dart';

var generateRoute = (settings) {
  switch (settings.name) {
    case PageName.loginPage:
      {
        return MaterialPageRoute(builder: (context) => const LoginPage());
      }
    case PageName.signupPage:
      {
        return MaterialPageRoute(builder: (context) => const LoginPage());
      }
    case PageName.changePasswordPage:
      {
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordPage());
      }
    case PageName.answerPage:
      {
        return MaterialPageRoute(builder: (context) => const AnswerPage());
      }
  }
};
