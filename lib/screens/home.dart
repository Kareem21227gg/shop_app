import 'package:Shop/app/models/authentication/firebase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication firebaseAuthentication = Provider.of<FirebaseAuthentication>(context );
    return Container(
      color:Colors.brown,
      child:ElevatedButton(
        child: Text("log out"),
        onPressed: () async {
          await firebaseAuthentication.logOut();
        },
      ),
    );
  }
}