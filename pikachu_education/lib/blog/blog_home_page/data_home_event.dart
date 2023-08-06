part of 'data_home_bloc.dart';

@immutable
abstract class DataHomeEvent {}
class FetchDataQuestionEvent extends DataHomeEvent{}
class RefreshDataQuestion extends DataHomeEvent{}
class PostDataQuestionsEvent extends DataHomeEvent{
  DataQuestionModal dataToPost;
  String userId;
  PostDataQuestionsEvent({required this.dataToPost,required this.userId});
}
class GetCurrentUserInfoEvent extends DataHomeEvent{
  String userId;
  GetCurrentUserInfoEvent({required this.userId});
}



