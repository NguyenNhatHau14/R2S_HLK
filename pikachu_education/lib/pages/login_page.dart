import 'package:flutter/material.dart';
import 'package:pikachu_education/components/text_form_field_widget.dart';
import 'package:pikachu_education/data/data_image.dart';
import 'package:pikachu_education/routes/page_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final keyOfLogin = GlobalKey<FormState>();
  bool checkRememberMe = false;
  bool showPassword = true;
  bool showPasswordIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: keyOfLogin,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back, size: 30)),
                        ],
                      ),
                    ),
                    Image.asset(logoImage.image),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'User',
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0x4D000000)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'User can not be empty';
                          }
                          RegExp userExp =
                              RegExp('^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}\$');
                          if (!userExp!.hasMatch(value)) {
                            return 'Your User is invalid';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscuringCharacter: '*',
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0x4D000000)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                  showPasswordIcon = !showPasswordIcon;
                                });
                              },
                              icon: Icon(showPasswordIcon
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can not be empty';
                          }
                          RegExp passwordExp = RegExp(
                              '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,18}\$');
                          if (!passwordExp!.hasMatch(value)) {
                            return 'Your Password is invalid';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PageName.getOtpPage);
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 200, left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.transparent,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFFDCA15)),
                              ),
                              onPressed: () {
                                keyOfLogin.currentState!.validate();
                                if (keyOfLogin.currentState!.validate() ==
                                    true) {
                                  Navigator.pushNamed(
                                      context, PageName.answerPage);
                                }
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
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, PageName.signupPage);
                          },
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: 'Don\'t have an accounts? ',
                                  style: TextStyle(color: Colors.black,fontSize: 15)),
                              TextSpan(
                                  text: 'Sign up now',
                                  style: TextStyle(color: Color(0xFFFDCA15),fontSize: 15))
                            ]),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, bottom: 12, right: 8),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, PageName.answerPage);
                          },
                          child: Text('View Answer')),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, bottom: 12, right: 8),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageName.changePasswordPage);
                          },
                          child: Text('change password')),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
