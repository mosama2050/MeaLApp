import 'package:flutter/material.dart';

import 'package:mealapp/widgets/mealItem.dart';

import '../dummy_data.dart';
import '../widgets/mealItem.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';
  final List<Meal> _avilabeMeals ;

  const CategoryMealsScreen( this._avilabeMeals);


  @override
  _CategoryMealsScreen createState() => _CategoryMealsScreen();
}

class _CategoryMealsScreen extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget._avilabeMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
//      Platform.isIOS
//          ? CupertinoNavigationBar(
//              middle: Text(categoryTitle),
//            ) :
          AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, index) {
          var meal = displayedMeals[index];
          return MealItem(
            id: meal.id,
            duration: meal.duration,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
