import 'package:bureauaffix/home.dart';
import 'package:flutter/material.dart';
import 'package:bureauaffix/registration.dart';
import 'package:bureauaffix/member.dart';
import 'package:bureauaffix/blog.dart';
import 'package:bureauaffix/chat.dart';

void main() {
  runApp(MaterialApp(initialRoute: Home.h,routes: {
    Home.h:(context)=>Home(),
    Registeration.r:(context)=>Registeration(),
    Member.m:(context)=>Member(),
    Blog.b:(context)=>Blog(),
    Chat.c:(context)=>Chat(),

  },
    home: Home(),
  ));
}

