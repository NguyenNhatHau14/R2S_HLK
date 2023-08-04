import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import '../../data/data_modal/data_user_modal.dart';
import '../../data/demo_data/test_data_questions_modal.dart';


class QuestionModal {
  String questionId;
  String questionTitle;
  String questionSubject;
  String questionContent;

  QuestionModal(
      {required this.questionId,
      required this.questionTitle,
      required this.questionSubject,
      required this.questionContent});
}

class ServiceDataQuestion {
  static Future<void> postDataQuestionToSever(
      {required QuestionModal itemToPost, required String userId}) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("users/$userId")
        .child('questions').push();
    await ref.update({
      'questionTitle': itemToPost.questionTitle,
      'questionSubject': itemToPost.questionSubject,
      'questionContent': itemToPost.questionContent
    });
  }

    static Future<void> fetchDataQuestionFromSever() async {
       FirebaseDatabase.instance.ref("users").onValue.listen((event) {

        final data =
        Map<dynamic, dynamic>.from(event.snapshot.value as Map,);
        List<DataUserModal> users =[];
        data.forEach((key, value) {
          print('okokookok');
          users.add(DataUserModal.fromMap(key: key,map: value));
        });
        print('data: ${data}');
         print('User id: ${users[1].userId}');
         print('User Name: ${users[1].userName}');
         print('Email: ${users[1].email}');
         print('Questions ${users[1].listQuestion}');
      });

    }




  static Future<List<DataQuestionModalTest>> getDataFromServer() async {
    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion');
    var response = await http.get(url);
    var lisMap = jsonDecode(response.body) as List<dynamic>;
    print(response.body.runtimeType);
    print(lisMap);

    List<DataQuestionModalTest> result =
        lisMap.map((e) => DataQuestionModalTest.fromJson(e)).toList();
    //print(result);
    //print('Check Service: GET data of home page SUCCESSFUL');
    return result;
  }

  static Future<void> postDataFromServer(DataQuestionModalTest item) async {
    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion');

    DataQuestionModalTest dummyItem = item;
    dummyItem.userName = item.userName ?? '';
    dummyItem.timeAgo = item.timeAgo ?? 0;
    dummyItem.title = item.title;
    dummyItem.tag = item.tag;
    dummyItem.content = item.content;
    dummyItem.numberLike = item.numberLike ?? 0;
    dummyItem.numberAnswer = item.numberAnswer ?? 0;
    dummyItem.favorite = item.favorite ?? false;
    await http.post(url,
        body: jsonEncode(dummyItem.toJson()),
        headers: {'Content-Type': 'application/json'});
    // print('Check Service: POST data of home page SUCCESSFUL');
  }

  static Future<void> DeleteDataFromServer(DataQuestionModalTest item) async {
    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion/${item.userID}');
    await http.delete(url);
    //print('Check Service: DELETE data of home page SUCCESSFUL');
  }

  static Future<void> updateDataFromServer(DataQuestionModalTest item) async {
    var url = Uri(
        scheme: 'https',
        host: '64b4b6010efb99d86269308a.mockapi.io',
        path: '/DataQuestion/${item.userID}');

    DataQuestionModalTest dummyItem = item;
    dummyItem.title = item.title;
    dummyItem.tag = item.tag;
    dummyItem.content = item.content;
    await http.put(url,
        body: jsonEncode(dummyItem.toJson()),
        headers: {'Content-Type': 'application/json'});
    // print('Check Service: UPDATE data of home page SUCCESSFUL');
  }
}
