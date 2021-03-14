
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/authentication/firebase_authentication.dart';

import 'my_material.dart';

class MyProvider extends StatefulWidget {
  @override
  _MyProviderState createState() => _MyProviderState();
}

class _MyProviderState extends State<MyProvider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, AsyncSnapshot<FirebaseApp> snap) {
          if (snap.connectionState == ConnectionState.done) {
            return Provider<FirebaseAuthentication>(
              create:(_)=> FirebaseAuthentication(),
             child: MyMaterial(),
            );
           
          }
          return Container(child:Center(
            child: CircularProgressIndicator(),
          ),);
        });
    
  }
}
/**
 * create: (_) => Example(),
      // we use `builder` to obtain a
      new `BuildContext` that has
      access to the provider
      builder: (context) {
        // No longer throws
        return
        Text(context.watch<Example>()),
      }
    ),
 */