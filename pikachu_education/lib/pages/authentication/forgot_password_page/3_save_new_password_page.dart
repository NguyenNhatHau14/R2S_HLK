import 'package:flutter/material.dart';
import 'package:pikachu_education/components/text_form_field_widget.dart';
import 'package:pikachu_education/data/data_image.dart';
import 'package:pikachu_education/routes/page_name.dart';

class SaveNewPasswordPage extends StatefulWidget {
  const SaveNewPasswordPage({super.key});

  @override
  State<SaveNewPasswordPage> createState() => _SaveNewPasswordPageState();
}

class _SaveNewPasswordPageState extends State<SaveNewPasswordPage> {
  final keySavePassword = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  bool showPassword = true;
  bool showPasswordIcon = true;
  bool showConfirmPassword = true;
  bool showConfirmPasswordIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: () {
        FocusScope.of(context).unfocus();
      },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: keySavePassword,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                Padding(
                  padding: const EdgeInsets.only(top: 65, left: 10, right: 10),
                  child: Image.asset('assets/image/time_line_step_3.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                  child: Text('Enter Your New\nPassWord',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscuringCharacter: '*',
                    obscureText: showPassword,
                    controller: passwordController,
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
                  padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
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
                              showConfirmPasswordIcon = !showConfirmPasswordIcon;
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
                      if (value != passwordController.text) {
                        return 'Password and Confirm Password not same';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Colors.transparent,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFFDCA15)),
                          ),
                          onPressed: () {
                            keySavePassword.currentState!.validate();
                            if (keySavePassword.currentState!.validate() ==
                                true) {
                              Navigator.pushNamed(
                                  context, PageName.successChangePasswordPage);
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
