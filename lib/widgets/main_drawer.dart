import 'package:flutter/material.dart';

import '../screens/fliters_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget builListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w700, // .bold
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor, // same as decoration: BoxDecoration(...)

            child: Text(
              'Let\'s Cook it Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ), // header for the drawer
          SizedBox(
            height: 20,
          ),
          builListTile(
            'Meals',
            Icons.restaurant_menu,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          builListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
