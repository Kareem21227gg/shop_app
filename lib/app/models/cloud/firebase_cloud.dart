import 'package:Shop/app/models/user/customer.dart';
import 'package:Shop/app/models/user/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseCloud {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser(MyUser user) async {
    await firestore.collection("/customers").add({
      "id": user.id,
      "name": user.email
          .replaceRange(user.email.length - 10, user.email.length, ""),
      "email": user.email,
    });
  }

  Future<void> readUser(MyUser user) async {

  }

  Future<bool> isOwner(MyUser user) async {
     String id ="xhGCS3bFGrXTJPuYzUTW6bdP82v2"; //await firestore.collection("/owner").get().then((value)=> value.docs.first.data()["id"]);
    if(id == user.id){
      return true;
    }
    return false;
    
  }


  Future<String> addAllProductAsOwner(){
    
  }
}
