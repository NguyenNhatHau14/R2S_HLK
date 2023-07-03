class User {
  String avatar;
  String name;
  String answerTitle;
  String answerContent;
  int numberOfComment;
  int numberOfLike;
  int dayAgo;
  String comment;

  User(this.avatar, this.name, this.answerTitle, this.answerContent,
      this.numberOfComment, this.numberOfLike, this.dayAgo, this.comment);
}

User pikachu1 = User('assets/image/pikachu.png', 'Pikachu 1', 'Title',
    'Answer content', 4, 231, 1, 'Pika Pika Pika...!!!!');
User pikachu2 = User('assets/image/pikachu.png', 'Pikachu 2', 'So Easy',
    '1+1=2', 10, 112, 3, 'You are Wonderful!!!');
User pikachu3 = User('assets/image/pikachu.png', 'Pikachu 3', 'So Difficult',
    ' 1+1=(1x2x3x4x5x6x7x8x9)/181440', 3, 34, 10, 'You are Wonderful!!!');
User pikachu4 = User(
    'assets/image/pikachu.png',
    'Pikachu 4',
    'So Difficult',
    ' (1+1=(1x2x3x4x5x6x7x8x9)/181440)+(2/2)',
    1,
    24,
    12,
    'Perfect!!! Perfect!!! Perfect!!! Perfect!!!');
User pikachu5 = User(
    'assets/image/pikachu.png',
    'Pikachu 5',
    'Normally ',
    '4/2',
    4,
    23,
    2,
    'Thanks for your answer!!!');

List<User> lists = [
  pikachu1,
  pikachu2,
  pikachu3,
  pikachu4,
];
