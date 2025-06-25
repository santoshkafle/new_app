import 'package:flutter/material.dart';
import 'package:new_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Favorite Items"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<FavoriteProvider>().RemoveAllFavorite();
            },
            icon: Icon(Icons.delete_sweep_outlined),
          ),
        ],
      ),
      body:
          context.read<FavoriteProvider>().favoriteItem.isNotEmpty
              ? ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount:
                    context.watch<FavoriteProvider>().favoriteItem.length,
                itemBuilder: (context, index) {
                  final foodItem =
                      context.watch<FavoriteProvider>().favoriteItem[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 100,
                    child: ListTile(
                      title: Text(
                        foodItem.item.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed:
                            () => context
                                .read<FavoriteProvider>()
                                .removeFavoriteItem(index),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              )
              : Center(child: Text("Favroite Item Empty!")),
    );
  }
}
