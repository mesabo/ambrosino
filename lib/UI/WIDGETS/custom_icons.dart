import 'package:flutter/material.dart';

class CustomIcons {
  List<IconData> iconList = [];

  //  GRIDVIEW ICONS LIST
  List<IconData> getGridIconList() {
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

  //  GRIDVIEW ICONS LIST
  List<IconData> getCommandeIconList() {
    iconList..add(Icons.add_circle)..add(Icons.list)..add(Icons.history);
    return iconList;
  }

  //  GRIDVIEW ICONS LIST
  List<IconData> getVenteIconList() {
    iconList
      ..add(Icons.add_circle)
      ..add(Icons.list)
      ..add(Icons.history)
      ..add(Icons.euro_symbol);
    return iconList;
  }
}
