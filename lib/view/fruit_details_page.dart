import 'package:flutter/material.dart';
import 'package:new_app/model/vegatable_model.dart';
import 'package:new_app/provider/cart_provider.dart';
import 'package:new_app/model/cartdetails_model.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/provider/grocery_list_provider.dart';
import 'package:new_app/view/child_fruit_details_page.dart';
import 'package:new_app/view/child_vegatable_details_page.dart';
import 'package:provider/provider.dart';

class FruitDetailsPage extends StatefulWidget {
  final Fruitmodel? fruit;
  final VegatableModel? vegatable;
  const FruitDetailsPage({this.fruit, this.vegatable});

  @override
  State<FruitDetailsPage> createState() => _FruitDetailsPageState();
}

class _FruitDetailsPageState extends State<FruitDetailsPage> {
  int fruitQuantity = 1;
  bool isFavroite = false;

  void IncreaseQuantity() {
    if (widget.fruit != null) {
      if (fruitQuantity < widget.fruit!.maxAvailable) {
        setState(() {
          fruitQuantity++;
        });
      }
    } else {
      if (fruitQuantity < widget.vegatable!.maxAvailable) {
        setState(() {
          fruitQuantity++;
        });
      }
    }
  }

  void DecreaseQuantity() {
    if (fruitQuantity > 0) {
      setState(() {
        fruitQuantity--;
      });
    }
  }

  void AddToCart() {
    if ((widget.fruit != null && widget.vegatable != null) ||
        (widget.fruit == null && widget.vegatable == null))
      return;
    setState(() {
      if (widget.fruit != null) {
        context.read<CartProvider>().addCartItems(
          CartdetailsModel(
            fruitUnit: widget.fruit!.fruitUnit,
            name: widget.fruit!.name,
            imageUrl: widget.fruit!.imageUrl,
            totalPrice: widget.fruit!.price,
            quantity: fruitQuantity,
          ),
        );
      } else {
        context.read<CartProvider>().addCartItems(
          CartdetailsModel(
            fruitUnit: widget.vegatable!.vegUnit,
            name: widget.vegatable!.name,
            imageUrl: widget.vegatable!.imageUrl,
            totalPrice: widget.vegatable!.price,
            quantity: fruitQuantity,
          ),
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Iteams Add, View Cart for more Details"),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 1000),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Fruit Details"))),
      backgroundColor: Colors.grey[200],
      body:
          (context.read<GroceryListProvider>().groceryListState ==
                  GroceryListState.fruit)
              ? ChildFruitDetailsPage(
                fruitmodel: widget.fruit!,
                fruitQuinty: fruitQuantity,
                decreaseCallback: () => DecreaseQuantity(),
                incraseCallback: () => IncreaseQuantity(),
                addToCardCallback: () => AddToCart(),
              )
              : ChildVegatableDetailsPage(
                vegatableModel: widget.vegatable!,
                fruitQuinty: fruitQuantity,
                decreaseCallback: () => DecreaseQuantity(),
                incraseCallback: () => IncreaseQuantity(),
                addToCardCallback: () => AddToCart(),
              ),
    );
  }
}
