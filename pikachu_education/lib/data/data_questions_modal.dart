class DataQuestion {
  final String? userID;
  String? userName;
  num? timeAgo;
  String? tag;
  String? title;
  String? content;
  num? numberAnswer;
  int? numberLike;
  bool? favorite;

  DataQuestion({
    this.userID,
    this.userName,
    this.timeAgo,
    this.tag,
    this.title,
    this.content,
    this.numberAnswer,
    this.numberLike,
    this.favorite,
  });

  static DataQuestion fromJson(Map<String, dynamic> json) => DataQuestion(
      userID: json['userid'],
      userName: json['userName'],
      timeAgo: json['timeAgo'],
      tag: json['tag'],
      title: json['title'],
      content: json['content'],
      numberAnswer: json['numberAnswer'],
      numberLike: json['numberLike'],
      favorite: json['favorite']);

  Map<String, dynamic> toJson() => {
        'userid': userID,
        'userName': userName,
        'timeAgo': timeAgo,
        'tag': tag,
        'title': title,
        'content': content,
        'numberAnswer': numberAnswer,
        'numberLike': numberLike,
        'favorite': favorite,
      };
}

DataQuestion mockDataQuestionUser1 = DataQuestion(
    userID: '1',
    userName: 'Pikachu 1',
    timeAgo: 1,
    tag: 'match',
    title: 'Match Question',
    content: '1 + 1 = ?',
    numberAnswer: 3,
    numberLike: 12,
    favorite: false);
DataQuestion nockDataQuestionUser2 = DataQuestion(
    userID: '1',
    userName: 'Pikachu 2',
    timeAgo: 3,
    tag: 'physics',
    title: 'How to calculate velocity?',
    content: 'v = s / t \n v=?\ns=?\nt=?',
    numberAnswer: 4,
    numberLike: 77,
    favorite: false);
DataQuestion mockDataQuestionUser3 = DataQuestion(
    userID: '1',
    timeAgo: 6,
    userName: 'Pikachu 3',
    tag: 'chemistry',
    title: 'Atomic mass',
    content: 'How many atomic mass of the Copper (Cu)?',
    numberAnswer: 5,
    numberLike: 38,
    favorite: false);
DataQuestion mockDataQuestionUser4 = DataQuestion(
    userID: '1',
    userName: 'Pikachu 4',
    timeAgo: 1,
    tag: 'literature',
    title: 'Author',
    numberAnswer: 4,
    numberLike: 142,
    favorite: false);

List<DataQuestion> mockListQuestion = [
  mockDataQuestionUser1,
  nockDataQuestionUser2,
  mockDataQuestionUser3,
  mockDataQuestionUser4
];
