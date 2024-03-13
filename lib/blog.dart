import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  static String b = 'blog';

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text('Blog',style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        icon: Icon(Icons.add,color: Colors.white,),
        label: Text('Add',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
    );
  }
}
