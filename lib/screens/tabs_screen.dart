import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages ;
  int _selectedPageIndex = 0;

  @override
  void initState() { 
  // because 'widget.' can't be used while initilizing "_pages"
    _pages = [ 
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    }, //: 0
    {
      'page': FavoriteScreen(widget.favoriteMeals), 
      'title': 'Your Favorites',
    }, //: 1
  ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() { // because we will manually change the IndexPage we choose
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,

        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 16,

        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
              tooltip: 'Go into Categories!'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites',
              tooltip: 'Go into Favorites!'),
        ],
      ),
    ); // to manage the entire Screen
  }
}
