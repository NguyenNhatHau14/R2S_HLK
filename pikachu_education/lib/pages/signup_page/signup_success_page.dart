import 'package:flutter/material.dart';
import 'package:pikachu_education/components/text_form_field_widget.dart';
import 'package:pikachu_education/data/data_image.dart';
import 'package:pikachu_education/routes/page_name.dart';

import '../../components/snack_bar_custom.dart';

class SignupSuccessPage extends StatefulWidget {
  const SignupSuccessPage({super.key});

  @override
  State<SignupSuccessPage> createState() => _SignupSuccessPageState();
}

class _SignupSuccessPageState extends State<SignupSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return SnackBarCustom.snackBarOfBack(context);
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset(logoImage.image),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 10, right: 10),
                      child: Image.asset('assets/image/yellow_tick.png'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 55, left: 10, right: 10),
                      child: Text('Sign Up Successful',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFDCA15))),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 55, left: 10, right: 10),
                      child: Text(
                          textAlign: TextAlign.center,
                          'Please login again',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 13,
                          color: Colors.transparent,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFFDCA15)),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PageName.loginPage);
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25),
                              )),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
