import 'package:Shop/app/models/cloud/firebase_cloud.dart';
import 'package:Shop/screens/add_product.dart';
import 'package:Shop/screens/home.dart';
import 'package:Shop/screens/onbording.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Shop/screens/regester.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/authentication/firebase_authentication.dart';




class SetUp extends StatefulWidget{
  @override
  _SetUpState createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> {
  @override
  Widget build(BuildContext context) {
    setWidget();
    FireBaseCloud fireBaseCloud = Provider.of<FireBaseCloud>(context);
    FirebaseAuthentication fireBaseAuthentication =
        Provider.of<FirebaseAuthentication>(context);
    return StreamBuilder<User>(
        stream: fireBaseAuthentication.userStream(),
        builder: (BuildContext context, AsyncSnapshot<User> snap) {
          if (snap.hasData) {
            return FutureBuilder(
                future: fireBaseCloud.isOwner(fireBaseAuthentication.user),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    if (snap.data) {
                      return AddProduct();
                    }
                    return Home();
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                });
          } else {
            return startScreen;
          }
        });
  }

  Widget startScreen = Center(
    child: CircularProgressIndicator(),
  );

  void setWidget() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = prefs.getBool('seen');
    if (seen == null || seen == false) {
      startScreen = Onbording();
    } else {
      startScreen = Scaffold(
        body: Regester(),
      ); //scaffold for snakebar when email is already exest
    }
     setState(() {});
  }
}



