import 'package:ambrosino/UI/appBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AllBar allBar = new AllBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: allBar.myappBar(Colors.lightBlue, Colors.lightBlue.shade100,
            "Accueil", Icons.home, "/home/messou/flutter/bin"),
        body: SafeArea(
          minimum: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Bonjour"),
                Text("Bonsoir"),
                Text("Bonne soirée"),
                Text("Bonne nuit"),
              ],
            ),
          ),
        ));
  }
}
