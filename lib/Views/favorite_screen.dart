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
      body: favoriteMeals.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (ctx, index) {
                final mealId = favoriteMeals[index];
                final meal = meals.firstWhere((meal) => meal.id == mealId);
                return Container(
                    height: 270,
                    width: 380,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(meal.title),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  Provider.of<FavoritesProvider>(context,
                                          listen: false)
                                      .removeFavorite(mealId);
                                },
                              ),
                            ],
                          ),
                          Container(
                            height: 200, // Set height for image
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(meal.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
              },
            ),
    );
  }
}
