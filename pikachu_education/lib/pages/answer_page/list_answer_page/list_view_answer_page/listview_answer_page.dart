import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blog/blog_list_answer_page/list_answer_page_bloc.dart';
import '../../../../data/demo_data/test_data_answer.dart';
import 'item_listview.dart';

class ListViewAnswerPage extends StatefulWidget {
  const ListViewAnswerPage({super.key,
    required this.listAnswerPageBloc,
    required this.questionId,
    required this.useIdOfQuestion});

  final ListAnswerPageBloc listAnswerPageBloc;
  final String questionId;
  final String useIdOfQuestion;

  @override
  State<ListViewAnswerPage> createState() => _ListViewAnswerPageState();
}

class _ListViewAnswerPageState extends State<ListViewAnswerPage> {
  @override
  void initState() {
    widget.listAnswerPageBloc.add(FetchDataAnswerList(userIdOfQuestion: widget.useIdOfQuestion, questionId: widget.questionId));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.listAnswerPageBloc,
      child: BlocBuilder<ListAnswerPageBloc, ListAnswerPageState>(
        builder: (context, state) {
          if (state is FetchListAnswerPageSuccessState){
           var listDataFromSever = state.listAnswers;
           return Expanded(
             child: Padding(
               padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
               child: ListView.builder(

                 itemBuilder: (context, index) =>
                     ItemListView(
                         listAnswerPageBloc: widget.listAnswerPageBloc,
                         index: index,
                       listDataFromSever: listDataFromSever,),
                 itemCount: listDataFromSever.length,
               ),
             ),
           );
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
