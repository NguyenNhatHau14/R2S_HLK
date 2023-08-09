import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import '../../../../../../../bloc/bloc_detail_answer_page/detail_answer_page_bloc.dart';
import '../../../../../../../data/data_modal/data_answer_modal.dart';
import '../../../../../../../data/data_modal/data_question_modal.dart';
import 'component/commnet_form.dart';
import '../../../../../../../data/data_modal/data_comment_modal.dart';
import '../../../../../../../utils/management_image.dart';

class ItemCommentListView extends StatefulWidget {
  const ItemCommentListView(
      {super.key,
      required this.listDataComment,
      required this.index,
      required this.detailAnswerPageBloc,
      required this.answerInfo,
      required this.questionInfo,
      required this.contentController,
      required this.editCommentFormFieldKey,required this.currentUserInfo});

  final int index;
  final List<DataCommentModal> listDataComment;
  final DataAnswerModal answerInfo;
  final DataQuestionModal questionInfo;
  final DetailAnswerPageBloc detailAnswerPageBloc;
  final TextEditingController contentController;
  final GlobalKey<FormState> editCommentFormFieldKey;
  final DataUserModal currentUserInfo;

  @override
  State<ItemCommentListView> createState() => _ItemCommentListViewState();
}

class _ItemCommentListViewState extends State<ItemCommentListView> {
  @override
  Widget build(BuildContext context) {
    bool checkOwner = widget.listDataComment[widget.index].userIdPostComment==widget.currentUserInfo.userId;
    return BlocProvider.value(
      value: widget.detailAnswerPageBloc,
      child: CommentForm(
        commentInfo: widget.listDataComment[widget.index],
        detailAnswerPageBloc: widget.detailAnswerPageBloc,
        answerInfo: widget.answerInfo,
        questionInfo: widget.questionInfo,
        contentController: widget.contentController,
        checkOwner: checkOwner,
        editCommentFormFieldKey: widget.editCommentFormFieldKey,
      ),
    );
  }
}
