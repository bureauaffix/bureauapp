import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  static String c = 'chat';

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text('Chat',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'type your massage here ....'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}
