import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/chat.dart';
import 'package:taskproject/home.dart';


class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}
final FirebaseAuth auth = FirebaseAuth.instance;


class _SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  // TextEditingController emailController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
        ),
        body:Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: ListView(
                children: [
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'email'),
                    controller: emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'enter  valide email';
                      } else
                            () {
                          return null;
                        };
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'password'),
                    controller: passwordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'enter email';
                      } else
                            () {
                          return null;
                        };
                    },
                  ),
                  SizedBox(height: 10,),
                  RaisedButton(onPressed: () async {
if(_formkey.currentState!.validate()){

  await auth.createUserWithEmailAndPassword(
      email: emailController.text, password: passwordController.text).whenComplete((){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Myhome()));
  });
}


                  },child: Text("Register"),)
                ],
              ),
            ),
          ),
        ));
  }
}

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);

