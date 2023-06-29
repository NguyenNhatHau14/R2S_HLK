import 'package:flutter/material.dart';
import 'package:pikachu_education/data/data_user.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back, size: 25),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('3 Answers',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
              )
            ]),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => item(lists[index]),
              itemCount: lists.length,
            ),
          )
        ]),
      ),
    );
  }

  Widget item(User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 7,
                      height: MediaQuery.of(context).size.height / 13,
                      child: Image.asset(user.avatar, fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          user.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          '1 day ago',
                          style: TextStyle(
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                  'Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika Pika '),
            const Row(children: [
              Icon(Icons.favorite_border),
            ],)
            ],
          ),
        ),
      ),
    );
  }
}
