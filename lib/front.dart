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
    return Scaffold(appBar: AppBar(title: Text('front')),
      body: Column(
        children: [
          FilledButton(onPressed: () {Navigator.pushNamed(context, Login.l);}, child: Text('login')),

          FilledButton(onPressed: () {Navigator.pushNamed(context, Registeration.r);}, child: Text('Register'))
        ],
      ),
    );
  }
}
