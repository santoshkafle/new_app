import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_app/model/cart_details_data.dart';
import 'package:new_app/model/cartdetails_model.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/widgets/white_button.dart';

class FruitDetailsPage extends StatefulWidget {
  final Fruitmodel fruit;
  FruitDetailsPage({super.key, required this.fruit});

  @override
  State<FruitDetailsPage> createState() => _FruitDetailsPageState();
}

class _FruitDetailsPageState extends State<FruitDetailsPage> {
  int fruitQuantity = 1;
  bool isFavroite = false;

  void IncreaseQuantity() {
    if (fruitQuantity < widget.fruit.maxAvailable) {
      setState(() {
        fruitQuantity++;
      });
    }
  }

  void DecreaseQuantity() {
    if (fruitQuantity > 0) {
      setState(() {
        fruitQuantity--;
      });
    }
  }

  void ToggleFavroite() {
    setState(() {
      isFavroite = !isFavroite;
      if (isFavroite) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item added to favourites'),
            backgroundColor: Colors.blue,
            duration: Duration(milliseconds: 1000),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item removed from favourites'),
            backgroundColor: Colors.red,
            duration: Duration(milliseconds: 1000),

            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  void AddToCart() {
    setState(() {
      bool isFruitExist = false;

      for (var e in cartdetails) {
        if (e.name == widget.fruit.name) {
          //this fruit is exist... just update.....
          e.quantity += fruitQuantity;
          e.totalPrice += fruitQuantity * widget.fruit.price;

          isFruitExist = true;
        }
      }
      //fruit not in cart...
      if (!isFruitExist) {
        cartdetails.add(
          CartdetailsModel(
            name: widget.fruit.name,
            imageUrl: widget.fruit.imageUrl,
            totalPrice: fruitQuantity * widget.fruit.price,
            quantity: fruitQuantity,
            fruitUnit: widget.fruit.fruitUnit,
          ),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fruit Add, View Cart for more Details"),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //this is image, fruit details column, with scrollable....
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Image.asset(
                    widget.fruit.imageUrl,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs. ${widget.fruit.price} /${widget.fruit.fruitUnit}",
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () => ToggleFavroite(),
                              icon:
                                  isFavroite
                                      ? Icon(
                                        Icons.favorite,
                                        size: 26,
                                        color: Colors.red,
                                      )
                                      : Icon(
                                        Icons.favorite_outline,
                                        size: 26,
                                        color: Colors.red,
                                      ),
                            ),
                          ],
                        ),

                        Text(
                          widget.fruit.name,
                          style: TextStyle(
                            fontFamily: "NotoSans",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Row(
                          children: [
                            Text(
                              widget.fruit.rating.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            RatingBarIndicator(
                              rating: widget.fruit.rating,
                              itemCount: 5,
                              itemSize: 30,
                              itemBuilder:
                                  (context, _) =>
                                      Icon(Icons.star, color: Colors.amber),
                            ),
                            Text(
                              '(89 Reviews)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.fruit.description,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 5,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: WhiteButton(
                        buttonText: "Quantity (${widget.fruit.fruitUnit})",
                        textStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        isSmall: false,
                      ),
                    ),
                    InkWell(
                      onTap: () => DecreaseQuantity(),
                      child: WhiteButton(
                        buttonText: "-",
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    WhiteButton(
                      buttonText: fruitQuantity.toString(),
                      textStyle: TextStyle(
                        color:
                            (fruitQuantity == widget.fruit.maxAvailable)
                                ? Colors.red
                                : Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () => IncreaseQuantity(),
                      child: WhiteButton(
                        buttonText: "+",
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      AddToCart();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Add To Cart",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(Icons.shop, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
