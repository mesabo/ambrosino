import 'package:flutter/material.dart';

import 'gridview_builder.dart';

class GridListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const GridListViewBuilderWidget(),
      ),
    );
  }
}
