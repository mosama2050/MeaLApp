
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String img;
  final Color color;

  const Category(
  {  this.img,
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}