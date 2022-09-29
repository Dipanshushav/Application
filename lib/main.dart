// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_app1/chat.dart';
// import 'package:firebase_app1/home.dart';
// import 'package:firebase_app1/log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskproject/LogPage.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // User? user =FirebaseAuth.instance.currentUser!();

    return MaterialApp(home: Login());
//        FutureBuilder(
//         future: ,
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
// if(snapshot.hasData){
//   return
// }
// else(){
//   return
// }
//     },

    // ),
    //   );
  }
}

// class MyApp extends StatelessWidget {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//
//   get storage => null;
//   Future<bool> checkLoginStatus() async {
//     String? value = await storage.read(key: "uid");
//     if (value == null) {
//       return false;
//     }
//     return true;
//   }

// @override
// Widget build(BuildContext context) {
// return FutureBuilder(
//     future: _initialization,
//     builder: (context, snapshot) {
//       // Check for Errors
//       if (snapshot.hasError) {
//         print("Something Went Wrong");
//       }
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(child: CircularProgressIndicator());
//       }
//           return MaterialApp(
//             title: 'Flutter Firebase EMail Password Auth',
//             theme: ThemeData(
//               primarySwatch: Colors.deepPurple,
//             ),
//             debugShowCheckedModeBanner: false,
//             home: FutureBuilder(
//                 future: checkLoginStatus(),
//                 builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//                   if (snapshot.data == false) {
//                     return MyLogin();
//                   }
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Container(
//                         color: Colors.white,
//                         child: Center(child: CircularProgressIndicator()));
//                   }
//                   return MyChat();
//                 }),
//           );
//         });
//   }
// }
