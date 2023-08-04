part of 'list_answer_page_bloc.dart';

@immutable
abstract class ListAnswerPageEvent {}


class FetchDataAnswerList extends ListAnswerPageEvent {
  String userIdOfQuestion;
  String questionId;
  FetchDataAnswerList({required this.userIdOfQuestion, required this.questionId});
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
