import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl; // networkImage
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity; //enums
  final Affordability affordability;
  // "Filters"
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan; // hard diet
  final bool isVegetarian; // vegetarian plat

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
