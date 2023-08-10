import 'data_question_modal.dart';

class DataUserModal {
  final String userId;
  final String userName;
  final String email;
  final String? avatarUrl;
  Map<dynamic, dynamic>? listQuestion;
  Map<dynamic, dynamic>? listQuestionIdLiked;
  Map<dynamic, dynamic>? listAnswerIdLiked;

  DataUserModal(
      {required this.userId,
      required this.userName,
      required this.email,
      this.listQuestion,
      this.listQuestionIdLiked,
      this.listAnswerIdLiked,this.avatarUrl});

  static DataUserModal fromMap(
          {required String key, required Map<dynamic, dynamic> map}) =>
      DataUserModal(
          userId: key,
          userName: map['name'],
          email: map['email'],
          listQuestion: map['questions'],
          listQuestionIdLiked: map['listQuestionIdLiked'],
          listAnswerIdLiked: map['listAnswerIdLiked'],
          avatarUrl: map['avatarUrl']??'');

  toJson() {
    return {
      'name': userName,
      'email': email,
      'questions': listQuestion,
    };
  }
}
