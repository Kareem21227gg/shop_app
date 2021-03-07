import 'package:Shop/utillities/my_colors.dart';
import 'package:flutter/material.dart';
import 'app/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home:MyProvider(),
      ) ;
  }
}
 