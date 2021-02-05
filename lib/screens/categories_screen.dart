
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/widgets/CategoryItem.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  final String title = 'DeliMeals';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((categoryData) => CategoryItem(
          categoryData.id, categoryData.title, categoryData.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
