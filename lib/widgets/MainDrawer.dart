

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealapp/screens/FiltersScreen.dart';


class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function tapHandler) {
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
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
//            color: Theme.of(context).primaryColor,
            color: Colors.amber,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Aklne  - أكلني',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(), //here is a divider

          _buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
          Divider(), //here is a divider

          _buildListTile('Exit', Icons.exit_to_app, () {
            SystemNavigator.pop();          }),
        ],
      ),
    );
  }
}