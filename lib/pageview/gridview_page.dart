import 'package:flutter/material.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/utils/fruit_list.dart';
import 'package:new_app/view/fruit_details_page.dart';
import 'package:new_app/widgets/search_bar_widget.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({super.key});

  @override
  State<GridviewPage> createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  List<Fruitmodel> filteredList = [];

  @override
  void initState() {
    super.initState();

    filteredList = FruitList.fruitList;
  }

  void searchFruit(String searchIteam) {
    if (searchIteam == "") {
      setState(() {
        filteredList = FruitList.fruitList;
      });
    } else {
      setState(() {
        filteredList =
            FruitList.fruitList
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
