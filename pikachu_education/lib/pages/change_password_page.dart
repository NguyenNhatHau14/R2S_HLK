import 'package:flutter/material.dart';
import 'package:pikachu_education/components/snack_bar_custom.dart';
import 'package:pikachu_education/data/data_image.dart';
import 'package:pikachu_education/routes/page_name.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final keyChangePassword = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  bool showCurrentPassword = true;
  bool showCurrentPasswordIcon = true;
  bool showNewPassword = true;
  bool showNewPasswordIcon = true;
  bool showConfirmPassword = true;
  bool showConfirmPasswordIcon = true;

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
              key: keyChangePassword,
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
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset(logoImage.image),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                      child: Text('Change Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 55, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: currentPasswordController,
                        obscuringCharacter: '*',
                        obscureText: showCurrentPassword,
                        decoration: InputDecoration(
                            hintText: 'Current Password',
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
                                  showCurrentPassword = !showCurrentPassword;
                                  showCurrentPasswordIcon =
                                      !showCurrentPasswordIcon;
                                });
                              },
                              icon: Icon(showCurrentPasswordIcon
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            )),
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
                          const EdgeInsets.only(top: 35, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: newPasswordController,
                        obscuringCharacter: '*',
                        obscureText: showNewPassword,
                        decoration: InputDecoration(
                            hintText: 'New Password',
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
                                  showNewPassword = !showNewPassword;
                                  showNewPasswordIcon = !showNewPasswordIcon;
                                });
                              },
                              icon: Icon(showNewPasswordIcon
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can not be empty';
                          }
                          if (value == currentPasswordController.text) {
                            return 'New Password is not allowed same the Old Password';
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
                          const EdgeInsets.only(top: 35, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscuringCharacter: '*',
                        obscureText: showConfirmPassword,
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
                                  showConfirmPassword = !showConfirmPassword;
                                  showConfirmPasswordIcon =
                                      !showConfirmPasswordIcon;
                                });
                              },
                              icon: Icon(showConfirmPasswordIcon
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can not be empty';
                          }
                          if (value != newPasswordController.text) {
                            return 'Password and Confirm Password not same';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 85, left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
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
                                keyChangePassword.currentState!.validate();
                                if (keyChangePassword.currentState!
                                        .validate() ==
                                    true) {
                                 Navigator.pushNamed(context, PageName.successChangePasswordPage);
                                }
                              },
                              child: const Text(
                                'SAVE',
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
