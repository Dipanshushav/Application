import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/usermanager.dart';

User? userInfo = FirebaseAuth.instance.currentUser;

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  bool value = true;

  var fs = FirebaseFirestore.instance.collection('user');

  TextEditingController namecont = TextEditingController();

  TextEditingController emailcont = TextEditingController();

  TextEditingController mobilecont = TextEditingController();

  TextEditingController subjectcont = TextEditingController();

  var vdropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: namecont,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: emailcont,
                  decoration: InputDecoration(hintText: 'password'),
                ),
                TextField(
                  controller: mobilecont,
                  decoration: InputDecoration(hintText: 'email'),
                ),
                TextField(
                  controller: subjectcont,
                  decoration: InputDecoration(hintText: 'mobile'),
                ),Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:  Border.fromBorderSide(BorderSide(color: Colors.grey))
                    ),

                  child:
                DropdownButton(
                        // Initial Value
                        value: vdropdownvalue,

                        // Down Arrow Icon
                        icon:  Padding(
                          padding:  EdgeInsets.only(left: 220),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),

                        // Array list of items
                        items: _currencies.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (newValue) {
                          setState(() {
                            vdropdownvalue = newValue!;
                          });
                        },
                      ),
                ),


                ElevatedButton(
                    onPressed: () async {
                      if (value == true) {
                        print('hello1');
                        final String name = namecont.text;
                        final email = emailcont.text;
                        final mobile = mobilecont.text;
                        final subject = subjectcont.text;

                        await fs
                            .doc(userInfo!.uid)
                            .collection('chat')
                            .doc()
                            .set({
                              'name': name,
                              'email': email,
                              "mobile": mobile,
                              'suject': subject
                            })
                            .then((_) => print('Updated'))
                            .catchError(
                                (error) => print('Update failed: $error'));
                        // _emailController.text = '';
                        //   _passwordController.text = "";
                        //   _nameController.text = "";
                        //   _mobileController.text = "";

                        Navigator.of(context).pop();
                      } else
                        () {
                          return Text('please checkout');
                        };
                    },
                    child: Text("submit"))
              ],
            ),
            chechbox()
          ],
        ),
      ),
    ));
  }

  Widget chechbox() {
    return InkWell(
        onTap: () {
          value != false;
        },
        child: ListTile(
            title: Text('I am not robot'),
            leading: Checkbox(
              value: this.value,
              onChanged: (value) {
                setState(() {
                  this.value = value!;
                });
              },
            ))); //Checkbox
  }
}
