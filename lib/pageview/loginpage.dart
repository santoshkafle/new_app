import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login Screen",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "Email:",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Password:",
                border: OutlineInputBorder(),
              ),
            ),

            ElevatedButton(onPressed: () {}, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
