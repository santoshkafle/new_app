import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/model/vegatable_model.dart';
import 'package:new_app/utils/fruit_list.dart';
import 'package:new_app/utils/vegatable_list.dart';

class GroceryListProvider with ChangeNotifier {
  List<Fruitmodel> _filteredFruitList = [];
  List<VegatableModel> _filteredVegatableList = [];
  GroceryListState _groceryListState = GroceryListState.fruit;

  List<Fruitmodel> get filteredFruitList => _filteredFruitList;
  List<VegatableModel> get filteredVegatableList => _filteredVegatableList;
  GroceryListState get groceryListState => _groceryListState;

  void InitilizeGroceryList() {
    _filteredFruitList = FruitList.fruitList;
    _filteredVegatableList = VegatableList.vegatableList;
    notifyListeners();
  }

  void swithGroceryListState(GroceryListState listState) {
    _groceryListState = listState;
    log(_groceryListState.name);
    notifyListeners();
  }

  void searchGroceryItem(String itemToSearch) {
    if (groceryListState == GroceryListState.fruit) {
      //search on fruit list...
      if (itemToSearch == "") {
        _filteredFruitList = FruitList.fruitList;
        notifyListeners();
      } else {
        _filteredFruitList =
            FruitList.fruitList
                .where(
                  (e) =>
                      e.name.toLowerCase().contains(
                        itemToSearch.toLowerCase(),
                      ) ||
                      e.price.toString().contains(itemToSearch),
                )
                .toList();
        notifyListeners();
      }
    } else {
      //search on vegetable list....
      if (itemToSearch == "") {
        _filteredVegatableList = VegatableList.vegatableList;
        notifyListeners();
      } else {
        _filteredVegatableList =
            VegatableList.vegatableList
                .where(
                  (e) =>
                      e.name.toLowerCase().contains(
                        itemToSearch.toLowerCase(),
                      ) ||
                      e.price.toString().contains(itemToSearch),
                )
                .toList();
        notifyListeners();
      }
    }
  }

  bool isFruitState() {
    return _groceryListState == GroceryListState.fruit;
  }

  bool isVegetableState() {
    return _groceryListState == GroceryListState.vegatalbe;
  }

  List getGroceryList() {
    if (isFruitState()) {
      return _filteredFruitList;
    } else {
      return _filteredVegatableList;
    }
  }
}

enum GroceryListState { fruit, vegatalbe }
