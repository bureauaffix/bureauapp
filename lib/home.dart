import 'package:flutter/material.dart';
import 'package:bureauaffix/registration.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gif/flutter_gif.dart';


final List<String> imgList = [
  'images/video.gif',
  'images/video 1.gif',
  'images/video 2.gif',
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
      appBar: AppBar(
        title: Text('Bureau Affix'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: imgList
                    .map((item) => Container(
                  child: Center(
                    child: item.endsWith('.gif')
                        ? GifImage(  // Use GifImage from the correct package
                      image: AssetImage(item),
                    )
                        : Image.asset(item, fit: BoxFit.cover, width: 1000),
                  ),
                ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Registeration.r);
                },
                child: Text('Registration'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
