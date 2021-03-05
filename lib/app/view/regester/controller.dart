import 'package:Shop/app/controllers_models/authentication/firebase_authentication.dart';
import 'package:flutter/material.dart';

class RegesterController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier alreadyhaveaccountNotifier = ValueNotifier<bool>(false);
  ValueNotifier brogressNotifier = ValueNotifier<bool>(false);
  ValueNotifier emailerrorNotifire =
      ValueNotifier<String>(null); //sorry null safte !
  ValueNotifier passworderrorNotifire = ValueNotifier<String>(null);

  void dispose() {
    alreadyhaveaccountNotifier.dispose();
    passworderrorNotifire.dispose();
    emailerrorNotifire.dispose();
    brogressNotifier.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void emailFiled(String value) {
    if (value.isEmpty)
      emailerrorNotifire.value = "email should not be null";
    else if (!value.endsWith(".com"))
      emailerrorNotifire.value = "email format not correct";
    else
      emailerrorNotifire.value = null;
  }

  void passwordFiled(String value) {
    if (value.isEmpty || value.length < 6)
      passworderrorNotifire.value = "you must type six characters in les";
    else {
      passworderrorNotifire.value = null;
    }
  }

  void onSingChange() {
    alreadyhaveaccountNotifier.value = !alreadyhaveaccountNotifier.value;
  }

  String sizeBoxText() {
    return (alreadyhaveaccountNotifier.value
        ? "new user?"
        : "already have an account?");
  }

  void buttonPressed(FirebaseAuthentication fireBaseAuthentication,
      BuildContext context) async {
    if (passworderrorNotifire.value == null &&
        emailerrorNotifire.value == null) {
      if (alreadyhaveaccountNotifier.value) {
        brogressNotifier.value = true;
        await fireBaseAuthentication.login(
            emailController.text, passwordController.text, context);
        brogressNotifier.value = false;
      } else {
        brogressNotifier.value = true;
        await fireBaseAuthentication.register(
            emailController.text, passwordController.text, context);
        brogressNotifier.value = false;
      }
    }
  }
}
