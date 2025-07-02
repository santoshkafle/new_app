import 'package:flutter/material.dart';
import 'package:new_app/provider/grocery_list_provider.dart';
import 'package:new_app/provider/navigation_provider.dart';
import 'package:new_app/utils/fruit_list.dart';
import 'package:new_app/utils/vegatable_list.dart';
import 'package:new_app/view/grocery_details_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Widget bannerView() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xffd6eedb),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh Fruits',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Upto',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '%',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Discount',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              'assest/banner/banner_fruits.jpeg',
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget vegatableListHeader(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Fresh Vegatable",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  ctx.read<GroceryListProvider>().swithGroceryListState(
                    GroceryListState.vegatalbe,
                  );
                  ctx.read<NavigationProvider>().setCurrentIndex(1);
                  ctx.read<NavigationProvider>().setCurrentGroceryTabIndex(1);
                },
                child: Text("See All"),
              ),
              Icon(Icons.keyboard_arrow_right_outlined),
            ],
          ),
        ),
      ],
    );
  }

  Widget fruitListHeader(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Fresh Fruit",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  ctx.read<GroceryListProvider>().swithGroceryListState(
                    GroceryListState.fruit,
                  );
                  ctx.read<NavigationProvider>().setCurrentIndex(1);
                  ctx.read<NavigationProvider>().setCurrentGroceryTabIndex(0);
                },
                child: Text("See All"),
              ),
              Icon(Icons.keyboard_arrow_right_outlined),
            ],
          ),
        ),
      ],
    );
  }

  Widget fruitList() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: FruitList.fruitList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.only(right: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffd5f8fc),
            ),
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                context.read<GroceryListProvider>().swithGroceryListState(
                  GroceryListState.fruit,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => GroceryDetailsPage(
                          fruit: FruitList.fruitList[index],
                        ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    FruitList.fruitList[index].imageUrl,
                    height: 50,
                    width: 50,
                  ),
                  Text(FruitList.fruitList[index].name),
                  Text("Rs: ${FruitList.fruitList[index].price}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget vegatableList() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: VegatableList.vegatableList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.only(right: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xfff8e6ff),
            ),
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                context.read<GroceryListProvider>().swithGroceryListState(
                  GroceryListState.vegatalbe,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => GroceryDetailsPage(
                          vegatable: VegatableList.vegatableList[index],
                        ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    VegatableList.vegatableList[index].imageUrl,
                    height: 50,
                    width: 50,
                  ),
                  Text(VegatableList.vegatableList[index].name),
                  Text("Rs: ${VegatableList.vegatableList[index].price}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eGrocery", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 12,
          children: [
            bannerView(),
            fruitListHeader(context),
            fruitList(),
            vegatableListHeader(context),
            vegatableList(),
          ],
        ),
      ),
    );
  }
}
