import 'package:flutter/material.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/model/fruitpath.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({super.key});

  @override
  State<GridviewPage> createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  final fruitList = [
    Fruitmodel(name: 'Apple', price: '200', imageUrl: Fruitpath.appleUrl),
    Fruitmodel(name: 'Banana', price: '60', imageUrl: Fruitpath.bananaUrl),
    Fruitmodel(name: 'Coconut', price: '70', imageUrl: Fruitpath.coconutUrl),
    Fruitmodel(
      name: 'Watermelon',
      price: '300',
      imageUrl: Fruitpath.watermelonUrl,
    ),
    Fruitmodel(
      name: 'Strawberry',
      price: '500',
      imageUrl: Fruitpath.strawberryUrl,
    ),
    Fruitmodel(name: 'Grapes', price: '80', imageUrl: Fruitpath.grapesUrl),
    Fruitmodel(
      name: 'Avocardo',
      price: '1000',
      imageUrl: Fruitpath.avocardoUrl,
    ),
    Fruitmodel(name: 'Mango', price: '170', imageUrl: Fruitpath.mangoUrl),
    Fruitmodel(name: 'Lichi', price: '250', imageUrl: Fruitpath.lichiUrl),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Fruit List:"))),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
        ),
        itemCount: fruitList.length,
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(fruitList[index].imageUrl, height: 50, width: 50),
                Text(fruitList[index].name),
                Text("Rs: ${fruitList[index].price}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
