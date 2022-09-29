
import 'package:flutter/material.dart';
import 'package:taskproject/chat.dart';
import 'package:taskproject/dashboard.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
                color: Colors.deepOrange,
                child:
          MaterialButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>DashboardPage()));
          },child: Text('add data'),))
          ,SizedBox(height: 19,),
      Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        color: Colors.deepOrange,
        child:
          MaterialButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Mychat()));
          },child: Text('view data'),))
        ],),
      )
    );
  }
}
