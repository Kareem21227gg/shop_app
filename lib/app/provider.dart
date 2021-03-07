import 'package:Shop/app/setup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/authentication/firebase_authentication.dart';

class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, AsyncSnapshot<FirebaseApp> snap) {
        if(snap.connectionState == ConnectionState.done){
        return Provider<FirebaseAuthentication>(
          create: (_) => FirebaseAuthentication(),
          child: SetUp(),
        );
        }
        return Center(child: 
        CircularProgressIndicator(),);
      }
    );
  }
}
