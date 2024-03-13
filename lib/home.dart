import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Expanded(
                child: Row(
                  children: [
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('About'),
                          value: 1,
                          onTap: () {
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Contact'),
                          value: 2,
                          onTap: () {},
                        ),
                      ],
                      onSelected: (value) {
                        // do something with the selected value
                      },
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Image.asset('images/icon.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Bureau Affix',
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white)),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.account_circle),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(' login'),
                          value: 1,
                          onTap: () {
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Registration'),
                          value: 2,
                          onTap: () {
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
                                      fit: BoxFit.cover, width: 1000,)),
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
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('images/a.png'),
                        )),
                    TextButton(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll(Size(150, 150))),
                        onPressed: () {},
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
                      onPressed: () {},
                      child:Image(
                        image: AssetImage('images/c.png'),
                      )
                    ),
                    TextButton(style: ButtonStyle(
                        fixedSize:
                        MaterialStatePropertyAll(Size(150, 150))),
                      onPressed: () {},
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
