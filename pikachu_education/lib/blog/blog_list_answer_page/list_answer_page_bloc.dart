import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pikachu_education/blog/blog_home_page/data_home_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_comment_modal.dart';

import '../../data/data_modal/data_answer_modal.dart';
import '../../service/database_service/database_service.dart';

part 'list_answer_page_event.dart';

part 'list_answer_page_state.dart';

class ListAnswerPageBloc
    extends Bloc<ListAnswerPageEvent, ListAnswerPageState> {
  ListAnswerPageBloc() : super(ListAnswerPageInitial()) {
    on<PostAnswerEvent>((event, emit) async {
      await DatabaseService.postDataAnswerToSever(
          itemToPost: event.itemToPost,
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId);
      emit(PostAnswerSuccessState());
    });

    on<RefreshDataAnswerListEvent>((event, emit) async {
      var listDataAnswer = await DatabaseService.fetchDataAnswerFromSever(
          event.userIdOfQuestion, event.questionId);
      emit(FetchListAnswerPageSuccessState(listAnswers: listDataAnswer));
    });

    on<FetchDataAnswerListEvent>((event, emit) async {
      emit(ListAnswerPageLoadingState());
      var listDataAnswer = await DatabaseService.fetchDataAnswerFromSever(
          event.userIdOfQuestion, event.questionId);
      emit(FetchListAnswerPageSuccessState(listAnswers: listDataAnswer));
    });

    on<EditAnswerEvent>((event, emit) async {
      await DatabaseService.editAnswer(
          questionId: event.questionId,
          userIdOfQuestion: event.userIdOfQuestion,
          answerId: event.answerId,
          itemToPost: event.itemToPost);
      emit(EditAnswerSuccessState());
    });

    on<DeleteAnswerEvent>((event, emit) async {
      await DatabaseService.deleteAnswer(
        questionId: event.questionId,
        userIdOfQuestion: event.userIdOfQuestion,
        answerId: event.answerId,
      );
      emit(DeleteAnswerSuccessState());
    });
  }
}
