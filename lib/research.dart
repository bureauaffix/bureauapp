import 'package:flutter/material.dart';
class Research extends StatefulWidget {
  static String re='research';

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Research'),),);
  }
}
