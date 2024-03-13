import 'package:flutter/material.dart';

class Research extends StatefulWidget {
  static String re = 'research';

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();
  final TextEditingController _textFieldController5 = TextEditingController();
  final TextEditingController _textFieldController6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.black,
        title: Text(
          'Research',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Press the Add(+) button to add New Research'),
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
          title: Text('Add Research'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textFieldController1,
                decoration: InputDecoration(
                  hintText: 'Project Name :',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _textFieldController2,
                decoration: InputDecoration(
                  hintText: 'Researcher Name:',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _textFieldController3,
                decoration: InputDecoration(
                  hintText: 'Email Id :',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _textFieldController4,
                decoration: InputDecoration(
                  hintText: 'Tecnology Used :',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _textFieldController5,
                decoration: InputDecoration(
                  hintText: 'Application :',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _textFieldController6,
                decoration: InputDecoration(
                  hintText: 'Project Link :',
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
                String enteredText3 = _textFieldController3.text;
                String enteredText4 = _textFieldController4.text;
                String enteredText5 = _textFieldController5.text;
                String enteredText6 = _textFieldController6.text;
                print('Entered Text 1: $enteredText1');
                print('Entered Text 2: $enteredText2');
                print('Entered Text 3: $enteredText3');
                print('Entered Text 4: $enteredText4');
                print('Entered Text 5: $enteredText5');
                print('Entered Text 6: $enteredText6');
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
