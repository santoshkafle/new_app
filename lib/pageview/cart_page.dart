import 'package:flutter/material.dart';
import 'package:new_app/provider/cart_provider.dart';
import 'package:new_app/view/favorite_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page:"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<CartProvider>(
            builder: (cProCtx, _, __) {
              return Expanded(
                child: ListView.builder(
                  itemCount:
                      cProCtx.watch<CartProvider>().cartDetailsModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(7),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: ListTile(
                          title: Text(
                            cProCtx
                                .watch<CartProvider>()
                                .cartDetailsModel[index]
                                .name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSans",
                            ),
                          ),
                          leading: Image.asset(
                            cProCtx
                                .watch<CartProvider>()
                                .cartDetailsModel[index]
                                .imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          subtitle: Row(
                            spacing: 4,
                            children: [
                              Text(
                                cProCtx
                                        .watch<CartProvider>()
                                        .cartDetailsModel[index]
                                        .quantity
                                        .toString() +
                                    cProCtx
                                        .watch<CartProvider>()
                                        .cartDetailsModel[index]
                                        .fruitUnit
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cProCtx
                                        .read<CartProvider>()
                                        .removeCartItems(index);
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
                            "Rs. ${cProCtx.watch<CartProvider>().cartDetailsModel[index].totalPrice}",
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
              );
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: Text(
                    "Total Amt: \n {totalPriceForAllFruit}",
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
