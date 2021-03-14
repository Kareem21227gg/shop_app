import 'dart:async';
import 'package:Shop/app/models/cloud/firebase_cloud.dart';
import 'package:Shop/app/models/user/customer.dart';
import 'package:Shop/app/models/user/my_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FireBaseCloud _fireBaseCloud = FireBaseCloud();
  MyUser user ;

  Future<MyUser> login(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      user = currentUser();
      return user;
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

  Future<MyUser> register(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = currentUser();
      _fireBaseCloud.addUser(user);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _sankeMasseg(
            context, "email is already in use try another one or sing in!");
      } else {
        _sankeMasseg(context, "something wont work try to use VPN");
      }
    }
  }

  Stream<User> userStream() {
    return _firebaseAuth.userChanges();
  }

  MyUser currentUser() {
    return Customer(
        id: _firebaseAuth.currentUser.uid == null ? null:_firebaseAuth.currentUser.uid,
        email: _firebaseAuth.currentUser.email  == null ? null:_firebaseAuth.currentUser.email);
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(masseg),
    ));
  }
}
