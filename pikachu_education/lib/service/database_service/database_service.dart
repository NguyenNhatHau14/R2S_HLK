import 'package:firebase_database/firebase_database.dart';
import 'package:pikachu_education/data/data_modal/data_answer_modal.dart';
import '../../data/data_modal/data_question_modal.dart';
import '../../data/data_modal/data_user_modal.dart';
import '../service_home_page/service_data_question.dart';

class DatabaseService {
  static Future<List<DataQuestionModal>> fetchDataQuestionFromSever() async {
    List<DataQuestionModal> listDataQuestions = [];
    List<DataUserModal> listDataUsers = [];
    var needSnapShotUser =
        await FirebaseDatabase.instance.ref("users").orderByKey().get();
    var dataUsers = needSnapShotUser.value as Map;
    dataUsers.forEach((key, value) {
      listDataUsers.add(DataUserModal.fromMap(key: key, map: value));
      for (int index = 0; index < listDataUsers.length; index++) {
        if (listDataUsers[index].listQuestion == null) {
          return;
        } else {
          var questions = listDataUsers[index].listQuestion as Map;
          questions.forEach((key, value) {
            listDataQuestions.add(DataQuestionModal.fromMap(
                key: key,
                map: value,
                userName: listDataUsers[index].userName,
                userId: listDataUsers[index].userId));
          });
        }
      }
    });

    //print('Questions ID: ${listDataQuestions[0].questionId}');
    // print('User id: ${listDataUsers[0].userId}');
    // print('User Name: ${listDataUsers[0].userName}');
    // print('Email: ${listDataUsers[0].email}');
    // print('Questions ${listDataUsers[0].listQuestion}');

    return listDataQuestions;
  }

  static Future<void> postDataQuestionToSever(
      {required DataQuestionModal itemToPost, required String userId}) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("users/$userId")
        .child('questions')
        .push();
    await ref.update({
      'questionTitle': itemToPost.questionTitle,
      'questionSubject': itemToPost.questionSubject,
      'questionContent': itemToPost.questionContent
    });
  }

  static Future<List<DataAnswerModal>> fetchDataAnswerFromSever(
      String userIdOfQuestion, String questionId) async {
    List<DataAnswerModal> listDataAnswer = [];
    List<DataQuestionModal> listDataQuestions = [];
    List<DataUserModal> listDataUsers = [];
    var needSnapShotUser = await FirebaseDatabase.instance
        .ref("/users/$userIdOfQuestion/questions/$questionId/answers")
        .orderByKey()
        .get();
    var dataAnswers = needSnapShotUser.value as Map;
    dataAnswers.forEach((key, value) {
      listDataAnswer.add(DataAnswerModal.fromMap(
        key: key,
        map: value,
      ));
    });

    // dataUsers.forEach((key, value) {
    //   listDataUsers.add(DataUserModal.fromMap(key: key, map: value));
    //   for (int indexListUser = 0; indexListUser < listDataUsers.length; indexListUser++) {
    //     var questions = listDataUsers[indexListUser].listQuestion as Map;
    //     questions.forEach((key, value) {
    //       listDataQuestions.add(DataQuestionModal.fromMap(
    //           key: key,
    //           map: value,
    //           userName: listDataUsers[indexListUser].userName,
    //           userId: listDataUsers[indexListUser].userId));
    //       for (int index = 0; index < listDataQuestions.length; index++) {
    //         var answers = listDataQuestions[index].listDataAnswer as Map;
    //         answers.forEach((key, value) {
    //           listDataAnswer.add(DataAnswerModal.fromMap(
    //               key: key,
    //               map: answers,
    //               userName: listDataUsers[indexListUser].userName)) ;
    //         });
    //       }
    //     });
    //   }
    // });
    //print('okokokokokokokokokokokok: ${listDataAnswer[80].userName}');
    //print('Questions ID: ${listDataQuestions[0].questionId}');
    // print('User id: ${listDataUsers[0].userId}');
    // print('User Name: ${listDataUsers[0].userName}');
    // print('Email: ${listDataUsers[0].email}');
    // print('Questions ${listDataUsers[0].listQuestion}');

    return listDataAnswer;
  }

  static Future<void> postDataAnswerToSever(
      {required DataAnswerModal itemToPost,
      required String userIdOfQuestion,
      required String questionId}) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("users/$userIdOfQuestion/questions/$questionId")
        .child('answers')
        .push();
    await ref.update({
      'userIdPost': itemToPost.userIdPost,
      'userNamePost': itemToPost.userNamePost,
      'answerTitle': itemToPost.answerTitle,
      'questionContent': itemToPost.answerContent
    });
  }

  static Future<String> getCurrentUserName({required String currentUserID}) async{
    var currentUserNameSnapshot = await   FirebaseDatabase.instance
        .ref("/users/$currentUserID").child('name').get();
    var currentUserName = currentUserNameSnapshot.value as String;

    return currentUserName;
  }
}
