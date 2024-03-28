import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

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
  late String pname;
  late String rname;
  late String email;
  late String technology;
  late String application;
  late String link;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Research',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            rsh(),
            Text('Press the Add(+) button to add New Research'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          _showTextFieldDialog(context);
        },
        tooltip: 'Add',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showTextFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Research'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    pname = value;
                  },
                  controller: _textFieldController1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Project Name :',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    rname = value;
                  },
                  controller: _textFieldController2,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Researcher Name:',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  controller: _textFieldController3,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email Id :',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    technology = value;
                  },
                  controller: _textFieldController4,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Technology Used :',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    application = value;
                  },
                  controller: _textFieldController5,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Application :',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    link = value;
                  },
                  controller: _textFieldController6,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Project Link :',
                  ),
                ),
              ],
            ),
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
                _firestore.collection('research').add({
                  'pname': pname,
                  'rname': rname,
                  'email': email,
                  'technology': technology,
                  'application': application,
                  'link': link,
                });
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

class rsh extends StatelessWidget {
  const rsh({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore.collection('research').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text data not found');
          }
          if (snapshot.hasData) {
            final gt = snapshot.data?.docs;
            List<icrd> li = [];
            for (var m in gt!) {
              final pn = m.data()['pname'];
              final rn = m.data()['rname'];
              final em = m.data()['email'];
              final tc = m.data()['technology'];
              final ap = m.data()['application'];
              final lk = m.data()['link'];
              final icd = icrd(
                pname1: pn,
                rname1: rn,
                email1: em,
                technology1: tc,
                application1: ap,
                link1: lk,
              );
              li.add(icd);
            }
            return Expanded(
                child: ListView(
              children: li,
            ));
          } else {
            throw Exception('failed to get data');
          }
        });
  }
}

class icrd extends StatelessWidget {
  icrd({
    required this.pname1,
    required this.rname1,
    required this.email1,
    required this.technology1,
    required this.application1,
    required this.link1,
  });
  final String? pname1;
  final String? rname1;
  final String? email1;
  final String? technology1;
  final String? application1;
  final String? link1;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Project Name: $pname1',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Researcher Name: $rname1'),
            SizedBox(height: 4),
            Text('Email Id: $email1'),
            SizedBox(height: 4),
            Text('Technology Used: $technology1'),
            SizedBox(height: 4),
            Text('Application: $application1'),
            SizedBox(height: 4),
            Text('Project Link: $link1'),
          ],
        ),
      ),
    );
    ;
  }
}
