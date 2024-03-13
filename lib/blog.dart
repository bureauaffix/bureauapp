import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  static String b = 'blog';

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text('Blog',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Text('Press the Add(+) button to add New BlogS'),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,
        onPressed: () {
          _showTextFieldDialog(context);
        },
        tooltip: 'Add',
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  void _showTextFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Blog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textFieldController1,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Title:',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _textFieldController2,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Written By :',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _textFieldController3,
                keyboardType: TextInputType.multiline,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Blog Content :',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle the text field values here
                String enteredText1 = _textFieldController1.text;
                String enteredText2 = _textFieldController2.text;
                print('Entered Text 1: $enteredText1');
                print('Entered Text 2: $enteredText2');
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}