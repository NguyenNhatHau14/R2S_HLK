class DataQuestion {
  String userName;
  String timeAgo;
  String avatar;
  String tag;
  String title;
  String content;
  int numberAnswer;
  int numberLike;

  DataQuestion(this.userName,
      this.timeAgo,
      this.avatar,
      this.tag,
      this.title,
      this.content,
      this.numberAnswer,
      this.numberLike);
}

DataQuestion mockDataQuestionUser1 = DataQuestion(
    'Pikachu 1',
    '1 hour',
    'assets/image/pikachu_itachi.png',
    'match',
    'Match Question',
    '1 + 1 = ?',
    3,
    12);
DataQuestion nockDataQuestionUser2 = DataQuestion(
    'Pikachu 1',
    '1 hour',
    'assets/image/pikachu_itachi.png',
    'match',
    'Match Question',
    '1 + 1 = ?',
    3,
    12);
DataQuestion mockDataQuestionUser3 = DataQuestion(
    'Pikachu 1',
    '1 hour',
    'assets/image/pikachu_itachi.png',
    'match',
    'Match Question',
    '1 + 1 = ?',
    3,
    12);
DataQuestion mockDataQuestionUser4 = DataQuestion(
    'Pikachu 1',
    '1 hour',
    'assets/image/pikachu_itachi.png',
    'match',
    'Match Question',
    '1 + 1 = ?',
    3,
    12);


List<DataQuestion> mockListQuestion = [
  mockDataQuestionUser1,
  nockDataQuestionUser2,
  mockDataQuestionUser3,
  mockDataQuestionUser4
];