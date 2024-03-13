import 'package:flutter/material.dart';
class Member extends StatefulWidget {
  static String m='member';

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Member'),),);
  }
}
