import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/data_modal/data_question_modal.dart';
import '../../data/data_modal/data_user_modal.dart';
import '../../service/database_service/database_service.dart';

part 'data_home_event.dart';

part 'data_home_state.dart';

class DataHomePageBloc extends Bloc<DataHomePageEvent, DataHomePageState> {
  DataHomePageBloc() : super(DataHomePageInitial(const <DataQuestionModal>[])) {
    on<FetchDataQuestionEvent>((event, emit) async {
      emit(FetchDataQuestionLoadingState(const []));
      var listDataUsers = await DatabaseService.fetchDataQuestionFromSever();
      emit(FetchDataQuestionSuccessState(listDataUsers));
    });

    on<GetCurrentUserInfoEvent>((event, emit) async {
      var currentUserInfo =
          await DatabaseService.getCurrentUserInfo(userID: event.userId);
      emit(GetCurrentUserSuccessState(currentUserInfo: currentUserInfo));
    });

    on<RefreshDataQuestion>((event, emit) async {
      var listDataUsers = await DatabaseService.fetchDataQuestionFromSever();
      emit(FetchDataQuestionSuccessState(listDataUsers));
    });

    on<PostDataQuestionsEvent>((event, emit) async {
      await DatabaseService.postDataQuestionToSever(
          itemToPost: event.dataToPost, userId: event.userId);
      emit(PostDataQuestionSuccessState());
    });

    on<EditQuestionsEvent>((event, emit) async {
      await DatabaseService.editDataQuestion(
          itemToPost: event.dataToPost,
          userId: event.userId,
          questionId: event.questionId);
      emit(EditQuestionSuccessState());
    });
  }
}
