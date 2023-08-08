import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blog/blog_signup_page/signup_bloc.dart';
import '../../../routes/page_name.dart';
import '../../../utils/management_image.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final keyOfRegister = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = true;
  bool iconShowPassword = true;
  bool showConfirmPassword = true;
  bool iconShowConfirmPassword = true;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccessState) {
                Navigator.pushNamed(context, PageName.signupSuccessPage);
              }
            },
            child: Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: keyOfRegister,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.arrow_back, size: 30)),
                                ],
                              ),
                            ),
                            Image.asset(ManagementImage.logo),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 60, left: 10, right: 10),
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Name',
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
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 10, right: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: 'Email',
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
                                    return 'Email can not be empty';
                                  }
                                  RegExp emailExp = RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                  if (!emailExp!.hasMatch(value)) {
                                    return 'Your Email is invalid';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 10, right: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: passwordController,
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
                                            iconShowPassword =
                                                !iconShowPassword;
                                          });
                                        },
                                        icon: Icon(iconShowPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password can not be empty';
                                  }
                                  RegExp passwordExp = RegExp(
                                      '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,18}\$');
                                  if (!passwordExp.hasMatch(value)) {
                                    return 'Your Password is invalid';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 10, right: 10),
                              child: TextFormField(
                                obscuringCharacter: '*',
                                obscureText: showConfirmPassword,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Confirm Password',
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
                                            showConfirmPassword =
                                                !showConfirmPassword;
                                            iconShowConfirmPassword =
                                                !iconShowConfirmPassword;
                                          });
                                        },
                                        icon: Icon(iconShowConfirmPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password can not be empty';
                                  }
                                  if (value != passwordController.text) {
                                    return 'Password and Confirm Password are\'nt same';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 65, left: 10, right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 13,
                                  color: Colors.transparent,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xFFFDCA15)),
                                      ),
                                      onPressed: () {
                                        keyOfRegister.currentState!.validate();
                                        if (keyOfRegister.currentState!
                                                .validate() ==
                                            true) {
                                          context.read<SignupBloc>().add(
                                              SignupPressEvent(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  context: context));
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
                              padding: const EdgeInsets.only(
                                  top: 40, left: 10, right: 10),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, PageName.loginPage);
                                  },
                                  child: RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                          text: 'Have an account already? ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      TextSpan(
                                          text: 'Log in',
                                          style: TextStyle(
                                              color: Color(0xFFFDCA15),
                                              fontSize: 15))
                                    ]),
                                  )),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
