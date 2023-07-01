import 'package:flutter/material.dart';
import 'package:pikachu_education/components/text_form_field_widget.dart';
import 'package:pikachu_education/data/data_image.dart';
import 'package:pikachu_education/routes/page_name.dart';

class SuccessChangePasswordPage extends StatefulWidget {
  const SuccessChangePasswordPage({super.key});

  @override
  State<SuccessChangePasswordPage> createState() =>
      _SuccessChangePasswordPageState();
}

class _SuccessChangePasswordPageState extends State<SuccessChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(logoImage.image),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/image/yellow_tick.png'),
              ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Change Password Successful!!!',textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Please login again',
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
    );
  }
}
