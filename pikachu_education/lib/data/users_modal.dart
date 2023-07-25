class DataUserModal {
  final String? userId;
  String? userName;
  String? password;
  String? email;

  DataUserModal({this.userId, this.userName, this.password, this.email});
}

class DataQuestion extends DataUserModal {
  final String? questionId;
  String? questionTitle;
  String? subject;
  String? questionContent;
  int? numberLike;

  DataQuestion(
      {super.userId,
      super.userName,
      super.password,
      super.email,
      this.questionId,
      this.questionTitle,
      this.subject,
      this.questionContent,
      this.numberLike});
}

// class DataAnswer extends DataQuestion {
//   final String? answerId;
//   String? answerTitle;
//   String? answerContent;
//   int? numberLikeOfAnswer;
//   int? numberComment;
//   String? comment;
//   DataAnswer ({super.})
// }
