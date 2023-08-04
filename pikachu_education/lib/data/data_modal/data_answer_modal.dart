class DataAnswerModal {
  final String userIdPost;
  final String userNamePost;
  final String answerId;
  final String answerTitle;
  final String answerContent;

  DataAnswerModal(
      {required this.userNamePost,
      required this.userIdPost,
      required this.answerId,
      required this.answerTitle,
      required this.answerContent});

  static DataAnswerModal fromMap(
          {required String key, required Map<dynamic, dynamic> map}) =>
      DataAnswerModal(
          userNamePost: map['userNamePost']??'admin',
          answerId: key,
          answerTitle: map['answerTitle'] ?? '',
          answerContent: map['questionContent'] ?? '',
          userIdPost: map['userIdPost']??'admin');
}
