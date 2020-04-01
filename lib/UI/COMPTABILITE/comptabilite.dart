import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';

import 'comptabilite_page.dart';

class ComptabilitePage {
  Scaffold scaffoldMethod(BuildContext b, String titleList) {
    AllBar _bar = new AllBar(b);
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: _bar.myappBar(Colors.lightBlue, Colors.lightBlueAccent.shade100,
          titleList, Icons.home),
      body: SafeArea(child: ComptabilitePageView())
    );
  }
}
