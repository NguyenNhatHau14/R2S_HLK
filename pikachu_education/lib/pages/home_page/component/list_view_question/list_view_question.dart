import 'package:flutter/material.dart';
import '../../../../../blog/blog_home_page/data_home_bloc.dart';
import '../../../../../data/data_modal/data_question_modal.dart';
import '../../../../../data/data_modal/data_user_modal.dart';
import '../../../../../routes/page_name.dart';
import 'item_list_view/item_listview.dart';

class ListViewQuestion extends StatefulWidget {
  const ListViewQuestion(
      {super.key,
      required this.dataQuestionFromServer,
      required this.dataHomePageBloc,
      required this.currentUserInfo,
      required this.contentController,
      required this.editQuestionFormFieldKey,
      required this.titleController,
      required this.subjectController});

  final List<DataQuestionModal> dataQuestionFromServer;
  final DataHomePageBloc dataHomePageBloc;
  final DataUserModal currentUserInfo;
  final GlobalKey<FormState> editQuestionFormFieldKey;
  final TextEditingController titleController;
  final TextEditingController subjectController;
  final TextEditingController contentController;

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
          subjectController: widget.subjectController,
          contentController: widget.contentController,
          editQuestionFormFieldKey: widget.editQuestionFormFieldKey,
          dataHomePageBloc: widget.dataHomePageBloc,
          titleController: widget.titleController,
          currentUserInfo: widget.currentUserInfo,
          dataQuestionFromServer: widget.dataQuestionFromServer,
          index: index,
        );
      },
    );
  }
}
