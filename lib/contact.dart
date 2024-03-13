import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  static String p = 'contact';

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  // Method to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Custom button style
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.black,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Social Media Buttons
            ElevatedButton.icon(
              style: buttonStyle,
              icon: Icon(Icons.camera_alt_outlined),
              label: Text('Instagram'),
              onPressed: () => _launchURL('https://www.instagram.com/bureauaffix/'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              style: buttonStyle,
              icon: Icon(Icons.chat_bubble_outline),
              label: Text('Twitter'),
              onPressed: () => _launchURL('https://twitter.com/BureauAffix'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              style: buttonStyle,
              icon: Icon(Icons.facebook),
              label: Text('Facebook'),
              onPressed: () => _launchURL('https://www.facebook.com/yourusername'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              style: buttonStyle,
              icon: Icon(Icons.video_library_outlined),
              label: Text('YouTube'),
              onPressed: () => _launchURL('https://www.youtube.com/@bureauaffix/featured'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              style: buttonStyle,
              icon: Icon(Icons.email_outlined),
              label: Text('Email'),
              onPressed: () => _launchURL('mailto:your.bureauaffix22@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }
}

