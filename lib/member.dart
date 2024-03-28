import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _Firestore = FirebaseFirestore.instance;

class Member extends StatefulWidget {
  static String m = 'member';

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Member',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [Ujjwal()],
      ),
    );
  }
}

class Ujjwal extends StatelessWidget {
  const Ujjwal({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _Firestore.collection('members').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('data not found');
          }
          if (snapshot.hasData) {
            final mem = snapshot.data?.docs;
            List <affix> af=[];
            for(var m in mem!){
              final nm = m.data()['Name'];
              final de = m.data()['Department'];
              final em = m.data()['Email'];
              final con = affix(name: nm, department: de, email: em);
              af.add(con);
            }
            return Expanded(child: ListView(children: af,));
          }
          else {
            throw Exception('failed to retrive message');
          }
        });
  }
}

class affix extends StatelessWidget {
  affix({required this.name, required this.department, required this.email});
  final String? name;
  final String? department;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Department: $department'),
            SizedBox(height: 4),
            Text('Email: $email'),
          ],
        ),
      ),
    );
  }
}
