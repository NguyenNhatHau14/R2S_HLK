class DataQuestionModal {
  final String userId;
  final String userName;
  final String questionId;
  final String questionSubject;
  final String questionTitle;
  final String questionContent;
  final int? numberAnswer;
  final Map<dynamic, dynamic>? listDataAnswer;

  DataQuestionModal(
      {required this.userId,
      required this.userName,
      required this.questionId,
      required this.questionSubject,
      required this.questionTitle,
      required this.questionContent,
      this.numberAnswer,
      this.listDataAnswer});

  static DataQuestionModal fromMap(
          {required String key,
          required Map<dynamic, dynamic> map,
          required String userName,
          required String userId,
          required int numberAnswer}) =>
      DataQuestionModal(
          userId: userId,
          userName: userName,
          questionId: key,
          questionSubject: map['questionSubject'],
          questionTitle: map['questionTitle'],
          questionContent: map['questionContent'],
          numberAnswer: numberAnswer ?? 0,
          listDataAnswer: map['answers']);

  Map<dynamic, dynamic> toMap() {
    return {
      'questionTitle': questionTitle,
      'questionSubject': questionSubject,
      'questionContent': questionContent
    };
  }
}

// DataQuestionModal mockDataQuestionModalUser1 = DataQuestionModal(
// questionId: '1234',
// subjectQuestion: 'match',
// titleQuestion: 'titleQuestion',
// contentQuestion: 'contentQuestion');
// DataQuestionModal mockDataQuestionModalUser2 = DataQuestionModal(
// questionId: '1234',
// subjectQuestion: 'match',
// titleQuestion: 'titleQuestion',
// contentQuestion: 'contentQuestion');
// DataQuestionModal mockDataQuestionModalUser3 = DataQuestionModal(
// questionId: '1234',
// subjectQuestion: 'match',
// titleQuestion: 'titleQuestion',
// contentQuestion: 'contentQuestion');
// List<DataQuestionModal> listDataQuestion = [
// mockDataQuestionModalUser1,
// mockDataQuestionModalUser1,
// mockDataQuestionModalUser3
// ];
