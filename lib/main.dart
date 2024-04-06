import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/fliters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _applyFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        //filtering for only filterData items
        if(_filters['gluten'] && !meal.isGlutenFree) {
          return false;// to exclude irrelevant items
        }
        if(_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true; // to store the meal i'm looking at in "_availableMeals".
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = 
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }// we get true, if i have a meal in favmeals within the id matches with id we test here.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliCook',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontSize: 20,fontFamily: 'Raleway')),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoConensed',
                fontWeight: FontWeight.bold,
              ),),
              ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: { //"routes table"
        '/' : (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName/*key*/: /*route builder function*/(ctx) => CategoryMealsScreen(_availableMeals), // "1st named route"
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite), // "2nd named route"
        FiltersScreen.routeName : (ctx) => FiltersScreen(_filters,_applyFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
