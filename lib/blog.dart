import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore=FirebaseFirestore.instance;

class Blog extends StatefulWidget {
  static String b = 'blog';

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  late String title;
  late String written;
  late String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),backgroundColor: Colors.black,
        title: Text('Blog',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          children: [
            blg(),
            Text('Press the Add(+) button to add New BlogS'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,
        onPressed: (){
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
              TextField(onChanged: (value) {
                title=value;
              },
                controller: _textFieldController1,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Title:',
                ),
              ),
              SizedBox(height: 10),
              TextField(onChanged: (value) {
                written=value;
              },
                controller: _textFieldController2,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Written By :',
                ),
              ),
              SizedBox(height: 10),
              TextField(onChanged: (value) {
                content=value;
              },
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
              onPressed: ()async {
                // Handle the text field values here
                String enteredText1 = _textFieldController1.text;
                String enteredText2 = _textFieldController2.text;
                print('Entered Text 1: $enteredText1');
                print('Entered Text 2: $enteredText2');
                _firestore.collection('blog').add({'title':title,'written':written,'content':content,});
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

class blg extends StatelessWidget {
  const blg({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream:  _firestore.collection('blog').snapshots(), builder: (context,snapshot){
      if (!snapshot.hasData){
        return Text('text data not found');
      }
      if(snapshot.hasData){
        final gt=snapshot.data?.docs;
        List <icrd> li=[];
        for(var m in gt!){
          final tt=m.data()['title'];
          final wr=m.data()['written'];
          final co=m.data()['content'];
          final icd=icrd(title1: tt,written1: wr,content1: co,);
          li.add(icd);
        }
        return Expanded(child: ListView(children: li,));
      }
      else{
        throw Exception('failed to get data');
      }
    });
  }
}

class icrd extends StatelessWidget {
  icrd({required this.title1,required this.written1,required this.content1,});
  final String? title1;
  final String? written1;
  final String? content1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: $title1', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Written By: $written1'),
            SizedBox(height: 4),
            Text('Blog content: $content1'),
          ],
        ),
      ),
    );;
  }
}
