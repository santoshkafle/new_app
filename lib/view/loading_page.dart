import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_app/auth/services/local_Storages.dart';
import 'package:new_app/provider/form_provider.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingPage> {
  late Future<bool> isDataLoaded;

  @override
  void initState() {
    context.read<FormProvider>().initilizeUserModel();
    checkAuthSatusAndNavigate();
    super.initState();
  }

  void checkAuthSatusAndNavigate() async {
    final isLoggedIn = await LocalStorages.getUserLoggedStatus();

    if (isLoggedIn) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pushReplacementNamed(context, "/manNav");
      });
    } else {
      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pushReplacementNamed(context, "/login");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53B175),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            Image.asset(
              "assest/loadingscreen/splash_icon.png",
              height: 50,
              width: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 3,
              children: [
                Text(
                  "Grocey App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
