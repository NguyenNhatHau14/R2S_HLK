import 'package:flutter/material.dart';

import '../../data/data_image.dart';
import '../../routes/page_name.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final keyOfRegister = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: keyOfRegister,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(logoImage.image),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'User',
                      hintStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email can not be empty';
                    }
                    RegExp emailExp = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                    if (!emailExp!.hasMatch(value)) {
                      return 'Your Email is invalid';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white),
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
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password can not be empty';
                    }
                    if (value != passwordController.text) {
                      return 'Password and Confirm Password not same';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 13,
                    color: Colors.transparent,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                        ),
                        onPressed: () {
                          keyOfRegister.currentState!.validate();
                          if (keyOfRegister.currentState!.validate() == true) {
                            Navigator.pushNamed(
                                context, PageName.signupSuccessPage);
                          }
                        },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageName.loginPage);
                    },
                    child: Text('Already a User? LOGIN')),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
