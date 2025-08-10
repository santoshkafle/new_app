import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_app/model/vegatable_model.dart';
import 'package:new_app/provider/favorite_provider.dart';
import 'package:new_app/utils/toggleFavroite.dart';
import 'package:new_app/widgets/white_button.dart';
import 'package:provider/provider.dart';

class ChildVegatableDetailsPage extends StatelessWidget {
  VegatableModel vegatableModel;
  int vegQuinty;
  VoidCallback decreaseCallback;
  VoidCallback incraseCallback;
  VoidCallback addToCardCallback;
  ChildVegatableDetailsPage({
    super.key,
    required this.vegatableModel,
    required this.vegQuinty,
    required this.decreaseCallback,
    required this.incraseCallback,
    required this.addToCardCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //this is image, fruit details column, with scrollable....
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  vegatableModel.imageUrl,
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
                            "Rs. ${vegatableModel.price} /Kg",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed:
                                () => Togglefavroite().toggleFavroite(
                                  context,
                                  vegatableModel.name,
                                ),
                            icon:
                                context.watch<FavoriteProvider>().IsFavorite(
                                      vegatableModel.name,
                                    )
                                    ? Icon(
                                      Icons.favorite,
                                      size: 26,
                                      color: Colors.green,
                                    )
                                    : Icon(
                                      Icons.favorite_outline,
                                      size: 26,
                                      color: Colors.green,
                                    ),
                          ),
                        ],
                      ),

                      Text(
                        vegatableModel.name,
                        style: TextStyle(
                          fontFamily: "NotoSans",
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            "4",
                            // vegatableModel.rating.toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          RatingBarIndicator(
                            rating: 4,
                            itemCount: 5,
                            itemSize: 30,
                            itemBuilder:
                                (context, _) =>
                                    Icon(Icons.star, color: Colors.amber),
                          ),
                          Text(
                            '(89 Reviews)',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ],
                      ),
                      Text(
                        "describestion is not yet ready, check back later,",
                        style: TextStyle(fontSize: 20, color: Colors.grey[400]),
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
                      buttonText: "Quantity (Kg)",
                      textStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      isSmall: false,
                    ),
                  ),
                  InkWell(
                    onTap: () => decreaseCallback(), //decreasecallback....
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
                    buttonText: vegQuinty.toString(),
                    textStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => incraseCallback(),
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
                    addToCardCallback();
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
    );
  }
}
