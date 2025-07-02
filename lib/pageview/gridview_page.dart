import 'package:flutter/material.dart';
import 'package:new_app/provider/grocery_list_provider.dart';
import 'package:new_app/provider/navigation_provider.dart';
import 'package:new_app/view/grocery_details_page.dart';
import 'package:new_app/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({super.key});

  @override
  State<GridviewPage> createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  @override
  void initState() {
    super.initState();

    context.read<GroceryListProvider>().InitilizeGroceryList();
  }

  Widget fruitListView() {
    return Column(
      children: [
        //serch bar...
        Padding(
          padding: const EdgeInsets.all(15),
          child: SearchBarWidget(
            onSearch: (String searchQueary) {
              context.read<GroceryListProvider>().searchGroceryItem(
                searchQueary,
              );
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
            itemCount:
                context.watch<GroceryListProvider>().filteredFruitList.length,
            padding: EdgeInsets.all(20),
            itemBuilder: (context, index) {
              //variable for easy to do.....
              final _groceryProvider = context.watch<GroceryListProvider>();
              final _groceryReadProvider = context.read<GroceryListProvider>();
              return InkWell(
                onTap: () {
                  context.read<GroceryListProvider>().swithGroceryListState(
                    GroceryListState.fruit,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => GroceryDetailsPage(
                            fruit: _groceryProvider.filteredFruitList[index],
                          ),
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
                        _groceryProvider.filteredFruitList[index].imageUrl,
                        height: 50,
                        width: 50,
                      ),
                      Text(_groceryProvider.filteredFruitList[index].name),
                      Text(
                        "Rs: ${_groceryProvider.filteredFruitList[index].price}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget vegatableListView() {
    return Column(
      children: [
        //serch bar...
        Padding(
          padding: const EdgeInsets.all(15),
          child: SearchBarWidget(
            onSearch: (String searchQueary) {
              context.read<GroceryListProvider>().searchGroceryItem(
                searchQueary,
              );
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
            itemCount:
                context
                    .watch<GroceryListProvider>()
                    .filteredVegatableList
                    .length,
            padding: EdgeInsets.all(20),
            itemBuilder: (context, index) {
              //variable for easy to do.....
              final _groceryProvider = context.watch<GroceryListProvider>();
              final _groceryReadProvider = context.read<GroceryListProvider>();
              return InkWell(
                onTap: () {
                  context.read<GroceryListProvider>().swithGroceryListState(
                    GroceryListState.vegatalbe,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => GroceryDetailsPage(
                            vegatable:
                                _groceryProvider.filteredVegatableList[index],
                          ),
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
                        _groceryProvider.filteredVegatableList[index].imageUrl,
                        height: 50,
                        width: 50,
                      ),
                      Text(_groceryProvider.filteredVegatableList[index].name),
                      Text(
                        "Rs: ${_groceryProvider.filteredVegatableList[index].price}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: context.watch<NavigationProvider>().currentGroceryTabIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              InkWell(
                onTap: () {
                  context.read<GroceryListProvider>().swithGroceryListState(
                    GroceryListState.fruit,
                  );
                  context.read<NavigationProvider>().setCurrentGroceryTabIndex(
                    0,
                  );
                },
                child: Tab(
                  text: "Fruits",
                  icon: Icon(Icons.local_grocery_store_outlined),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<GroceryListProvider>().swithGroceryListState(
                    GroceryListState.vegatalbe,
                  );
                  context.read<NavigationProvider>().setCurrentGroceryTabIndex(
                    1,
                  );
                },
                child: Tab(text: "Vegatable", icon: Icon(Icons.eco_outlined)),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [fruitListView(), vegatableListView()]),
      ),
    );
  }
}
