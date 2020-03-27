import 'package:flutter/material.dart';

class AllBar {
  AllBar(this.context);

  final BuildContext context;

// AppBAr ajusté sur toutes les pages
  Widget myappBar(Color color1, Color color2, String title, IconData ico) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "$title",
        style: TextStyle(
          color: Colors.black,
          fontSize: 48.0,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right:30.0),
          child: IconButton(
            icon: new Icon(
              ico,
              color: Colors.white,
              size: 64,
            ),
            onPressed: () {
              //Navigator.popAndPushNamed(context, '/home');
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            },
          ),
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
