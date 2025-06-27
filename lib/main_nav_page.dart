import 'package:flutter/material.dart';
import 'package:new_app/pageview/cart_page.dart';
import 'package:new_app/pageview/gridview_page.dart';
import 'package:new_app/pageview/homepage.dart';
import 'package:new_app/pageview/profile_page.dart';
import 'package:new_app/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  final page = [Homepage(), GridviewPage(), CartPage(), ProfilePage()];

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
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    final _index = context.watch<NavigationProvider>();
    return Scaffold(
      body: page[_index.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bootomNavIteam,
        currentIndex: _index.currentIndex,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[400],
        onTap: context.read<NavigationProvider>().setCurrentIndex,
      ),
    );
  }
}
