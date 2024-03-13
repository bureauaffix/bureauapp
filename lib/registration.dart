import 'package:flutter/material.dart';
class Registeration extends StatefulWidget {
  static String r='registeration';

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.black,title: Text('Registration',style: TextStyle(color: Colors.white),),),);
  }
}
