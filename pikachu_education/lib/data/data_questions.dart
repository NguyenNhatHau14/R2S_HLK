class DataQuestion {
  String? userName;
  String? timeAgo;
  String? avatar;
  String? tag;
  String? title;
  String? content;
  int? numberAnswer;
  int? numberLike;
  bool favorite;

  DataQuestion(this.userName,
      this.timeAgo,
      this.avatar,
      this.tag,
      this.title,
      this.content,
      this.numberAnswer,
      this.numberLike,this.favorite);
}

DataQuestion mockDataQuestionUser1 = DataQuestion(
    'Pikachu 1',
    '1 hour',
    'assets/image/pikachu_itachi.png',
    'match',
    'Match Question',
    '1 + 1 = ?',
    3,
    12,false);
DataQuestion nockDataQuestionUser2 = DataQuestion(
    'Pikachu 2',
    '3 day',
    'assets/image/pikachu_itachi.png',
    'physics',
    'How to calculate velocity?',
    'v = s / t \n v=?\ns=?\nt=?',
    4,
    77,false);
DataQuestion mockDataQuestionUser3 = DataQuestion(
    'Pikachu 3',
    '6 day',
    'assets/image/pikachu_itachi.png',
    'chemistry',
    'Atomic mass',
    'How many atomic mass of the Copper (Cu)?',
    5,
    38,false);
DataQuestion mockDataQuestionUser4 = DataQuestion(
    'Pikachu 4',
    '1 week',
    'assets/image/pikachu_itachi.png',
    'literature',
    'Author',
    'who is romeo and juliet author?',
    4,
    142,false);


List<DataQuestion> mockListQuestion = [
  mockDataQuestionUser1,
  nockDataQuestionUser2,
  mockDataQuestionUser3,
  mockDataQuestionUser4
];