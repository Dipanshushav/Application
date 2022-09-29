import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/LogPage.dart';
import 'package:taskproject/usermanager.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
class Authentic {


  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      var result = await auth.signInWithEmailAndPassword(email: email, password: password);
      var user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }}
  Future signIn(String email, String password) async {
    try {
      var result =
      await auth.signInWithEmailAndPassword(email: email, password: email);
      User? user = result.user;
      return Future.value(user);
    } catch (e) {}
  }

  Future signUp(String email, String password, context) async {
    var result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return Future.value(user);
  }

  Future sign(String email, String password, BuildContext context) async {
    try {
      var result =
      await auth.signInWithEmailAndPassword(email: email, password: email);
      User? user = result.user;
      // return Future.value(true);
      return Future.value(user);
    } catch (e) {
      // simply passing error code as a message
      print(e);
    }
  }
