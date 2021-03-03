import 'package:Shop/app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/onbording.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, AsyncSnapshot<FirebaseApp> snap) {
        return MaterialApp(
          color: MyColors.primaryColor,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              buttonColor: MyColors.primaryColor,
              primaryColor: MyColors.primaryColor,
              primarySwatch: Colors.orange),
          home: Onbording(),
        );
      },
    );
  }
}
