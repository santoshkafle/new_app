import 'package:flutter/material.dart';
import 'package:new_app/auth/services/local_storages.dart';

class LogoutAlertbox extends StatelessWidget {
  const LogoutAlertbox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Are you sure about this one?",
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            LocalStorages.setUserLoggedOut();
            Navigator.pop(context);
            Navigator.pushNamed(context, '/loadingScreen');
          },
          child: Text("Yes"),
        ),
      ],
    );
  }
}
