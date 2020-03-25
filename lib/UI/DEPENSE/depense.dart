import 'package:ambrosino/UI/appBar.dart';
import 'package:flutter/material.dart';

class DepensePage {
  Scaffold scaffoldMethod(BuildContext b) {
    AllBar _bar = new AllBar(b);
    return Scaffold(
      appBar: _bar.myappBar(Colors.lightBlue, Colors.lightBlueAccent.shade100,
          "DEPENSE", Icons.home,),
      body: Container(
        color: Colors.lightGreen.shade100,
      ),
    );
  }
}
