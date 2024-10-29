import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  List<String> _favoriteMeals = [];

  List<String> get favoriteMeals => _favoriteMeals;

  void toggleFavorite(String mealId) {
    if (_favoriteMeals.contains(mealId)) {
      _favoriteMeals.remove(mealId);
    } else {
      _favoriteMeals.add(mealId);
    }
    notifyListeners();
  }

  void removeFavorite(String mealId) {
    _favoriteMeals.remove(mealId);
    notifyListeners();
  }

  bool isFavorite(String mealId) {
    return _favoriteMeals.contains(mealId);
  }
}
