part of 'data_home_bloc.dart';

@immutable
abstract class DataHomePageEvent {}

class FetchDataQuestionEvent extends DataHomePageEvent {}

class RefreshDataQuestion extends DataHomePageEvent {}

class PostDataQuestionsEvent extends DataHomePageEvent {
  DataQuestionModal dataToPost;
  String userId;

  PostDataQuestionsEvent({required this.dataToPost, required this.userId});
}

class GetCurrentUserInfoEvent extends DataHomePageEvent {
  String userId;

  GetCurrentUserInfoEvent({required this.userId});
}

class EditQuestionsEvent extends DataHomePageEvent {
  DataQuestionModal dataToPost;
  String userIdOfQuestion;
  String questionId;

  EditQuestionsEvent(
      {required this.dataToPost,
      required this.userIdOfQuestion,
      required this.questionId});
}

class DeleteQuestionsEvent extends DataHomePageEvent {
  String userIdOfQuestion;
  String questionId;

  DeleteQuestionsEvent(
      {required this.userIdOfQuestion, required this.questionId});
}

class LogoutEvent extends DataHomePageEvent {}

class LikeQuestionsEvent extends DataHomePageEvent {
  String userIdOfQuestion;
  String questionId;
  String currentUserId;

  LikeQuestionsEvent(
      {required this.userIdOfQuestion,
      required this.questionId,
      required this.currentUserId});
}

class RemoveLikeQuestionsEvent extends DataHomePageEvent {

  String userIdOfQuestion;
  String questionId;
  String currentUserId;

  RemoveLikeQuestionsEvent(
      {required this.userIdOfQuestion,
        required this.questionId,
        required this.currentUserId});
}
