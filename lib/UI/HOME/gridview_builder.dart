import 'package:ambrosino/UI/HOME/grid_color.dart';
import 'package:ambrosino/UI/display_route_page_from_home.dart';
import 'package:flutter/material.dart';

import 'grid_icons.dart';
import 'grid_route.dart';
import 'grid_title.dart';

class GridViewBuilderWidget extends StatelessWidget {
  const GridViewBuilderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    instancier la liste des images
    List<IconData> _iconList = GridIcons().getIconList();
//    de meme pour les textes associés
    List<String> _titleList = GridTitle().getTitleList();
    //    de meme pour les textes associés
    List<Color> _colorList = GridColor().getColorList();
    //    de meme pour les textes associés
    List<String> _routeList = GridRoute().getRouteList();

    return GridView.builder(
      itemCount: 8,
      padding: EdgeInsets.all(8.0),
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400.0),
      itemBuilder: (BuildContext context, int index) {
        //print('_buildGridViewBuilder $index');
        return Card(
          color: Colors.lightGreen.shade50,
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _iconList[index],
                  size: 96.0,
                  color: _colorList[index],
                ),
                Divider(),
                Text(
                  _titleList[index],
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
                MaterialPageRoute(
                    builder: (context) =>
                        DisplayRoutePageFromGrid(_routeList[index])),
              );

            },
          ),
        );
      },
    );
  }
}
