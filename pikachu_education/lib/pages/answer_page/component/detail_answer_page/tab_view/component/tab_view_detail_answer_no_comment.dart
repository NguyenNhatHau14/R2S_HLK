import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_answer_modal.dart';
import 'package:pikachu_education/data/data_modal/data_comment_modal.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import 'package:pikachu_education/pages/answer_page/component/detail_answer_page/tab_view/component/text_form_field_comment.dart';

import '../../../../../../bloc/bloc_detail_answer_page/detail_answer_page_bloc.dart';


class TabViewDetailAnswerNoComment extends StatefulWidget {
  const TabViewDetailAnswerNoComment({super.key,
    required this.tabController,
    required this.commentController,
    required this.detailAnswerPageBloc,
    required this.questionInfo,
    required this.currentUserInfo,
    required this.answerInfo,
    required this.listDataComment,required this.commentFormFieldKey});

  final TabController tabController;
  final TextEditingController commentController;
  final DetailAnswerPageBloc detailAnswerPageBloc;
  final DataUserModal currentUserInfo;
  final DataQuestionModal questionInfo;
  final DataAnswerModal answerInfo;
  final List<DataCommentModal> listDataComment;
  final GlobalKey<FormState> commentFormFieldKey;


  @override
  State<TabViewDetailAnswerNoComment> createState() => _TabViewDetailAnswerNoCommentState();
}


class _TabViewDetailAnswerNoCommentState extends State<TabViewDetailAnswerNoComment> {
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
          if(state is PostCommentSuccessState){
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
                    const Align(alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(textAlign: TextAlign.center,
                          'This answer has no comments, be the first to comment or visit another time',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        ),
                      ),
                    )
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
