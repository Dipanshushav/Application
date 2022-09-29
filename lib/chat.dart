

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/dashboard.dart';

class Mychat extends StatefulWidget {

  @override
  State<Mychat> createState() => _MychatState();
}
User? user =FirebaseAuth.instance.currentUser!;
class _MychatState extends State<Mychat> {
  var authc = FirebaseAuth.instance;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  var fs =FirebaseFirestore.instance.collection('user').doc(user!.uid).collection('chat');
  Future<void> _update([DocumentSnapshot?documentSnapshot]) async {
    try{
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _subjectController.text = documentSnapshot['email'];
      _emailController.text = documentSnapshot['mobile'];
      _mobileController.text = documentSnapshot['subject'];
      print(_nameController);
    }else(){
      print ('error');
    };}catch(e){print(e);}

    await showDialog(
        context: context,
        builder: (context) {
          return ListView(
            children: [
              AlertDialog(
                title: Text('update'),
                content: Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(hintText: 'Name'),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: 'password'),
                      ),
                      TextField(
                        controller: _mobileController,
                        decoration: InputDecoration(hintText: 'email'),
                      ),
                      TextField(
                        controller: _subjectController,
                        decoration: InputDecoration(hintText: 'mobile'),
                      )
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(onPressed: () async{
                    print('hello1');
                    final String name = _nameController.text;
                    final email = _emailController.text;
                    final mobile =_mobileController.text;
                    final subject= _subjectController.text;

                    await fs.doc(documentSnapshot?.id)
                        .update({'name': name,
                      'email': email,"mobile":mobile,"subject":subject})
                        .then((_) => print('Updated'))
                        .catchError((error) => print('Update failed: $error'));
                    _emailController.text = '';
                      // _passwordController.text = "";
                      _nameController.text = "";
                      _mobileController.text = "";
_subjectController.text ='';

                    Navigator.of(context).pop();
                  },
                      child: Text(
                          "submit"
                      )

                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('cancel'))
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chat'),
      actions: [IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DashboardPage()));
      },
          icon: Icon(Icons.person))],),
      body:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: fs.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          textColor: Colors.black,
                          autofocus: true,
                          onTap:(){_update(documentSnapshot);},


                          trailing: IconButton(
                              onPressed: () {
                                fs.doc(documentSnapshot.id)
                                    .delete();
                              },
                              icon: Icon(Icons.delete)),
                          tileColor: Colors.grey,
                          leading: CircleAvatar(
                            child: Text(
                              documentSnapshot['name'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          title: Text(documentSnapshot['mobile'],
                              style: TextStyle(fontSize: 18)),
                          subtitle: Text(documentSnapshot['email'],
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return CircularProgressIndicator();
            } else {
              return CircularProgressIndicator();
            }
          }));
    }
}














// StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: fs.snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot ds = snapshot.data!.docs[index];
//                   return Container(child: ListTile(
//     onTap: _update,
//                     leading: ds["name"],
//                     subtitle: ds['mobile'],
//                   ),);
//                 });
//           } else if (snapshot.hasError) {
//             return Center(child: CircularProgressIndicator(),);
//           } else {
//               return Center(child: CircularProgressIndicator());
//             }
//         }
//       )
//
//     );
//   }
// }
