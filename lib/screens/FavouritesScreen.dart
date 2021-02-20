import 'package:flutter/material.dart';
import 'package:mealapp/models/Meal.dart';

import '../widgets/mealItem.dart';

class FavouritesScreen extends StatelessWidget {
  final  _favorites;

  FavouritesScreen(this._favorites);

  @override
  Widget build(BuildContext context) {
    if (_favorites.isEmpty) {
      return Center(
        child: Text('You have no favorites yet. Start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favorites[index].id,
            title: _favorites[index].title,
            imageUrl: _favorites[index].imageUrl,
            duration: _favorites[index].duration,
            complexity: _favorites[index].complexity,
            affordability: _favorites[index].affordability,
          );
        },
        itemCount: _favorites.length,
      );
    }
  }
}
