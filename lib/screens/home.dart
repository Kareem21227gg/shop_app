import 'package:Shop/app/models/authentication/firebase_authentication.dart';
import 'package:Shop/app/models/cloud/firebase_cloud.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      FireBaseCloud fireBaseCloud = Provider.of<FireBaseCloud>(context , listen: false);
    FirebaseAuthentication firebaseAuthentication = Provider.of<FirebaseAuthentication>(context , listen: false);
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: Text("log out"),
            onPressed: () async {
                      
             await firebaseAuthentication.logOut();
            },
          ),
           ElevatedButton(
            child: Text("is owner?"),
            onPressed: () async {
              
 await fireBaseCloud.isOwner(firebaseAuthentication.user).then((value){ print("---------$value---------");});

            },
          ),
        ],
      ),
    );
  }
}