import 'package:flutter/material.dart';
import 'package:pikachu_education/data/data_user.dart';

import '../data/data_image.dart';
import '../routes/page_name.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back, size: 25),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('3 Answers',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                  )
                ]),
              ),
              ListView.builder(
                itemBuilder: (context, index) => item(lists[index]),
                itemCount: lists.length,
              )
            ]),
        ),
    );
  }

  Widget item(User user) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [Text('asdsaxzcajskldj')],
          )
        ],
      ),
    );
  }
}
