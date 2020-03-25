import 'package:ambrosino/UI/appBar.dart';
import 'package:flutter/material.dart';

class StatistiquePage {
  Scaffold scaffoldMethod(BuildContext b) {
    AllBar _bar = new AllBar(b);
    return Scaffold(
      appBar: _bar.myappBar(Colors.lightBlue, Colors.lightBlueAccent.shade100,
          "STATISTIQUE", Icons.home),
      body: Container(
        color: Colors.lightGreen.shade100,
      ),
    );
  }
}
