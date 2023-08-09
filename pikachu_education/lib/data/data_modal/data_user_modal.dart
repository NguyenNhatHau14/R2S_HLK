import 'data_question_modal.dart';

class DataUserModal {
  final String userId;
  final String userName;
  final String email;
  Map<dynamic, dynamic>? listQuestion;
  List<String>? listQuestionIdLiked;

  DataUserModal(
      {required this.userId,
      required this.userName,
      required this.email,
      this.listQuestion,
      this.listQuestionIdLiked});

  static DataUserModal fromMap(
          {required String key, required Map<dynamic, dynamic> map,required List<String> listQuestionIdLiked}) =>
      DataUserModal(
          userId: key,
          userName: map['name'],
          email: map['email'],
          listQuestion: map['questions'],
          listQuestionIdLiked: listQuestionIdLiked);

  toJson() {
    return {
      'name': userName,
      'email': email,
      'questions': listQuestion,
    };
  }
}
