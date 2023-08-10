import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/data_modal/data_answer_modal.dart';
import '../../service/database_service/database_service.dart';
import '../../service/storage_service/storage_service.dart';

part 'list_answer_page_event.dart';

part 'list_answer_page_state.dart';

class ListAnswerPageBloc
    extends Bloc<ListAnswerPageEvent, ListAnswerPageState> {
  ListAnswerPageBloc() : super(ListAnswerPageInitial()) {
    on<PostAnswerEvent>((event, emit) async {
      if (event.file == null) {
        await DatabaseService.postDataAnswerToSever(
            itemToPost: event.itemToPost,
            userIdOfQuestion: event.userIdOfQuestion,
            questionId: event.questionId,
            imageUrl: '');
        emit(PostAnswerSuccessState());
      } else {
        var imageUrl =
            await StorageService.upLoadImageToStorage(file: event.file!);
        await DatabaseService.postDataAnswerToSever(
            itemToPost: event.itemToPost,
            userIdOfQuestion: event.userIdOfQuestion,
            questionId: event.questionId,
            imageUrl: imageUrl);
        emit(PostAnswerSuccessState());
      }
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

    on<LikeAnswersEvent>((event, emit) async {
      await DatabaseService.likedAnswer(
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          currentUserId: event.currentUserId,
          answerId: event.answerId);
      emit(LikeAnswerSuccessState());
    });

    on<RemoveLikeAnswersEvent>((event, emit) async {
      await DatabaseService.removedLikeAnswer(
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          currentUserId: event.currentUserId,
          answerId: event.answerId);
      emit(RemoveLikeAnswerSuccessState());
    });
  }
}
