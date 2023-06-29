class User {
  String avatar;
  String name;
  String gender;
  int age;

  User (this.avatar,this.name, this.gender, this.age);
}

User pikachu = User ('assets/image/pikachu.jpg','Pikachu','Male',5);

List<User> lists=[pikachu];