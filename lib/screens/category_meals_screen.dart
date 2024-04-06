import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget { // StatelessWidget =>> Stateful to change"state":the meals categories which i display
  static const routeName = '/category-meals';

  final List<Meal> availableMealsHandler;

  CategoryMealsScreen(this.availableMealsHandler);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryIdHandler;
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    //...We Can't use context here because initState runs too early,before having widget context
    super.initState();
  }
    //then : 
  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    // to extract the route Arguments coming from "category_item"
    categoryTitle = routeArgs['title'];
    final CategoryIdHanler = routeArgs['id'];

    displayedMeals = widget.availableMealsHandler.where((meal) {
      return meal.categories.contains(CategoryIdHanler); // only same idcategory of mealcartegory will be kept in list "meal"
    }).toList();
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId){
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability, 
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
