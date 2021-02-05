import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mealapp/screens/CategoryMealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String img;
  final String title;
  final Color color;

  CategoryItem(this.img,this.id, this.title, this.color, );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      // should match border radius of container

      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
             img,
              width: double.infinity,
              height: 250.0,
              fit: BoxFit.cover,
            ),
//            child: Image.network(
//              'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//              height: 250,
//              width: double.infinity,
//              fit: BoxFit.cover, // re-sizes and crops the image
//            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: Colors.black54,
              ),
              width: 150,
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          )
        ],
      ),

//      child: Container(
//        padding: const EdgeInsets.all(15),
////        alignment:Alignment.center,
//        child: Text(
//
//          title,
//          style: Theme.of(context).textTheme.title,
//        ),
//        decoration: BoxDecoration(
//          gradient: LinearGradient(
//            colors: [
//              color.withOpacity(0.4),
//              color,
//            ],
//            begin: Alignment.topLeft,
//            end: Alignment.bottomRight,
//          ),
//          borderRadius: BorderRadius.circular(15),
//        ),
//      ),
    );
  }
}
