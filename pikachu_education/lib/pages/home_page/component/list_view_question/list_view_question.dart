import 'package:flutter/material.dart';
import '../../../../../blog/blog_home_page/data_home_bloc.dart';
import '../../../../../data/data_modal/data_question_modal.dart';
import '../../../../../data/data_modal/data_user_modal.dart';
import '../../../../../routes/page_name.dart';
import 'item_listview.dart';

class ListViewQuestion extends StatefulWidget {
  const ListViewQuestion(
      {super.key,
      required this.dataQuestionFromServer,
      required this.dataHomePageBloc,
      required this.currentUserInfo});

  final List<DataQuestionModal> dataQuestionFromServer;
  final DataHomeBloc dataHomePageBloc;
  final DataUserModal currentUserInfo;

  @override
  State<ListViewQuestion> createState() => _ListViewQuestionState();
}

class _ListViewQuestionState extends State<ListViewQuestion> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.dataQuestionFromServer.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.transparent,
        thickness: 0,
      ),
      itemBuilder: (context, index) {
        return ItemListviewQuestion(
         currentUserInfo: widget.currentUserInfo,
          dataQuestionFromServer: widget.dataQuestionFromServer,
          index: index,
        );
      },
    );
  }
}
