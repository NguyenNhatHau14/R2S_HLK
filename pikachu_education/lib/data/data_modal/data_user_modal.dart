import 'data_question_modal.dart';

class DataUserModal {
  final String userId;
  final String userName;
  final String email;
  Map<dynamic,dynamic>? listQuestion;

  DataUserModal(
      {required this.userId,
      required this.userName,
      required this.email,
      this.listQuestion});

  static DataUserModal fromMap(
          {required String key, required Map<dynamic, dynamic> map}) =>
      DataUserModal(
          userId: key,
          userName: map['name'],
          email: map['email'],
          listQuestion: map['questions']);

  toJson() {
    return {
      'name': userName,
      'email': email,
      'questions': listQuestion,
    };
  }
}
