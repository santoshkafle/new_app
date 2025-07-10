import 'package:flutter/material.dart';
import 'package:new_app/auth/pages/loginpage.dart';
import 'package:new_app/auth/pages/registerpage.dart';
import 'package:new_app/main_nav_page.dart';
import 'package:new_app/provider/cart_provider.dart';
import 'package:new_app/provider/favorite_provider.dart';
import 'package:new_app/provider/form_provider.dart';
import 'package:new_app/provider/grocery_list_provider.dart';
import 'package:new_app/provider/navigation_provider.dart';
import 'package:new_app/view/loading_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await initEnv();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => GroceryListProvider()),
        ChangeNotifierProvider(create: (_) => FormProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
//hello

Future<void> initEnv() async {
  await dotenv.load(fileName: ".env");
}

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
      initialRoute: "/loadingScreen",
      routes: {
        "/loadingScreen": (context) => LoadingPage(),
        "/login": (context) => Loginpage(),
        "/register": (context) => Registerpage(),
        "/manNav": (context) => MainNavPage(),
      },
    );
  }
}
