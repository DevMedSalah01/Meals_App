import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.color, this.title, this.id);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    },
    );
    /*.push(
      MaterialPageRoute(builder: (_) {
        return CategoryMealsScreen(id, title);
      }),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(// more designed than "GestureDetector"
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //Range of graduation color opacity
              color.withOpacity(0.7), // make the colour from slitely more transparent
              color, // ~totally not transparent
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        // alignment: Alignment.center,
      ),
    );
  }
}
