part of 'list_answer_page_bloc.dart';

@immutable
abstract class ListAnswerPageEvent {}


class FetchDataAnswerListEvent extends ListAnswerPageEvent {
  String userIdOfQuestion;
  String questionId;
  FetchDataAnswerListEvent({required this.userIdOfQuestion, required this.questionId});
}
class RefreshDataAnswerListEvent extends ListAnswerPageEvent {
  String userIdOfQuestion;
  String questionId;
  RefreshDataAnswerListEvent({required this.userIdOfQuestion, required this.questionId});
}
class PostAnswerEvent extends ListAnswerPageEvent {
  String userIdOfQuestion;
  String questionId;
  DataAnswerModal itemToPost;

  PostAnswerEvent(
      {required this.userIdOfQuestion,
      required this.questionId,
      required this.itemToPost});
}


