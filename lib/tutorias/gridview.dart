import 'package:flutter/material.dart';

import 'gridview_widgets/gridview_builder.dart';

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const GridViewBuilderWidget(),
      ),
    );
  }
}
