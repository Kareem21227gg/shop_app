import 'package:Shop/app/models/authentication/firebase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication firebaseAuthentication = Provider.of<FirebaseAuthentication>(context );
    return Scaffold(
      appBar: AppBar(title:Text("add product")),
      body: Center(child: 
      ElevatedButton(child: Text("log out") ,
      onPressed: () async {
                  await firebaseAuthentication.logOut();
      },),),
    );
  }
}