import 'package:flutter/material.dart';

class Research extends StatefulWidget {
  static String re = 'research';

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.black,
        title: Text(
          'Research',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          'Add',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
