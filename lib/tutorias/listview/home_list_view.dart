import 'package:flutter/material.dart';

import 'row_with_card.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return RowWithCardWidget(index: index);
            /* if (index == 0) {
          return HeaderWidget(index: index);
        } else if (index >= 1 && index <= 3) {
          return RowWithCardWidget(index: index);
        } else {
          return RowWidget(index: index);
        }*/
          },
        ),
      ),
    );
  }
}
