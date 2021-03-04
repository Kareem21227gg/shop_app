import 'package:Shop/screens/home.dart';
import 'package:Shop/screens/onbording.dart';
import 'package:Shop/utillities/my_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Shop/screens/regester.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers_models/authentication/firebase_authentication.dart';

class SetUp extends StatefulWidget {
  @override
  _SetUpState createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> {
  Widget _screen = Container(color: Colors.white);

  @override
  Widget build(BuildContext context) {
     FirebaseAuthentication fireBaseAuthentication =
        Provider.of<FirebaseAuthentication>(context);
    isNewUser();
    return MaterialApp(
      color: MyColors.primaryColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          buttonColor: MyColors.primaryColor,
          primaryColor: MyColors.primaryColor,
          primarySwatch: Colors.orange),
      home: StreamBuilder<User>(
        stream:fireBaseAuthentication.userStream() ,
        builder: (BuildContext context , AsyncSnapshot<User> snap){
            if(snap.hasData){
              return Home();
            }
            else{
            
              return  _screen;
            }
        },
      ), // TODO:handel is already log in case
      // home:_screen,
    );
  }

  void isNewUser(  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await Future.delayed(Duration(seconds: 4)); for welcom page if any
    bool seen = prefs.getBool('seen');
    if (seen == null || seen == false) {
      _screen = Onbording();
    } else {
      _screen = Scaffold(body:Regester());//scaffold for snakebar when email is already exest 
    }
    setState(() {});
  }
}
