
class DataUserModal {
  late String userId;
  late String userName;
  late String email;
  Map<dynamic,dynamic>? listQuestion;

  DataUserModal({required this.userId,
     required this.userName,
     required this.email,
    this.listQuestion});

  static DataUserModal fromMap({required String key, required Map<dynamic, dynamic> map } ) =>
      DataUserModal(userId: key,
          userName: map['name'], email: map['email'],listQuestion: map['questions']);

  toJson() {
    return {
      'name': userName,
      'email': email,
      'questions': listQuestion,
    };
  }
}
