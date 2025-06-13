import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Register Page"))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Creat Account",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "Email:",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Password:",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            SizedBox(
              width: 180,
              height: 50,
              child: ElevatedButton(onPressed: () {}, child: Text("Register")),
            ),
          ],
        ),
      ),
    );
  }
}
