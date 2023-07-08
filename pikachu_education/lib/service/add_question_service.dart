import 'dart:convert';

import 'package:pikachu_education/models/content_add_model.dart';
import 'package:http/http.dart' as http;

class AddQuestionService {
  static Future<List<AddModalList>> getDataFormServer() async {
    var url = Uri(
        scheme: 'https',
        host: '64a902e88b9afaf4844a289b.mockapi.io',
        path: '/api/pe/pkce');
    var respone = await http.get(url);
    var listMap = jsonDecode(respone.body) as List<dynamic>;
    List<AddModalList> result = listMap
        .map(
          (e) => AddModalList.fromJson(e),
        )
        .toList();

    return result;
  }

  static Future<void> addDataToServer(AddModalList item) async {
    var url = Uri(
      scheme: 'https',
      host: '64a902e88b9afaf4844a289b.mockapi.io',
      path: '/api/pe/pkce',
    );

    await http.post(
      url,
      body: jsonEncode(item.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
