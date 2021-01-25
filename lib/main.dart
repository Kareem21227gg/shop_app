
import 'authentication/authentication_firebase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthUi(),
    );
  }
}

class AuthUi extends StatefulWidget {
  @override
  _AuthUiState createState() => _AuthUiState();
}

class _AuthUiState extends State<AuthUi> {
  FireBaseAuthintication authintication = FireBaseAuthintication();
 

 
  @override
  Widget build(BuildContext context) {
    return Text(';;');
                    // onPressed: () async {
                    //   print('i am here');
                    //   var user = await authintication.regester(
                    //       "kareem20001227@gmail.com", "(k:K)12345");
                    //   print(user.toString());
                    // },
                 
  }
  
}
