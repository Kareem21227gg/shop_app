import 'package:Shop/app/models/authentication/firebase_authentication.dart';
import 'package:Shop/app/models/cloud/firebase_cloud.dart';
import 'package:Shop/screens/sup_home.dart';
import 'package:Shop/utillities/my_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuthentication firebaseAuthentication;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      SupHome(),
      Center(
        child: Text(
          'Index 1: Business',
        ),
      ),
      Center(
        child: Text(
          'Index 2: School',
        ),
      ),
      Center(
        child: Text(
          'Index 3: Business',
        ),
      ),
      Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                firebaseAuthentication.logOut();
              },
              child: Text("lod out"),
            ),
            Text(
              'Index 4: School',
            ),
          ],
        ),
      ),
    ];

    firebaseAuthentication = Provider.of<FirebaseAuthentication>(context);
    return Scaffold(
      body: _widgetOptions[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            this.index = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: "cart", icon: Icon(Icons.shopping_cart_outlined)),
          BottomNavigationBarItem(
              label: "saved", icon: Icon(Icons.favorite_outline)),
          BottomNavigationBarItem(
              label: "user", icon: Icon(Icons.supervised_user_circle)),
        ],
      ),
    );
  }
}
