import 'package:flutter/material.dart';

class Medialink extends StatelessWidget {
  const Medialink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        // facebook logo...
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue,
          child: Image.asset(
            "assest/media/facebook-circle-logo.png",
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
            "assest/media/instgramlogo.png",
            color: Colors.white,
            width: 26,
            height: 26,
          ),
        ),
        // twitter logo...
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.black,
          child: Image.asset("assest/media/twittericon.png", fit: BoxFit.cover),
        ),
        // yt logo...
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.red[300],
          child: Image.asset(
            "assest/media/yticon.png",
            fit: BoxFit.cover,
            width: 32,
            height: 32,
          ),
        ),
      ],
    );
  }
}
