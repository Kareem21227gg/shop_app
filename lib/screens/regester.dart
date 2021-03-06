import 'package:Shop/app/controllers_models/authentication/firebase_authentication.dart';
import 'package:Shop/utillities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Shop/app/view/regester/controller.dart';

class Regester extends StatefulWidget {
  @override
  _RegesterState createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  RegesterController regesterController = RegesterController();
  @override
  void dispose() {
    regesterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication fireBaseAuthentication =
        Provider.of<FirebaseAuthentication>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Regester"),
      ),
      body: Center(
        child: Card(
          elevation: 3,
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        regesterController.emailFiled(value);
                      },
                      controller: regesterController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "email",
                        errorText: regesterController.emailerrorNotifire.value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        regesterController.passwordFiled(value);
                      },
                      controller: regesterController.passwordController,
                      obscureText: true,
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        errorText:
                            regesterController.passworderrorNotifire.value,
                        border: OutlineInputBorder(),
                        labelText: "password",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        regesterController.onSingChange();
                      },
                      child: Text(
                        regesterController.sizeBoxText(),
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
              ),
              ElevatedButton(
                style:ButtonStyle() ,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: _buttonChiled(),
                    )),
                onPressed: () {
                  regesterController.buttonPressed(
                      fireBaseAuthentication, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonChiled() {
    if (regesterController.brogressNotifier.value) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: MyColors.primaryColor,
        ),
      );
    }
    return Text(
      regesterController.alreadyhaveaccountNotifier.value
          ? "Sing In!"
          : "Sing Up!",
      style: TextStyle(
          color: Colors.white, fontSize: 26, fontWeight: FontWeight.w300),
    );
  }
}
