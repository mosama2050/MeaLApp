import 'package:flutter/material.dart';

import 'package:mealapp/screens/CategoryMealsScreen.dart';
import 'package:mealapp/screens/FiltersScreen.dart';
import 'package:mealapp/screens/MealDetailScreen.dart';
import './screens/TabsScreen.dart';


import 'models/meal.dart';
import 'dummy_data.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return MyAppState();
  }
}
  class MyAppState extends State<MyApp>{

    Map<String, bool> _filters = {
      'gluten': false,
      'lactose': false,
      'vegan': false,
      'vegetarian': false,
    };

    List<Meal> _availableMeals = DUMMY_MEALS;
    List<Meal> _favoriteMeals = [];

    void _setFilters(Map<String, bool> filterData) {
      setState(() {
        _filters = filterData;

        _availableMeals = DUMMY_MEALS.where((meal) {
          if(_filters['gluten'] && !meal.isGlutenFree) return false;
          if(_filters['lactose'] && !meal.isLactoseFree) return false;
          if(_filters['vegan'] && meal.isVegan) return false;
          if(_filters['vegetarian'] && !meal.isVegetarian) return false;

          return true;
        }).toList();
      });
    }

    void _toggleFavorite(String mealId) {
      final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

      setState(() {
        if(existingIndex > -1)  {
          _favoriteMeals.removeAt(existingIndex);
        } else {
          _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        }
      });
    }

    bool _isMealFavorite(String mealId) {
      return _favoriteMeals.any((meal) => meal.id == mealId);
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Colors.black87
          ),
        ),
      ),
     // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(context)=>TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilters),
      },
    );
  }
}

