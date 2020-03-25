import 'package:flutter/material.dart';

class GridIcons {
  List<IconData> iconList = [];

  List<IconData> getIconList() {
    iconList
      ..add(Icons.format_list_numbered)
      ..add(Icons.add_shopping_cart)
      ..add(Icons.shopping_cart)
      ..add(Icons.euro_symbol)
      ..add(Icons.timeline)
      ..add(Icons.supervised_user_circle)
      ..add(Icons.settings)
      ..add(Icons.help);
    return iconList;
  }
}
