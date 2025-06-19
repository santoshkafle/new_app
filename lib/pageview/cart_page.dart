import 'package:flutter/material.dart';
import 'package:new_app/model/cart_details_data.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Page:"), centerTitle: true),
      body: ListView.builder(
        itemCount: cartdetails.length,
        itemBuilder: (context, index) {
          var _cartdetailsModel = cartdetails[index];
          return ListTile(
            title: Text(
              _cartdetailsModel.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSans",
              ),
            ),
            leading: Image.asset(
              _cartdetailsModel.imageUrl,
              width: 80,
              height: 80,
            ),
            subtitle: Text(
              "${_cartdetailsModel.quantity} ${_cartdetailsModel.fruitUnit} ... Total Rs. ${_cartdetailsModel.totalPrice}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  cartdetails.removeAt(index);
                });
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
