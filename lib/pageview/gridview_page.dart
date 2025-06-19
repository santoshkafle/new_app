import 'package:flutter/material.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/model/fruitpath.dart';
import 'package:new_app/pageview/fruit_details_page.dart';
import 'package:new_app/widgets/search_bar_widget.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({super.key});

  @override
  State<GridviewPage> createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  final fruitList = [
    Fruitmodel(
      name: 'Apple',
      price: 200,
      imageUrl: Fruitpath.appleUrl,
      rating: 4.5,
      fruitUnit: "kg",
      maxAvailable: 8,
      description:
          "This is a apple that keeps doctor away, Eat this now to become healthy, avaiable 8kg for now. This is a apple that keeps doctor away, Eat this now to become healthy, avaiable 8kg for now. ",
    ),
    Fruitmodel(
      name: 'Banana',
      price: 60,
      imageUrl: Fruitpath.bananaUrl,
      rating: 3.5,
      fruitUnit: "bunch",
      maxAvailable: 10,
      description:
          "This is a banana that even eat minions, so only 10 bunch of banana left order now.",
    ),
    Fruitmodel(
      name: 'Coconut',
      price: 70,
      imageUrl: Fruitpath.coconutUrl,
      rating: 3,
      fruitUnit: "piece",
      maxAvailable: 5,
      description:
          "This is a healty, delicious coconut, so only 5 piece of banana left order now. This is a healty, delicious coconut, so only 5 piece of banana left order now.",
    ),
    Fruitmodel(
      name: 'Watermelon',
      price: 300,
      imageUrl: Fruitpath.watermelonUrl,
      rating: 4,
      fruitUnit: "piece",
      maxAvailable: 10,
      description:
          "This is swite, delicious to eat, healty watermelon 10 piece of banana left order now.",
    ),
    Fruitmodel(
      name: 'Strawberry',
      price: 500,
      imageUrl: Fruitpath.strawberryUrl,
      rating: 4.5,
      fruitUnit: "kg",
      maxAvailable: 20,
      description:
          "This is a Strawberry that hard to find here, but order now to to get easily.",
    ),
    Fruitmodel(
      name: 'Grapes',
      price: 80,
      imageUrl: Fruitpath.grapesUrl,
      rating: 5,
      fruitUnit: "bunch",
      maxAvailable: 10,
      description:
          "Grapes is delicious, healty fruit available 10 bunch right now. Grapes is delicious, healty fruit available 10 bunch right now. Grapes is delicious, healty fruit available 10 bunch right now.",
    ),
    Fruitmodel(
      name: 'Avocardo',
      price: 1000,
      imageUrl: Fruitpath.avocardoUrl,
      rating: 1.5,
      fruitUnit: "kg",
      maxAvailable: 30,
      description:
          "This is a Avocardo, availabel 30 kg in stock. This is a Avocardo, availabel 30 kg in stock.",
    ),
    Fruitmodel(
      name: 'Mango',
      price: 170,
      imageUrl: Fruitpath.mangoUrl,
      rating: 2.5,
      fruitUnit: "kg",
      maxAvailable: 40,
      description:
          "This is a seasion of mango, sweat and delicious to eat if you are not falling in sleep then order now.",
    ),
    Fruitmodel(
      name: 'Lichi',
      price: 250,
      imageUrl: Fruitpath.lichiUrl,
      rating: 2,
      fruitUnit: "bunch",
      maxAvailable: 2,
      description:
          "Lichi have one leayers that cover fruit and fruit is in second leayers.",
    ),
  ];
  List<Fruitmodel> filteredList = [];

  @override
  void initState() {
    super.initState();

    filteredList = fruitList;
  }

  void searchFruit(String searchIteam) {
    if (searchIteam == "") {
      setState(() {
        filteredList = fruitList;
      });
    } else {
      setState(() {
        filteredList =
            fruitList
                .where(
                  (e) =>
                      e.name.toLowerCase().contains(
                        searchIteam.toLowerCase(),
                      ) ||
                      e.price.toString().contains(searchIteam),
                )
                .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Fruit List:"))),
      body: Column(
        children: [
          //serch bar...
          Padding(
            padding: const EdgeInsets.all(15),
            child: SearchBarWidget(
              onSearch: (String searchQueary) {
                searchFruit(searchQueary);
              },
            ),
          ),
          //food iteams
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
              ),
              itemCount: filteredList.length,
              padding: EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                FruitDetailsPage(fruit: filteredList[index]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          filteredList[index].imageUrl,
                          height: 50,
                          width: 50,
                        ),
                        Text(filteredList[index].name),
                        Text("Rs: ${filteredList[index].price}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
