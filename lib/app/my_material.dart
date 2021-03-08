import 'package:Shop/app/setup.dart';
import 'package:Shop/utillities/my_colors.dart';
import 'package:flutter/material.dart';


class MyMaterial extends StatefulWidget {
  @override
  _MyMaterialState createState() => _MyMaterialState();
}

class _MyMaterialState extends State<MyMaterial> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      color: MyColors.primaryColor,
      debugShowCheckedModeBanner: false, 

      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
            ),
          ),
          primaryColor: MyColors.primaryColor,
          primarySwatch: Colors.orange),
      home:SetUp() ,
      );
  }
}