import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipe_app/Data/data.dart';
import 'package:recipe_app/Views/favorites.dart';
import 'package:recipe_app/Views/meals_info.dart';

class MealDetailScreen extends StatelessWidget {
  final String categoryId;
  final String namee;

  MealDetailScreen(this.categoryId, this.namee);

  @override
  Widget build(BuildContext context) {
    final mealsInCategory =
        meals.where((meal) => meal.categoryIds.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
          title: Text(namee,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      body: ListView.builder(
        itemCount: mealsInCategory.length,
        itemBuilder: (ctx, index) {
          final meal = mealsInCategory[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) =>
                    MealInfoScreen(meal.id), // Navigate to meal info
              ));
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 290,
                    width: 380,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(meal.title,
                                  style: TextStyle(color: Colors.black)),
                              IconButton(
                                icon: Icon(
                                    Provider.of<FavoritesProvider>(context)
                                            .isFavorite(meal.id)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.black),
                                onPressed: () {
                                  Provider.of<FavoritesProvider>(context,
                                          listen: false)
                                      .toggleFavorite(meal.id);
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
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
