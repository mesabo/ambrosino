import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';

import 'commande_main_builder.dart';

class CommandePage {
  Scaffold scaffoldMethod(BuildContext b, String titleList) {
    AllBar _bar = new AllBar(b);
    return Scaffold(
      appBar: _bar.myappBar(Colors.lightBlue, Colors.lightBlueAccent.shade100,
          titleList, Icons.home),
      body: SafeArea(
        child: const CommandMainBuilderWidget(),
      ),
    );
  }
}
