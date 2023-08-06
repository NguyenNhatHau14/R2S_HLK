import 'package:firebase_database/firebase_database.dart';
import 'package:pikachu_education/data/data_modal/data_answer_modal.dart';
import '../../data/data_modal/data_comment_modal.dart';
import '../../data/data_modal/data_question_modal.dart';
import '../../data/data_modal/data_user_modal.dart';

class DatabaseService {
  static Future<DataUserModal> getCurrentUserInfo(
      {required String userID}) async {
    var currentUserInfoSnapshot =
        await FirebaseDatabase.instance.ref('users/$userID').orderByKey().get();
    var currentUserInfoMap = (currentUserInfoSnapshot.value ?? {}) as Map;
    final DataUserModal currentUserInfo = DataUserModal(
        userId: userID,
        userName: currentUserInfoMap['name'] ?? '',
        email: currentUserInfoMap['email'] ?? '');
    return currentUserInfo;
  }

  static Future<List<DataQuestionModal>> fetchDataQuestionFromSever() async {
    List<DataQuestionModal> listDataQuestions = [];
    List<DataUserModal> listDataUsers = [];
    var needSnapShotUser =
        await FirebaseDatabase.instance.ref("users").orderByKey().get();
    var dataUsers = (needSnapShotUser.value ?? {}) as Map;
    dataUsers.forEach((keyUser, value) {
      var user = (dataUsers[keyUser] ?? {}) as Map;
      listDataUsers.add(DataUserModal.fromMap(key: keyUser, map: value));
      var questionList = (user['questions'] ?? {}) as Map;
      questionList.forEach((key, value) {
        var question = (questionList[key] ?? {}) as Map;
        var answers = (question['answers'] ?? {}) as Map;
        listDataQuestions.add(DataQuestionModal.fromMap(
            key: key,
            map: value,
            userName: user['name'],
            userId: keyUser,
            numberAnswer: answers.length));
      });
      // for (int index = 0; index < listDataUsers.length; index++) {
      //   var questions = (listDataUsers[index].listQuestion ?? {});
      //
      //   questions.forEach((key, value) async {
      //     var question = (questions[key] ?? {}) as Map;
      //     var answers = (question['answers'] ?? {}) as Map;
      //     listDataQuestions.add(DataQuestionModal.fromMap(
      //         key: key,
      //         map: value,
      //         userName: listDataUsers[index].userName,
      //         userId: listDataUsers[index].userId,
      //         numberAnswer: answers.length));
      //   });
      // }
    });
    // print('okokokokokokokokokok: ${listDataQuestions.length}');
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
      'timePost': itemToPost.timePost,
      'questionTitle': itemToPost.questionTitle,
      'questionSubject': itemToPost.questionSubject,
      'questionContent': itemToPost.questionContent,
      'numberLike': itemToPost.numberLike
    });
  }

  static Future<List<DataAnswerModal>> fetchDataAnswerFromSever(
      String userIdOfQuestion, String questionId) async {
    List<DataAnswerModal> listDataAnswer = [];
    var needSnapShotUser = await FirebaseDatabase.instance
        .ref("/users/$userIdOfQuestion/questions/$questionId/answers")
        .orderByKey()
        .get();
    var dataAnswers = (needSnapShotUser.value ?? {}) as Map;
    dataAnswers.forEach((key, value) {
      var answer = (dataAnswers['$key']??{}) as Map;
      var comments = (answer['comments']??{}) as Map;
      listDataAnswer.add(DataAnswerModal.fromMap(
        key: key,
        map: value,
        numberComment:comments.length
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
      'timePost': itemToPost.timePost,
      'answerTitle': itemToPost.answerTitle,
      'questionContent': itemToPost.answerContent,
      'numberLike': itemToPost.numberLike
    });
  }

  static Future<String> getCurrentUserName(
      {required String currentUserID}) async {
    var currentUserNameSnapshot = await FirebaseDatabase.instance
        .ref("/users/$currentUserID")
        .child('name')
        .get();

    var currentUserName = currentUserNameSnapshot.value as String;
    return currentUserName;
  }

  static Future<void> postDataCommentToSever(
      {required DataCommentModal itemToPost,
      required String userIdOfQuestion,
      required String questionId,
      required String answerId}) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref(
            "/users/$userIdOfQuestion/questions/$questionId/answers/$answerId")
        .child('comments')
        .push();
    await ref.update({
      'userIdPostComment': itemToPost.userIdPostComment,
      'userNamePostComment': itemToPost.userNamePostComment,
      'contentComment': itemToPost.contentComment,
      'timePost': itemToPost.timePost,
    });
  }

  static Future<List<DataCommentModal>> fetchDataCommentFromSever(
      {required String userIdOfQuestion, required String questionId, required String answerId}) async {
    List<DataCommentModal> listDataComment = [];
    var needSnapShotComment = await FirebaseDatabase.instance
        .ref(
            '/users/$userIdOfQuestion/questions/$questionId/answers/$answerId/comments')
        .orderByKey()
        .get();

    var dataComments = (needSnapShotComment.value ?? {}) as Map;
    dataComments.forEach((key, value) {
      listDataComment.add(DataCommentModal.fromMap(key: key, map: value));
    });

    return listDataComment;
  }
}
