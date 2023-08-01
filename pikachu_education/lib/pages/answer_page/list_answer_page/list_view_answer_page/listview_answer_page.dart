import 'package:flutter/material.dart';

import '../../../../data/demo_data/test_data_answer.dart';
import 'item_listview.dart';

class ListViewAnswerPage extends StatefulWidget {
  const ListViewAnswerPage({super.key,required this.mockListAnswers});

 final List<User> mockListAnswers;

  @override
  State<ListViewAnswerPage> createState() => _ListViewAnswerPageState();
}

class _ListViewAnswerPageState extends State<ListViewAnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
        child: ListView.builder(
          itemBuilder: (context, index) =>
              ItemListView(mockListAnswers: mockListAnswers,index: index),
          itemCount: mockListAnswers.length,
        ),
      ),
    );
  }
}
