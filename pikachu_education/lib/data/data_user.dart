class User {
  String avatar;
  String name;
  String answeTitle;
  String answerContent;
  int numberOfComment;
  int numberOfLike;

  User(this.avatar, this.name,this.answeTitle, this.answerContent, this.numberOfComment,
      this.numberOfLike);
}

User pikachu1 = User(
    'assets/image/pikachu.png', 'Pikachu 1','Title', 'Answer content', 4, 231);
User pikachu2 = User('assets/image/pikachu.png', 'Pikachu 2','So Easy',
    '1+1=2', 10, 112);
User pikachu3 = User('assets/image/pikachu.png', 'Pikachu 3','So Difficult',
    ' 1+1=(1x2x3x4x5x6x7x8x9)/181440', 3, 34);


List<User> lists = [
  pikachu1,
  pikachu2,
  pikachu3,
];
