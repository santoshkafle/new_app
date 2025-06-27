import 'package:flutter/material.dart';
import 'package:new_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class DeleteAlertboxPage extends StatelessWidget {
  const DeleteAlertboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete Favorite", style: TextStyle(fontSize: 20)),
      content: Text(
        "Do you want to delte all favorite?",
        style: TextStyle(fontSize: 14),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            context.read<FavoriteProvider>().RemoveAllFavorite();
            Navigator.pop(context);
          },
          child: Text("Ok"),
        ),
      ],
    );
  }
}
