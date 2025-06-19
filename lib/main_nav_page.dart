import 'package:flutter/material.dart';
import 'package:new_app/pageview/cart_page.dart';
import 'package:new_app/pageview/gridview_page.dart';
import 'package:new_app/pageview/homepage.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int currentPage = 0;

  final page = [Homepage(), GridviewPage(), CartPage()];

  final bootomNavIteam = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store_outlined),
      label: "Groceries",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: "Cart Page",
    ),
  ];

  triggerPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: bootomNavIteam,
        currentIndex: currentPage,
        onTap: triggerPage,
      ),
    );
  }
}
