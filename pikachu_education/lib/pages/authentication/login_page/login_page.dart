import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pikachu_education/routes/page_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bloc/bloc_login_page/login_bloc.dart';
import '../../../components/snack_bar_custom.dart';
import '../../../service/service_local_storage/service_save_data_to_local_storage.dart';

import '../../../utils/management_image.dart';
import '../../../utils/management_key.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final keyOfLogin = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = true;
  bool showPasswordIcon = true;
  final LoginBloc loginBloc = LoginBloc();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loadDataForLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString(ManagementKey.user) ?? '';
    var password = prefs.getString(ManagementKey.password) ?? '';
    setState(() {
      emailController.text = user;
      passwordController.text = password;

    });
  }

  @override
  void initState() {
    loginBloc.add(AutoLogin());
    loadDataForLogin();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginBloc,
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                var userId = state.userId;
                Navigator.pushNamed(context, PageName.homePage,
                    arguments: userId);
              }
              if (state is AutoLoginSuccessState) {
                var userId = state.userId;
                Navigator.pushNamed(context, PageName.homePage,
                    arguments: userId);
              }
            },
            child: WillPopScope(
              onWillPop: () {
                return SnackBarCustom.snackBarOfBack(context);
              },
              child: Scaffold(
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
                              Image.asset(ManagementImage.logo),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 60, left: 10, right: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: 'email',
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
                                      return 'email can not be empty';
                                    }
                                    RegExp userExp = RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                    if (!userExp!.hasMatch(value)) {
                                      return 'Your User is invalid';
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 40, left: 10, right: 10),
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
                                padding:
                                    const EdgeInsets.only(top: 30, right: 10),
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
                                              decoration:
                                                  TextDecoration.underline),
                                        ))
                                  ],
                                ),
                              ),

                              // ElevatedButton(
                              //     onPressed: () {
                              //
                              //     },
                              //     child: Text('Check Data')),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 200, left: 10, right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    color: Colors.transparent,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFFFDCA15)),
                                        ),
                                        onPressed: () {
                                          keyOfLogin.currentState!.validate();
                                          if (keyOfLogin.currentState!
                                                  .validate() ==
                                              true) {
                                            SaveDataToLocal.saveDataForLogin(
                                                context,
                                                emailController.text,
                                                passwordController.text);
                                            context.read<LoginBloc>().add(
                                                LoginPressEvent(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    context: context));
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
                                      Navigator.pushNamed(
                                          context, PageName.signupPage);
                                    },
                                    child: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text: 'Don\'t have an accounts? ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                        TextSpan(
                                            text: 'Sign up now',
                                            style: TextStyle(
                                                color: Color(0xFFFDCA15),
                                                fontSize: 15))
                                      ]),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, right: 8),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, PageName.homePage);
                                      SaveDataToLocal.saveDataForLogin(
                                          context,
                                          emailController.text = '',
                                          passwordController.text = '');
                                    },
                                    child:
                                        const Text('Go to Home Without Login')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, right: 8),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
