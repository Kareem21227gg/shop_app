import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as  firebase_storage ;

class FireBaseStorage{
  firebase_storage.FirebaseStorage storage =firebase_storage.FirebaseStorage.instance;

Future<String> upLoadFile(File file , String id) async {
  
  var ref = storage.ref("/productImage/$id.png");
   var upLoadTask = ref.putFile(file);
   var url ;
   await upLoadTask.whenComplete(()async {
     url = await ref.getDownloadURL();
     print("-------$url--------");
   } );
  return url;
}
}