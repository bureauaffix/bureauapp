import 'package:flutter/material.dart';
import 'package:bureauaffix/login.dart';
import 'package:bureauaffix/registration.dart';

class Front extends StatefulWidget {
  static String f = 'front';

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text('WELCOME !',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
          Image(
            image: const AssetImage("images/front.jpg"),
          ),
          FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, Login.l);
              },style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
              child: Text('login')),
          FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, Registeration.r);
              },style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
              child: Text('Register'))
        ],
      ),
    );
  }
}
