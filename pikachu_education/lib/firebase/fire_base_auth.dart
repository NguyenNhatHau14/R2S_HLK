import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
 static final FirebaseAuth _fireAuth = FirebaseAuth.instance;

 static void signUp(String email, String password, String name) {
    _fireAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
          _createUser(user.user!.uid, name, email);
      print(user);
    }).catchError((err) {
      //todo
    });
  }
 static _createUser (String userId, String name, String email){
    var user = {
      'name':name,
      'email':email
    };
    var ref=FirebaseDatabase.instance.ref().child('users');
    ref.child(userId).set(user).then((user){
      //success
    }).catchError((err){
      //todo
    });
  }
}
