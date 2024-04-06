import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    // A builder Method to avoid code duplication
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
  

  Widget buildContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 140,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String; // to extract arg Id routed in the path
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) =>
        meal.id == mealId); // we need just to return one single element if the id matches
    return Scaffold(
      // must be to show designed page for the content "Center"
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients', context),
              buildContainer(
                // child as NamedArg
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index])),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle('Steps!', context),
              buildContainer(
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Bookmark this Meal',
        child: Icon(
          isFavorite(mealId) ? Icons.favorite
          : Icons.favorite_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(mealId); // removes screen & passing data Back through pop()
        },
      ),*/
    );
  }
}
