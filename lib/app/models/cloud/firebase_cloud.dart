import 'package:Shop/app/models/product/base_product.dart';
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

 
  Future<String> addProduct(BaseProduct product) async {
    String uid;
    await firestore.collection("/products").add(
      {
      }
    ).then((value) {
      uid = value.id;
       firestore.doc(value.path).update({
         "id":value.id,
          "title":product.title,
         "description" : product.description,
        "price" : product.price,});
         
    });
    return uid;
  }

  Future<void> updateProduct(String url,String id) async {
    await firestore.collection("/products").doc("/$id").update({"imageUrl": url });
  }
}
