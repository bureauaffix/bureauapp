import 'package:bureauaffix/home.dart';
import 'package:bureauaffix/research.dart';
import 'package:flutter/material.dart';
import 'package:bureauaffix/registration.dart';
import 'package:bureauaffix/member.dart';
import 'package:bureauaffix/blog.dart';
import 'package:bureauaffix/chat.dart';
import 'package:bureauaffix/login.dart';
import 'package:bureauaffix/about.dart';
import 'package:bureauaffix/contact.dart';
import 'front.dart';
import 'package:firebase_core/firebase_core.dart';


Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase app
  runApp(MaterialApp(debugShowCheckedModeBanner: false,initialRoute: Front.f,routes: {
    Home.h:(context)=>Home(),
    Registeration.r:(context)=>Registeration(),
    Member.m:(context)=>Member(),
    Blog.b:(context)=>Blog(),
    chat.c:(context)=>chat(),
    Login.l:(context)=>Login(),
    About.a:(context)=>About(),
    Contact.p:(context)=>Contact(),
    Research.re:(context)=>Research(),
    Front.f : (context)=>Front(),

  },
  ));
}

