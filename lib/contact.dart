import 'package:flutter/material.dart';
class Contact extends StatefulWidget {
  static String p='contact';

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.black,title: Text('Contact',style: TextStyle(color: Colors.white),),),);
  }
}
