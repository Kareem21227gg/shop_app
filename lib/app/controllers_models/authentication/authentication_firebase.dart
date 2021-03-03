import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthintication {
  
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  regester ( String email , String passWord) async {
    
    var user = _firebaseAuth.createUserWithEmailAndPassword(email: email, password: passWord);

    return user;
  }
  
}