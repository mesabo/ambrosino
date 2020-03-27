import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';

class CommandeListPage extends StatefulWidget {
  final String title;

  CommandeListPage(this.title);

  @override
  _CommandeListPageState createState() => _CommandeListPageState();
}

class _CommandeListPageState extends State<CommandeListPage> {
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
