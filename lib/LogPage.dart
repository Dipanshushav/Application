import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:taskproject/auth.dart';
import 'package:taskproject/chat.dart';
import 'package:taskproject/home.dart';
import 'package:taskproject/resetpage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
final FirebaseAuth auth = FirebaseAuth.instance;
class _LoginState extends State<Login> {


  // final _auth = authentic ();
  final _formKey = GlobalKey<FormState>();
  // var authentics= authentic();
  String email ="";
  String password = "";
  GlobalKey<FormState>_formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          actions: [TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signin()));
          }, child: Text('signup',style: TextStyle(color: Colors.black),))],
        ),
        body:Form(
          key: _formkey,
          child: Center(
            child: ListView(
              children: [
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'email'),
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                  // controller: email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'enter email';
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
                  // controller: passwordcontroller,
                  onChanged: (val){
                    setState(() {
                      password=val;
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'enter email';
                    } else
                      () {
                        return null;
                      };
                  },
                ),
                RaisedButton(onPressed: () async {
    try {
    var result =
    await auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Myhome()));
      print(email);
      print(password);
    });
    // User? user = result.user;
    // print(user);


                    print(password); print(email);
                    print('hello');
                  }catch(e){
                    print(e);
                  }
                },child: Text("signIn"),)
              ],
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

Future signIn(String email, String password) async {
  try {
    var result =
    await auth.signInWithEmailAndPassword(email: email, password: email);
    User? user = result.user;
    print(user);
    return Future.value(user);
  } catch (e) {print(e);}
}