import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pikachu_education/data/data_questions_modal.dart';


class DataSerVice{
  static Future<List <DataQuestionModal>> getDataFromServer() async{
    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion');
    var response = await http.get(url);
    var lisMap = jsonDecode(response.body) as List<dynamic>;
    List<DataQuestionModal> result = lisMap.map((e) => DataQuestionModal.fromJson(e)).toList();
    print('Check Service: GET data of home page SUCCESSFUL');
    return result;

  }

  static Future<void> postDataFromServer(DataQuestionModal item) async{
    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion');

    DataQuestionModal dummyItem = item;
    dummyItem.userName=item.userName??'';
    dummyItem.timeAgo=item.timeAgo??0;
    dummyItem.title=item.title;
    dummyItem.tag=item.tag;
    dummyItem.content=item.content;
    dummyItem.numberLike=item.numberLike??0;
    dummyItem.numberAnswer=item.numberAnswer??0;
    dummyItem.favorite=item.favorite??false;
    await http.post(url,body: jsonEncode(dummyItem.toJson()),headers: {'Content-Type': 'application/json'});
    print('Check Service: POST data of home page SUCCESSFUL');
  }

  static Future<void> DeleteDataFromServer(DataQuestionModal item) async{
    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion/${item.userID}');
     await http.delete(url);
    print('Check Service: DELETE data of home page SUCCESSFUL');
  }


  static Future<void> updateDataFromServer(DataQuestionModal item) async{
    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion/${item.userID}');

    DataQuestionModal dummyItem=item;
    dummyItem.title=item.title;
    dummyItem.tag=item.tag;
    dummyItem.content=item.content;
print('user ID: ${item.userID}');
   await http.put(url,body: jsonEncode(dummyItem.toJson()),headers: {'Content-Type': 'application/json'});
    print('Check Service: UPDATE data of home page SUCCESSFUL');

  }
}