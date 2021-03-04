import 'dart:async';

import 'package:Shop/app/controllers_models/authentication/firebase_authentication.dart';
import 'package:Shop/screens/home.dart';
import 'package:Shop/utillities/my_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Regester extends StatefulWidget {
  @override
  _RegesterState createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _alreadyhaveaccount = false; //to change the ui
  bool _brogress = false;
  Widget _buttonChiled() {
    if (_brogress) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: MyColors.primaryColor,
        ),
      );
    }
    return Text(
      _alreadyhaveaccount ? "Sing In!" : "Sing Up!",
      style: TextStyle(
          color: Colors.white, fontSize: 26, fontWeight: FontWeight.w300),
    );
  }

  //sorre null safte
  String passworderror = null;
  String emailerror = null;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication fireBaseAuthentication =
        Provider.of<FirebaseAuthentication>(context);
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
                        if (value.isEmpty)
                          emailerror = "email should not be null";
                        else if (!value.endsWith(".com"))
                          emailerror = "email format not correct";
                        else
                          emailerror = null;
                        setState(() {});
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "email",
                        errorText: emailerror,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        if (value.isEmpty || value.length < 6)
                          passworderror = "you must type six characters in les";
                        else {
                          passworderror = null;
                        }

                        setState(() {});
                      },
                      controller: _passwordController,
                      obscureText: true,
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        errorText: passworderror,
                        border: OutlineInputBorder(),
                        labelText: "password",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _alreadyhaveaccount = !_alreadyhaveaccount;
                      });
                    },
                    child: Text(
                      _alreadyhaveaccount
                          ? "new user?"
                          : "already have an account?",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              RaisedButton(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: _buttonChiled(),
                    )),
                onPressed: () async {
                  if (passworderror == null && emailerror == null) {
                    if (_alreadyhaveaccount) {
                      setState(() {
                        _brogress = true;
                      });
                      await fireBaseAuthentication.login(_emailController.text,
                          _passwordController.text, context);
                      setState(() {
                        _brogress = false;
                      });
                    } else {
                      setState(() {
                        _brogress = true;
                      });
                      await fireBaseAuthentication.register(
                          _emailController.text,
                          _passwordController.text,
                          context);
                      setState(() {
                        _brogress = false;
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
