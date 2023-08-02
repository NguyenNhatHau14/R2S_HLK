import 'package:firebase_database/firebase_database.dart';
import '../../data/data_modal/data_user_modal.dart';
import '../service_home_page/service_data_question.dart';

class DatabaseService {
  static Future<List<DataUserModal>> fetchDataQuestionFromSever() async {
    List<DataUserModal> listDataUsers = [];
     var needSnapShot = await FirebaseDatabase.instance.ref("users").orderByKey().get();
     var data = needSnapShot.value as Map;
    data.forEach((key, value) {
      listDataUsers.add(DataUserModal.fromMap(key: key, map: value));
    });
    // print('User id: ${listDataUsers[1].userId}');
    // print('User Name: ${listDataUsers[1].userName}');
    // print('Email: ${listDataUsers[1].email}');
    // print('Questions ${listDataUsers[1].listQuestion}');
    return listDataUsers;
  }


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

}
