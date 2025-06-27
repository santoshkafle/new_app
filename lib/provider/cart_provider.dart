import 'package:flutter/material.dart';
import 'package:new_app/model/cartdetails_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartdetailsModel> _cartDetailsModel = [];

  List<CartdetailsModel> get cartDetailsModel => _cartDetailsModel;

  void addCartItems(CartdetailsModel cartItem) {
    _cartDetailsModel.add(cartItem);

    notifyListeners();

    // bool isFruitExist = false;

    //   for (var e in cartdetails) {
    //     if (e.name == widget.fruit.name) {
    //       //this fruit is exist... just update.....
    //       e.quantity += fruitQuantity;
    //       e.totalPrice += fruitQuantity * widget.fruit.price;

    //       isFruitExist = true;
    //     }
    //   }
    //   //fruit not in cart...
    //   if (!isFruitExist) {
    //     cartdetails.add(
    //       CartdetailsModel(
    //         name: widget.fruit.name,
    //         imageUrl: widget.fruit.imageUrl,
    //         totalPrice: fruitQuantity * widget.fruit.price,
    //         quantity: fruitQuantity,
    //         fruitUnit: widget.fruit.fruitUnit,
    //       ),
    //     );
    //   }
  }

  void removeCartItems(_index) {
    _cartDetailsModel.removeAt(_index);

    notifyListeners();
  }
}
