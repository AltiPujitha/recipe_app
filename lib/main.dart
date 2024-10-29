import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipe_app/Views/categoires_screen.dart';
import 'package:recipe_app/Views/favorites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => FavoritesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: ThemeData.light(),
        home: CategoriesScreen(),
      ),
    );
  }
}
