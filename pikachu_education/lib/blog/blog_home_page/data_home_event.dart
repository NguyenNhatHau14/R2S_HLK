part of 'data_home_bloc.dart';

@immutable
abstract class DataHomePageEvent {}
class FetchDataQuestionEvent extends DataHomePageEvent{}
class RefreshDataQuestion extends DataHomePageEvent{}
class PostDataQuestionsEvent extends DataHomePageEvent{
  DataQuestionModal dataToPost;
  String userId;
  PostDataQuestionsEvent({required this.dataToPost,required this.userId});
}
class GetCurrentUserInfoEvent extends DataHomePageEvent{
  String userId;
  GetCurrentUserInfoEvent({required this.userId});
}

class EditQuestionsEvent extends DataHomePageEvent{
  DataQuestionModal dataToPost;
  String userId;
  String questionId;
  EditQuestionsEvent({required this.dataToPost,required this.userId,required this.questionId});
}



