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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartdetails.length,
              itemBuilder: (context, index) {
                var _cartdetailsModel = cartdetails[index];
                return Padding(
                  padding: EdgeInsets.all(7),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: ListTile(
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
                        fit: BoxFit.cover,
                      ),
                      subtitle: Row(
                        spacing: 4,
                        children: [
                          Text(
                            "${_cartdetailsModel.quantity} ${_cartdetailsModel.fruitUnit}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cartdetails.removeAt(index);
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 12,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                        "Rs. ${_cartdetailsModel.totalPrice}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: Text(
                    "Total Amt: \n ${totalPriceForAllFruit}",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                        ),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      "Checkout",
                      style: (TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
