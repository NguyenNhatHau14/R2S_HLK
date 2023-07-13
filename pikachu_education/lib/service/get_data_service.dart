import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pikachu_education/data/data_questions.dart';


class GetDataSerVice{
  static Future<List <DataQuestion>> getDataFromServer() async{
    var url = Uri(
        scheme: 'https',
        host: 'https://64a6b38d096b3f0fcc805cbb.mockapi.io',
        path: '/user');
    var response = await http.get(url);
    var listMap =jsonDecode(response.body)as List<dynamic>;
    List<DataQuestion> result = listMap.map((e) => DataQuestion.fromJson(e)).toList();
    return result;
  }
}