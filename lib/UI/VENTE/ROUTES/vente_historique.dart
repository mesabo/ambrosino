import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';

class VenteHistoriquePage extends StatefulWidget {
  final String title;

  VenteHistoriquePage(this.title);

  @override
  _VenteHistoriquePageState createState() => _VenteHistoriquePageState();
}

class _VenteHistoriquePageState extends State<VenteHistoriquePage> {
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
