import 'data_answer_modal.dart';

class DataQuestionModal {
  final String questionId;
  final String subjectQuestion;
  final String titleQuestion;
  final String contentQuestion;
  final List<DataAnswerModal>? listDataAnswer;

  DataQuestionModal(
      {required this.questionId,
      required this.subjectQuestion,
      required this.titleQuestion,
      required this.contentQuestion,
      this.listDataAnswer});
}



DataQuestionModal mockDataQuestionModalUser1 = DataQuestionModal(
    questionId: '1234',
    subjectQuestion: 'match',
    titleQuestion: 'titleQuestion',
    contentQuestion: 'contentQuestion');
DataQuestionModal mockDataQuestionModalUser2 = DataQuestionModal(
    questionId: '1234',
    subjectQuestion: 'match',
    titleQuestion: 'titleQuestion',
    contentQuestion: 'contentQuestion');
DataQuestionModal mockDataQuestionModalUser3 = DataQuestionModal(
    questionId: '1234',
    subjectQuestion: 'match',
    titleQuestion: 'titleQuestion',
    contentQuestion: 'contentQuestion');
List<DataQuestionModal> listDataQuestion = [
  mockDataQuestionModalUser1,
  mockDataQuestionModalUser1,
  mockDataQuestionModalUser3
];
