import 'package:ambrosino/UI/WIDGETS/custom_color.dart';
import 'package:flutter/material.dart';

import '../WIDGETS/custom_icons.dart';
import '../WIDGETS/custom_route.dart';
import '../WIDGETS/custom_title.dart';
import 'display_route_page_from_vente.dart';

class VenteMainBuilderWidget extends StatelessWidget {
  const VenteMainBuilderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    instancier la liste des images
    List<IconData> _iconList = CustomIcons().getVenteIconList();
//    de meme pour les textes associés
    List<String> _titleList = GridTitle().getVenteTitleList();
    //    de meme pour les textes associés
    List<Color> _colorList = CustomColor().getVenteColorList();
    //    de meme pour les textes associés
    List<String> _routeList = GridRoute().getVenteRouteList();

    return GridView.builder(
      itemCount: 3,
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
                        DisplayRoutePageFromVente(_routeList[index],_titleList[index])),
              );
            },
          ),
        );
      },
    );
  }
}
