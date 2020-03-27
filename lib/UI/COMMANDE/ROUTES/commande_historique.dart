import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';

class CommandeHistoriquePage extends StatefulWidget {
  final String title;

  CommandeHistoriquePage(this.title);

  @override
  _CommandeHistoriquePageState createState() => _CommandeHistoriquePageState();
}

class _CommandeHistoriquePageState extends State<CommandeHistoriquePage> {
  @override
  Widget build(BuildContext context) {
    AllBar _bar = new AllBar(context);
    return Scaffold(
      appBar: _bar.myappBar(Colors.lightBlue, Colors.lightBlueAccent.shade100,
          widget.title, Icons.home),
      body: Container(
        color: Colors.lightGreen.shade100,
        child: Text(widget.title),
      ),
    );
  }
}
