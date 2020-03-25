import 'package:flutter/material.dart';

class AllBar {
  AllBar(this.context);
  final BuildContext context;
// AppBAr ajusté sur toutes les pages
  Widget myappBar( Color color1,Color color2, String title, IconData ico) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "$title".toUpperCase(),
        style: TextStyle(color: Colors.black,fontSize: 32.0,),
      ),
      actions: <Widget>[
        IconButton(
          icon: new Icon(ico,color: Colors.white,size: 32,),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ],
      elevation: 0.0,
      bottom: PreferredSize(
          child: Container(), preferredSize: Size.fromHeight(32.0)),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
