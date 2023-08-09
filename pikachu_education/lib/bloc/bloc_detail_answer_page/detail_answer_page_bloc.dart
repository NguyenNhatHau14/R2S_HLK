import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pikachu_education/service/service_login/firebase_login.dart';

import '../../data/data_modal/data_comment_modal.dart';
import '../../service/database_service/database_service.dart';

part 'detail_answer_page_event.dart';

part 'detail_answer_page_state.dart';

class DetailAnswerPageBloc
    extends Bloc<DetailAnswerPageEvent, DetailAnswerPageState> {
  DetailAnswerPageBloc() : super(DetailAnswerPageInitial()) {
    on<DetailAnswerPageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PostCommentEvent>((event, emit) async {
      await DatabaseService.postDataCommentToSever(
          itemToPost: event.itemToPost,
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          answerId: event.answerId);
      emit(PostCommentSuccessState());
    });

    on<FetchDataCommentEvent>((event, emit) async {
      emit(CommentLoadingState());
      var listDataComment = await DatabaseService.fetchDataCommentFromSever(
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          answerId: event.answerId);
      emit(FetchDataCommentSuccessState(listComment: listDataComment));
    });

    on<RefreshDataCommentEvent>((event, emit) async {
      var listDataComment = await DatabaseService.fetchDataCommentFromSever(
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          answerId: event.answerId);
      emit(FetchDataCommentSuccessState(listComment: listDataComment));
    });

    on<EditCommentEvent>((event, emit) async {
      await DatabaseService.editComment(
          itemToPost: event.itemToPost,
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          answerId: event.answerId,
          commentId: event.commentId);
      emit(EditCommentSuccessState());
    });

    on<DeleteCommentEvent>((event, emit) async {
      await DatabaseService.deleteComment(
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          answerId: event.answerId,
          commentId: event.commentId);
      emit(DeleteCommentSuccessState());
    });



  }
}
