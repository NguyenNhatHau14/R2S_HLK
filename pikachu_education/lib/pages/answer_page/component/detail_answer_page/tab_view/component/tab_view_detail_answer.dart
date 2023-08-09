import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_answer_modal.dart';
import 'package:pikachu_education/data/data_modal/data_comment_modal.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import 'package:pikachu_education/pages/answer_page/component/detail_answer_page/tab_view/component/text_form_field_comment.dart';
import '../../../../../../bloc/bloc_detail_answer_page/detail_answer_page_bloc.dart';
import 'Item_list_view/item_listview.dart';

class TabViewDetailAnswer extends StatefulWidget {
  const TabViewDetailAnswer(
      {super.key,
      required this.tabController,
      required this.commentController,
      required this.detailAnswerPageBloc,
      required this.questionInfo,
      required this.currentUserInfo,
      required this.answerInfo,
      required this.listDataComment,
      required this.commentFormFieldKey,
      required this.editCommentFormFieldKey,
      required this.editComment});

  final TabController tabController;
  final TextEditingController commentController;
  final DetailAnswerPageBloc detailAnswerPageBloc;
  final DataUserModal currentUserInfo;
  final DataQuestionModal questionInfo;
  final DataAnswerModal answerInfo;
  final List<DataCommentModal> listDataComment;
  final GlobalKey<FormState> commentFormFieldKey;
  final TextEditingController editComment;
  final GlobalKey<FormState> editCommentFormFieldKey;


  @override
  State<TabViewDetailAnswer> createState() => _TabViewDetailAnswerState();
}

class _TabViewDetailAnswerState extends State<TabViewDetailAnswer> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.detailAnswerPageBloc,
      child: BlocListener<DetailAnswerPageBloc, DetailAnswerPageState>(
        listener: (context, state) {
          if (state is PostCommentSuccessState) {
            widget.commentController.clear();
          }
        },
        child: BlocBuilder<DetailAnswerPageBloc, DetailAnswerPageState>(
          builder: (context, state) {
            return TabBarView(
              controller: widget.tabController,
              children: [
                Column(
                  children: [
                    TextFormFieldComment(
                        commentFormFieldKey: widget.commentFormFieldKey,
                        answerInfo: widget.answerInfo,
                        commentController: widget.commentController,
                        currentUserInfo: widget.currentUserInfo,
                        questionInfo: widget.questionInfo),
                    Container(
                      height: MediaQuery.sizeOf(context).height / 1.8,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ItemCommentListView(
                                editCommentFormFieldKey:
                                    widget.editCommentFormFieldKey,
                                currentUserInfo: widget.currentUserInfo,
                                contentController: widget.editComment,
                                questionInfo: widget.questionInfo,
                                answerInfo: widget.answerInfo,
                                index: index,
                                listDataComment: widget.listDataComment,
                                detailAnswerPageBloc:
                                    widget.detailAnswerPageBloc,
                              ),
                          separatorBuilder: (context, index) => const Divider(
                              color: Colors.transparent, thickness: 10),
                          itemCount: widget.listDataComment.length),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            color: Colors.yellow,
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            color: Colors.yellow,
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            color: Colors.yellow,
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            color: Colors.yellow,
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            color: Colors.yellow,
                          )),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
