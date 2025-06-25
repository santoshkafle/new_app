import 'package:flutter/widgets.dart';
import 'package:new_app/model/favrouit_item_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<FavrouitItemModel> _favoriteItem = [];

  List<FavrouitItemModel> get favoriteItem => _favoriteItem;

  void addFavoriteItem(String item) {
    FavrouitItemModel fav = FavrouitItemModel(item: item);
    _favoriteItem.add(fav);

    notifyListeners();
  }

  void removeFavoriteItem(int index) {
    _favoriteItem.removeAt(index);
    notifyListeners();
  }

  void removeFavoriteFromLast() {
    _favoriteItem.removeLast();
    notifyListeners();
  }

  void RemoveAllFavorite() {
    _favoriteItem = [];
    notifyListeners();
  }

  bool IsFavorite(String foodName) {
    for (var e in _favoriteItem) {
      if (e.item.toLowerCase() == foodName.toLowerCase()) {
        return true;
      }
    }
    return false;
  }
}
