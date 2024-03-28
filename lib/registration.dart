import 'package:bureauaffix/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestorecloud = FirebaseFirestore.instance;

class Registeration extends StatefulWidget {
  static String r = 'registeration';

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String name;
  late String department;
  late String email;
  late String password;
  final messagetextcontroler = TextEditingController();
  final messagetextcontroler1 = TextEditingController();
  final messagetextcontroler2 = TextEditingController();
  final messagetextcontroler3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: Text(
            'Registration',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            // Added 'child:' here
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: messagetextcontroler,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      hintText: "enter your Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: messagetextcontroler1,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    department = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      hintText: "enter your Department"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: messagetextcontroler2,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      hintText: "enter your email"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: messagetextcontroler3,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "enter your password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  onPressed: () async {
                    _firestorecloud.collection('members').add({
                      'Name':name,'Department':department,'Email':email,
                    });
                    try {
                      final newuser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newuser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      }
                    } catch (e) {
                      print(e);
                    }
                    messagetextcontroler.clear();
                    messagetextcontroler1.clear();
                    messagetextcontroler2.clear();
                    messagetextcontroler3.clear();
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ));
  }
}
