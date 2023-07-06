import 'package:flutter/material.dart';

import '../routes/page_name.dart';

class DialogCustom {
  static dialogOfPostAnswer(BuildContext context) {
    return AlertDialog(
      title: const Text('Post Answer'),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent)),

      content: const Text('You have to login to do this action'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PageName.loginPage);
                  },
                  child: const Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
