import 'package:flutter/material.dart';

class CustomColor {
  List<Color> colorList = [];

//  GRIDVIEW ITEMS COLOR
  List<Color> getGridColorList() {
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

  //  CMDE MAIN  ITEMS COLOR
  List<Color> getCommandeColorList() {
    colorList
      ..add(Colors.green)
      ..add(Colors.deepPurpleAccent)
      ..add(Colors.blue.shade200);
    return colorList;
  }

  //  CMDE MAIN  ITEMS COLOR
  List<Color> getVenteColorList() {
    colorList
      ..add(Colors.green)
      ..add(Colors.deepPurpleAccent)
      ..add(Colors.blue.shade200)
      ..add(Colors.pink);
    return colorList;
  }
}
