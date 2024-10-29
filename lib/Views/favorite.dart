import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipe_app/Data/data.dart';
import 'package:recipe_app/Views/favorites.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteMeals = Provider.of<FavoritesProvider>(context).favoriteMeals;

    return Scaffold(
      appBar: AppBar(title: Text('Your Favorites')),
      body: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          final mealId = favoriteMeals[index];
          final meal = meals.firstWhere((meal) => meal.id == mealId);
          return ListTile(
            title: Text(meal.title),
            // Handle meal detail navigation
          );
        },
      ),
    );
  }
}
