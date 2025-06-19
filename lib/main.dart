import 'package:flutter/material.dart';
import 'package:new_app/main_nav_page.dart';
import 'package:new_app/pageview/gridview_page.dart';
import 'package:new_app/pageview/homepage.dart';
import 'package:new_app/pageview/loginpage.dart';
import 'package:new_app/pageview/registerpage.dart';

void main() {
  runApp(const MyApp());
}
//hello

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainNavPage(),
    );
  }
}
