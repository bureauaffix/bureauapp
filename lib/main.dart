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


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,initialRoute: Home.h,routes: {
    Home.h:(context)=>Home(),
    Registeration.r:(context)=>Registeration(),
    Member.m:(context)=>Member(),
    Blog.b:(context)=>Blog(),
    Chat.c:(context)=>Chat(),
    Login.l:(context)=>Login(),
    About.a:(context)=>About(),
    Contact.p:(context)=>Contact(),
    Research.re:(context)=>Research(),


  },
    home: Home(),
  ));
}

