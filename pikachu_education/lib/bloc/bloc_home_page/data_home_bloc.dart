import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/data_modal/data_question_modal.dart';
import '../../data/data_modal/data_user_modal.dart';
import '../../service/database_service/database_service.dart';
import '../../service/service_login/firebase_login.dart';
import '../../service/storage_service/storage_service.dart';

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
      if(event.file==null){
        await DatabaseService.postDataQuestionToSever(
            itemToPost: event.dataToPost, userId: event.userId, imageUrl: '');
        emit(PostDataQuestionSuccessState());
      }
      else{
        var imageUrl = await StorageService.upLoadImageToStorage(file: event.file!);
        await DatabaseService.postDataQuestionToSever(
            itemToPost: event.dataToPost, userId: event.userId, imageUrl: imageUrl);

        emit(PostDataQuestionSuccessState());
      }

    });

    on<EditQuestionsEvent>((event, emit) async {
      await DatabaseService.editDataQuestion(
          itemToPost: event.dataToPost,
          userId: event.userIdOfQuestion,
          questionId: event.questionId);
      emit(EditQuestionSuccessState());
    });
    on<DeleteQuestionsEvent>((event, emit) async {
      await DatabaseService.deleteQuestion(
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId);
      emit(DeleteQuestionSuccessState());
    });

    on<LogoutEvent>((event, emit) async {
      await LoginService.logout();
      emit(LogoutSuccessState());
    });

    on<LikeQuestionsEvent>((event, emit) async {
      await DatabaseService.likedQuestion(
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          currentUserId: event.currentUserId);
      emit(LikedQuestionSuccessState());
    });

    on<RemoveLikeQuestionsEvent>((event, emit) async {
      await DatabaseService.removedLikeQuestion(
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId,
          currentUserId: event.currentUserId);
      emit(RemovedLikeQuestionSuccessState());
    });


  }
}
