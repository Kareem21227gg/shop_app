import 'dart:async';

import 'package:Shop/app/controllers_models/user/my_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  FirebaseAuth _firebaseAuth;
  FirebaseAuthentication() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<User> login(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _sankeMasseg(
            context, "user not found, try change the email address :/");
      } else if (e.code == 'wrong-password') {
        _sankeMasseg(context, "wrong passwprd :/");
      } else {
        _sankeMasseg(context, "something wont work try to use VPN");
      }
    }
  }

  Future<User> register(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _sankeMasseg(
            context, "email is already in use try anther one or sing in!");
      }
      else {
        _sankeMasseg(context, "something wont work try to use VPN");
      }
    }
  }

  Stream<User> userStream() {
    return _firebaseAuth.userChanges();
  }

  User currentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
  }

  Future<MyUser> updateProfile(MyUser user) {
    // TODO: implement updateProfile
  }
  Future<void> logOut() {
    _firebaseAuth.signOut();
  }

  void _sankeMasseg(BuildContext context, String masseg) {
    Scaffold.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(masseg),
    ));
  }
}
