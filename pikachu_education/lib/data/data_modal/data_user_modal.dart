import 'package:firebase_database/firebase_database.dart';
import 'data_question_modal.dart';

class DataUserModal {
  late String userId;
  late String userName;
  late String email;
  List<DataQuestionModal>? listQuestion;

  DataUserModal(
      {required this.userId,
      required this.userName,
      required this.email,
      this.listQuestion});

  DataUserModal.fromSnapshot(DataSnapshot snapshot)
      : userId = snapshot.key.toString(),
        userName = (snapshot as Map<String, dynamic>?)?['name'] ?? '',
        email = (snapshot as Map<String, dynamic>?)?['email'] ?? '',
        listQuestion = (snapshot as Map<String, dynamic>?)?['questions'] ?? '';

  // DataUserModal.fromSnapshot (DataSnapshot snapshot){
  //   Map<String,dynamic> myData=Map<String,dynamic>.from(snapshot.value as Map);
  //   userId=snapshot.key.toString();
  //   userName=myData['name'].toString();
  //   email =myData['email'].toString();
  //   listQuestion=myData['questions'];
  // }

  toJson() {
    return {
      'name': userName,
      'email': email,
      'questions': listQuestion,
    };
  }

//  Map<String, dynamic> toMap() {
//   return {
//     'name': userName,
//     'email': email,
//     'questions': listQuestion
//   };
// }

// DataUserModal.fromDatabase(DocumentSnapshot<Map<String, dynamic>>doc)
//     :userId=doc.id,
//       userName=doc.data() ! ['name'],
//       email=doc.data() ! ['email'],
//       listQuestion=doc.data()!['questions'];
}
