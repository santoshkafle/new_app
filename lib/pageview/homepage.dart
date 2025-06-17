import 'package:flutter/material.dart';
import 'package:new_app/CustomWidget/customwidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("HomePage!"))),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 60, child: Icon(Icons.person, size: 80)),
              Text(
                "CodingLab",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "YouTuber & Blogger",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              //media links here....
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  // facebook logo...
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: Image.asset(
                      "assest/facebook-circle-logo.png",
                      color: Colors.white,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  // insta logo...
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.pinkAccent,
                    child: Image.asset(
                      "assest/instgramlogo.png",
                      color: Colors.white,
                      width: 26,
                      height: 26,
                    ),
                  ),
                  // twitter logo...
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Image.asset(
                      "assest/twittericon.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // yt logo...
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red[300],
                    child: Image.asset(
                      "assest/yticon.png",
                      fit: BoxFit.cover,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
              //buttons here.....
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Subscribe",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Message",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
              //like & share section here....
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //first child... of like & share section...
                  Row(
                    children: [
                      Icon(Icons.heart_broken_outlined),
                      Text("60.4k", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 16, child: VerticalDivider(width: 18)),
                  Row(
                    children: [
                      Icon(Icons.message_outlined),
                      Text("20k", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 16, child: VerticalDivider(width: 18)),
                  Row(
                    children: [
                      Icon(Icons.share_outlined),
                      Text("12.4k", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
