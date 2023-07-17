import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pikachu_education/data/data_questions_modal.dart';


class DataSerVice{
  static Future<List <DataQuestion>> getDataFromServer() async{

    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion');
    var response = await http.get(url);
    print(response.body);
    var lisMap = jsonDecode(response.body) as List<dynamic>;
    List<DataQuestion> result = lisMap.map((e) => DataQuestion.fromJson(e)).toList();
    return result;
  }
}