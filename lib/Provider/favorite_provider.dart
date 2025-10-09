import 'package:flutter/material.dart';
import '../Model/grocery_items.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Groceryitems> _favoriteItems = [];

  // Get all favorite items
  List<Groceryitems> get favoriteItems => _favoriteItems;

  // Add or remove favorite
  void toggleFavorite(Groceryitems item) {
    if (_favoriteItems.contains(item)) {
      _favoriteItems.remove(item);
    } else {
      _favoriteItems.add(item);
    }
    notifyListeners(); // Refresh UI
  }

  // Check if an item is in favorites
  bool isFavorite(Groceryitems item) {
    return _favoriteItems.contains(item);
  }

  // Optional: clear all favorites
  void clearFavorites() {
    _favoriteItems.clear();
    notifyListeners();
  }

  bool isExist(Groceryitems groceryitems) {
        return _favoriteItems.contains(groceryitems);
  }
}
