import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';



final _firestorecloud = FirebaseFirestore.instance;
late User loguser;

class chat extends StatefulWidget {
  static String c = 'chat';
  //const chat_screen({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late String mes;
  //FirebaseUser loguser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currenuser();
  }

  void currenuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loguser = user;
        //print(loguser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getdatamessageusingsnapchat() async {
    await for (var i in _firestorecloud.collection('messages').snapshots()) {
      for (var ms in i.docs) {
        print(ms.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text("Chat Now",style: TextStyle(color: Colors.white),),

        actions: [
          IconButton(
              onPressed: () {
                //getdatamessageusingsnapchat();
                //getdatamessage();
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            StreamBuilder(
                stream: _firestorecloud
                    .collection('chat')
                    .orderBy('time', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: Text(
                            "data not found") /*CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            )*/
                    );
                  }

                  if (snapshot.hasData) {
                    final messages = snapshot.data?.docs.reversed;
                    List<mbubble> mw = [];
                    for (var message in messages!) {
                      final mt = message.data()['text'];
                      final ms = message.data()['sender'];
                      final messageTime = message.data()['time'];
                      final currentUser = loguser.email;

                      final messagebubbler = mbubble(
                        ms: ms,
                        mt: mt,
                        time: messageTime,
                        isMe: currentUser == ms,
                      );
                      mw.add(messagebubbler);
                    }

                    return Expanded(
                      child: ListView(
                        reverse: true,
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        children: mw,
                      ),
                    );
                  } else {
                    throw Exception('failed to retrieve messages');
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 310,
                    child: TextField(
                      controller: messageTextController,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        mes = value;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black,
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white //0x433600
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          hintText: "Type your message here..."),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _firestorecloud.collection('chat').add({
                          'text': mes,
                          'sender': loguser.email,
                          'time': FieldValue.serverTimestamp()
                        });
                        messageTextController.clear();
                      },
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class mbubble extends StatelessWidget {
  mbubble(
      {required this.ms,
        required this.mt,
        required this.isMe,
        required this.time});
  final String? mt;
  final String? ms;
  final bool isMe;
  final Timestamp? time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5.0,
            color: isMe?Colors.black:Colors.grey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    '$ms',
                    style:isMe?TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold):TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$mt ',
                    style: isMe?TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold):TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,),
                  ),
                  if (time != null)
                    Text(
                      '${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(time!.seconds * 1000))}',
                      style: isMe?TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold):TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold,),
    ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
