import 'package:flutter/material.dart';

 class HelperMethods{
   final BuildContext context;
  HelperMethods(this.context);

//  METHODE POUR AJOUTER UN ITEM À LA LISTE DES PAGE À OUVRIR

  Container buildContainerItem(Color _color,
      IconData _icon, String _title, Widget route) {
    return Container(
      height: 100,
      width: 600,
      child: Card(
        color: Colors.lightGreen.shade100,
        margin: EdgeInsets.all(8.0),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                _icon,
                size: 64.0,
                color: _color,
              ),
              Divider(),
              Text(
                _title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48.0,
                ),
              )
            ],
          ),
          onTap: () {
//              print(_routeList[index]);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
        ),
      ),
    );
  }
}