import 'package:bureauaffix/about.dart';
import 'package:bureauaffix/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bureauaffix/member.dart';
import 'package:bureauaffix/contact.dart';
import 'package:bureauaffix/registration.dart';
import 'package:bureauaffix/research.dart';
import 'package:bureauaffix/blog.dart';
import 'package:bureauaffix/chat.dart';

final List<String> imgList = [
  'images/video.gif',
  'images/Video1.gif',
  'images/Video2.gif',
];

class Home extends StatefulWidget {
  static String h = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size scr=MediaQuery.of(context).size;
    double scrheight=scr.height;
    double scrwidth=scr.width;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: Expanded(
                child: Row(
                  children: [
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert,color: Colors.white,),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('About'),
                          value: 1,
                          onTap: () {Navigator.pushNamed(context,About.a );
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Contact'),
                          value: 2,
                          onTap: () {Navigator.pushNamed(context, Contact.p);},
                        ),
                      ],
                      onSelected: (value) {
                        // do something with the selected value
                      },
                    ),
                    SizedBox(
                      width: scrwidth*0.10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/icon.png'),
                    ),
                    Text('Bureau Affix',
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white)),
                    SizedBox(
                      width: scrwidth*0.10,
                    ),
                    Icon(Icons.search,color: Colors.white,),
                    SizedBox(
                      width: scrwidth*0.0,
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.account_circle,color: Colors.white,),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(' login'),
                          value: 1,
                          onTap: () {Navigator.pushNamed(context, Login.l);
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Registration'),
                          value: 2,
                          onTap: () {Navigator.pushNamed(context, Registeration.r);
                          },
                        ),
                      ],
                      onSelected: (value) {
                        // do something with the selected value
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                  child: Image.asset(item,
                                      fit: BoxFit.cover, width: scrwidth*1.0,)),
                            ))
                        .toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll(Size(150, 150))),
                        onPressed: () {Navigator.pushNamed(context, Member.m);},
                        child: Image(
                          image: AssetImage('images/a.png'),
                        )),
                    TextButton(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll(Size(150, 150))),
                        onPressed: () {Navigator.pushNamed(context, Research.re);},
                        child: Image(
                          image: AssetImage('images/b.png'),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(style: ButtonStyle(
                        fixedSize:
                        MaterialStatePropertyAll(Size(150, 150))),
                      onPressed: () {Navigator.pushNamed(context, Blog.b);},
                      child:Image(
                        image: AssetImage('images/c.png'),
                      )
                    ),
                    TextButton(style: ButtonStyle(
                        fixedSize:
                        MaterialStatePropertyAll(Size(150, 150))),
                      onPressed: () {Navigator.pushNamed(context, chat.c);},
                      child: Image(
                        image: AssetImage('images/d.png'),
                      )
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
