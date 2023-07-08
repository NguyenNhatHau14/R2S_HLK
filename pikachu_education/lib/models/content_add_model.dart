class AddModalList {
  String? title;
  String? content;
  AddModalList({this.title, this.content});
  Map<String, dynamic> toJson() => {'title': title, 'content': content};
  static AddModalList fromJson(Map<String, dynamic> json) =>
      AddModalList(title: json['title'], content: json['content']);
}
