import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';

import 'gridview_builder.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AllBar allBar = new AllBar(context);
    return Scaffold(
      appBar: allBar.myappBar(Colors.lightBlue, Colors.lightBlue.shade100,
          "Accueil", Icons.home),
      body: SafeArea(
        child: const GridViewBuilderWidget(),
      ),
    );
  }
}
