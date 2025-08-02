import 'package:flutter/material.dart';
import 'package:new_app/api_serveces/fruit_api_servece.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/model/vegatable_model.dart';
import 'package:new_app/utils/vegatable_list.dart';

class GroceryListProvider with ChangeNotifier {
  List<Fruitmodel> _filteredFruitList = [];
  List<VegatableModel> _filteredVegatableList = [];
  GroceryListState _groceryListState = GroceryListState.fruit;
  bool _isLoading = true;

  List<Fruitmodel> get filteredFruitList => _filteredFruitList;
  List<VegatableModel> get filteredVegatableList => _filteredVegatableList;
  GroceryListState get groceryListState => _groceryListState;
  bool get isLoading => _isLoading;

  Future<void> initilizeGroceryList() async {
    _isLoading = true;
    notifyListeners();

    _filteredFruitList = await FruitApiServece.getFruits();
    _filteredVegatableList = VegatableList.vegatableList;

    _isLoading = false;
    notifyListeners();
  }

  void addFruitDetails(Fruitmodel fruitModel) async {
    _isLoading = false;
    notifyListeners();

    await FruitApiServece.addFruit(fruitModel);
    initilizeGroceryList();
  }

  void updateFruitDetails(Fruitmodel fruitmodel) async {
    _isLoading = true;
    notifyListeners();

    await FruitApiServece.updateFruitDetails(fruitmodel);
    initilizeGroceryList();
  }

  void deleteFruit(Fruitmodel fruitmodel) async {
    _isLoading = true;
    notifyListeners();

    await FruitApiServece.deleteFruits(fruitmodel);
    initilizeGroceryList();
  }

  void swithGroceryListState(GroceryListState listState) {
    _groceryListState = listState;
    notifyListeners();
  }

  void searchGroceryItem(String itemToSearch) {
    final _fruitList = _filteredFruitList;
    final _vegatableList = _filteredVegatableList;
    if (groceryListState == GroceryListState.fruit) {
      //search on fruit list...
      if (itemToSearch == "") {
        _filteredFruitList = _fruitList;
        notifyListeners();
      } else {
        _filteredFruitList =
            _fruitList
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
        _filteredVegatableList = _vegatableList;
        notifyListeners();
      } else {
        _filteredVegatableList =
            _vegatableList
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
