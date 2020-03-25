import 'package:flutter/material.dart';

class GridColor {
  List<Color> colorList = [];

  List<Color> getColorList() {
    colorList
      ..add(Colors.blue)
      ..add(Colors.deepOrangeAccent)
      ..add(Colors.pink)
      ..add(Colors.green)
      ..add(Colors.blue.shade800)
      ..add(Colors.grey)
      ..add(Colors.blue.shade200)
      ..add(Colors.lightGreen.shade500);
    return colorList;
  }
}
