import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;
  int _currentGroceryTabIndex = 0;

  int get currentIndex => _currentIndex;
  int get currentGroceryTabIndex => _currentGroceryTabIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setCurrentGroceryTabIndex(int Index) {
    _currentGroceryTabIndex = Index;
    notifyListeners();
  }
}
