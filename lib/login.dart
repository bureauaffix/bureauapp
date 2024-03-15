import 'package:bureauaffix/chat.dart';
import 'package:bureauaffix/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:bureauaffix/padding.dart';
class Login extends StatefulWidget {
  static String l = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {email = value;},
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: "enter your email"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {password = value;},
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
                onPressed: () async{
                  try{
                    final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (user != null){
                      Navigator.pushNamed(context, Home.h);
                    }
                  }
                  catch(e){
                    print(e);
                  }
                },
                child: const Text('Login'),
              ),
              padd("login", () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  } else {}
                } catch (e) {
                  print(e);
                }
                setState(() {
                  showSpinner = false;
                });
              }),
              padd(
                "home",
                    () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),);
  }
}
