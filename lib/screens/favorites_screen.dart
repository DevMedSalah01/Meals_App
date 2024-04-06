import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMealsHandler;

  FavoriteScreen(this.favoriteMealsHandler);


  @override
  Widget build(BuildContext context) {
    if (favoriteMealsHandler.isEmpty) {
      return Center(
      child: Text('You have no favorites yet!'),
    );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMealsHandler[index].id,
            title: favoriteMealsHandler[index].title,
            imageUrl: favoriteMealsHandler[index].imageUrl,
            duration: favoriteMealsHandler[index].duration,
            complexity: favoriteMealsHandler[index].complexity,
            affordability: favoriteMealsHandler[index].affordability, 
          );
        },
        itemCount: favoriteMealsHandler.length,
      );
    }
    
  }
}