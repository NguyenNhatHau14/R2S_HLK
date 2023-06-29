class User {
  String avatar;
  String name;
  String answerContent;
  int numberOfComment;
  int numberOfLike;

  User(this.avatar, this.name, this.answerContent, this.numberOfComment,
      this.numberOfLike);
}

User pikachu1 = User(
    'assets/image/pikachu.png', 'Pikachu1', 'pika pika pika pika...', 4, 231);
User pikachu2 = User('assets/image/pikachu.png', 'Pikachu2',
    'pika pika pika pika pika pika pika pika pika pika pika pika', 10, 112);
User pikachu3 = User('assets/image/pikachu.png', 'Pikachu3',
    'pika pika pika pika pika pika pika pika', 3, 34);
User pikachu4 = User(
    'assets/image/pikachu.png',
    'Pikachu4',
    'pika pika pika pika pika pika pika pika pika pika pika pika pika pika pika pika...',
    7,
    1123);

List<User> lists = [
  pikachu1,
  pikachu2,
  pikachu3,
  pikachu4,
];
