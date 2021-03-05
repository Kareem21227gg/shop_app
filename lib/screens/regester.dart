import 'package:Shop/app/controllers_models/authentication/firebase_authentication.dart';
import 'package:Shop/utillities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Regester extends StatefulWidget {
  @override
  _RegesterState createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ValueNotifier _alreadyhaveaccountNotifier = ValueNotifier<bool>(false);
  ValueNotifier _brogressNotifier = ValueNotifier<bool>(false);
  ValueNotifier _emailerrorNotifire = ValueNotifier<String>(null);//sorry null safte !
   ValueNotifier _passworderrorNotifire = ValueNotifier<String>(null);
   
  @override
  void dispose() {
    _alreadyhaveaccountNotifier.dispose();
    _passworderrorNotifire.dispose();
    _emailerrorNotifire.dispose();
    _brogressNotifier.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication fireBaseAuthentication =
        Provider.of<FirebaseAuthentication>(context , listen :false);
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
                          _emailerrorNotifire.value = "email should not be null";
                        else if (!value.endsWith(".com"))
                          _emailerrorNotifire.value = "email format not correct";
                        else
                          _emailerrorNotifire.value = null;
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "email",
                        errorText: _emailerrorNotifire.value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        if (value.isEmpty || value.length < 6)
                          _passworderrorNotifire.value = "you must type six characters in les";
                        else {
                          _passworderrorNotifire.value = null;
                        }
                      },
                      controller: _passwordController,
                      obscureText: true,
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        errorText: _passworderrorNotifire.value,
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
                          _alreadyhaveaccountNotifier.value = !_alreadyhaveaccountNotifier.value;
                      },
                      child: Text(
                        _alreadyhaveaccountNotifier.value
                            ? "new user?"
                            : "already have an account?",
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
              ),
              RaisedButton(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: _buttonChiled(),
                    )),
                onPressed: () async {
                  if (_passworderrorNotifire.value == null && _emailerrorNotifire.value == null) {
                    if ( _alreadyhaveaccountNotifier.value) {
                        _brogressNotifier.value = true;
                      await fireBaseAuthentication.login(_emailController.text,
                          _passwordController.text, context);
                        _brogressNotifier.value = false;
                    } else {
                        _brogressNotifier.value = true;
                      await fireBaseAuthentication.register(
                          _emailController.text,
                          _passwordController.text,
                          context);
                        _brogressNotifier.value = false;
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
   Widget _buttonChiled() {
    if (_brogressNotifier.value) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: MyColors.primaryColor,
        ),
      );
    }
    return Text(
      _alreadyhaveaccountNotifier.value ? "Sing In!" : "Sing Up!",
      style: TextStyle(
          color: Colors.white, fontSize: 26, fontWeight: FontWeight.w300),
    );
  }
}
