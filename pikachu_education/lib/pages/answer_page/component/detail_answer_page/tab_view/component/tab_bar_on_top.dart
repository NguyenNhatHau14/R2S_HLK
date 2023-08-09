import 'package:flutter/material.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';

import '../../../../../../routes/page_name.dart';

class TabBarOnTop extends StatefulWidget {
  const TabBarOnTop({super.key,required this.currentUserInfo});
 final DataQuestionModal currentUserInfo;
  @override
  State<TabBarOnTop> createState() => _TabBarOnTopState();
}

class _TabBarOnTopState extends State<TabBarOnTop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back, size: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, PageName.loginPage);
                },
                child: Text(widget.currentUserInfo.userName,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal)),
              ),
            )
          ]),
    );
  }
}
