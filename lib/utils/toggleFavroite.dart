import 'package:flutter/material.dart';
import 'package:new_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class Togglefavroite {
  void toggleFavroite(BuildContext context, String name) {
    if (!context.read<FavoriteProvider>().IsFavorite(name)) {
      context.read<FavoriteProvider>().addFavoriteItem(name);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item added to favourites'),
          backgroundColor: Colors.blue,
          duration: Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      context.read<FavoriteProvider>().removeFavoriteFromLast();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item removed from favourites'),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 1000),

          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
