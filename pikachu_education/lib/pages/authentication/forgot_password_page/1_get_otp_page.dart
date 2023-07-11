import 'package:flutter/material.dart';
import 'package:pikachu_education/components/text_form_field_widget.dart';
import 'package:pikachu_education/data/data_image.dart';
import 'package:pikachu_education/routes/page_name.dart';

class GetOTPPage extends StatefulWidget {
  const GetOTPPage({super.key});

  @override
  State<GetOTPPage> createState() => _GetOTPPageState();
}

class _GetOTPPageState extends State<GetOTPPage> {
  final keyOfGetOTP = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap:() {
        FocusScope.of(context).unfocus();
      },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: keyOfGetOTP,
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
                  child: Image.asset('assets/image/time_line_step_1.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                  child: Text('Forgot Password',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 45, left: 10, right: 10),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Please enter your email and press GET OTP button,\nan OPT will be send your email ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        hintStyle: const TextStyle(
                            fontSize: 15,
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
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
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
                            keyOfGetOTP.currentState!.validate();
                            if (keyOfGetOTP.currentState!.validate() == true) {
                              Navigator.pushNamed(context, PageName.verifyPage);
                            }
                          },
                          child: const Text(
                            'GET OTP',
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
