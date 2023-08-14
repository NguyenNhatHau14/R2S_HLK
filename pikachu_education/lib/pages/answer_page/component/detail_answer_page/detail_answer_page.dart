import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_answer_modal.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import 'package:pikachu_education/pages/answer_page/component/detail_answer_page/tab_view/component/answer_detail.dart';
import 'package:pikachu_education/pages/answer_page/component/detail_answer_page/tab_view/component/tab_bar_on_top.dart';
import 'package:pikachu_education/pages/answer_page/component/detail_answer_page/tab_view/component/tab_bar_show_number_like_comment.dart';
import 'package:pikachu_education/pages/answer_page/component/detail_answer_page/tab_view/component/tab_view_detail_answer.dart';
import 'package:pikachu_education/pages/answer_page/component/detail_answer_page/tab_view/component/tab_view_detail_answer_no_comment.dart';

import '../../../../bloc/bloc_detail_answer_page/detail_answer_page_bloc.dart';
import '../../../../service/database_service/database_service.dart';

class DetailAnswerPage extends StatefulWidget {
  const DetailAnswerPage(
      {super.key,
      required this.answerInfo,
      required this.currentUserInfo,
      required this.questionInfo});

  final DataAnswerModal answerInfo;
  final DataQuestionModal questionInfo;
  final DataUserModal currentUserInfo;

  @override
  State<DetailAnswerPage> createState() => _DetailAnswerPageState();
}

class _DetailAnswerPageState extends State<DetailAnswerPage>
    with TickerProviderStateMixin {
  TextEditingController commentController = TextEditingController();
  DetailAnswerPageBloc detailAnswerPageBloc = DetailAnswerPageBloc();
  final commentFormFieldKey = GlobalKey<FormState>();
  final editCommentFormFieldKey = GlobalKey<FormState>();
  TextEditingController editCommentController = TextEditingController();
  List<String> listUserIdLiked = [];

  getListQuestionIdLiked() async {
    var listQuestionIdLikeFromSever =
        await DatabaseService.getListUserIdLikedAnswer(
            questionId: widget.questionInfo.questionId,
            userIdOfQuestion: widget.questionInfo.userId,
            answerId: widget.answerInfo.answerId);
    setState(() {
      listUserIdLiked = listQuestionIdLikeFromSever;
    });
  }

  @override
  void dispose() {
    commentController.dispose();
    editCommentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getListQuestionIdLiked();
    detailAnswerPageBloc.add(FetchDataCommentEvent(
        answerId: widget.answerInfo.answerId,
        questionId: widget.questionInfo.questionId,
        userIdOfQuestion: widget.questionInfo.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(
        length: 2, vsync: this, animationDuration: const Duration(seconds: 1));

    return BlocProvider.value(
      value: detailAnswerPageBloc,
      child: BlocListener<DetailAnswerPageBloc, DetailAnswerPageState>(
        listener: (context, state) {
          if (state is PostCommentSuccessState) {
            context.read<DetailAnswerPageBloc>().add(RefreshDataCommentEvent(
                answerId: widget.answerInfo.answerId,
                questionId: widget.questionInfo.questionId,
                userIdOfQuestion: widget.questionInfo.userId));
          }
          if (state is EditCommentSuccessState) {
            context.read<DetailAnswerPageBloc>().add(RefreshDataCommentEvent(
                answerId: widget.answerInfo.answerId,
                questionId: widget.questionInfo.questionId,
                userIdOfQuestion: widget.questionInfo.userId));
          }
          if (state is DeleteCommentSuccessState) {
            context.read<DetailAnswerPageBloc>().add(RefreshDataCommentEvent(
                answerId: widget.answerInfo.answerId,
                questionId: widget.questionInfo.questionId,
                userIdOfQuestion: widget.questionInfo.userId));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabBarOnTop(
                        questionInfo: widget.questionInfo,
                        currentUserInfo: widget.currentUserInfo),
                    AnswerDetail(answerInfo: widget.answerInfo),
                    TabBarShowNumberLikeComment(
                        answerInfo: widget.answerInfo,
                        tabController: tabController),
                    BlocProvider.value(
                      value: detailAnswerPageBloc,
                      child: BlocBuilder<DetailAnswerPageBloc,
                          DetailAnswerPageState>(
                        builder: (context, state) {
                          if (state is FetchDataCommentSuccessState) {
                            var listDataComment = state.listComment;
                            if (listDataComment.isEmpty) {
                              return SizedBox(
                                height: MediaQuery.sizeOf(context).height / 1.5,
                                child: TabViewDetailAnswerNoComment(
                                  tabController: tabController,
                                  commentController: commentController,
                                  currentUserInfo: widget.currentUserInfo,
                                  questionInfo: widget.questionInfo,
                                  answerInfo: widget.answerInfo,
                                  detailAnswerPageBloc: detailAnswerPageBloc,
                                  listDataComment: listDataComment,
                                  commentFormFieldKey: commentFormFieldKey,
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: MediaQuery.sizeOf(context).height / 1.5,
                                child: TabViewDetailAnswer(listUserIdLiked: listUserIdLiked,
                                  tabController: tabController,
                                  commentController: commentController,
                                  currentUserInfo: widget.currentUserInfo,
                                  questionInfo: widget.questionInfo,
                                  answerInfo: widget.answerInfo,
                                  detailAnswerPageBloc: detailAnswerPageBloc,
                                  listDataComment: listDataComment,
                                  commentFormFieldKey: commentFormFieldKey,
                                  editCommentFormFieldKey:
                                      editCommentFormFieldKey,
                                  editComment: editCommentController,
                                ),
                              );
                            }
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
