import 'package:flutter/material.dart';

import 'gridList_icons.dart';

class GridListViewBuilderWidget extends StatelessWidget {
  const GridListViewBuilderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> _iconList = GridListIcons().getIconList();
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.all(8.0),

      itemBuilder: (BuildContext context, int index) {
        print('_buildGridViewBuilder $index');
        return Card(
          color: Colors.lightGreen.shade50,
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            child: Column(
              children: <Widget>[
                Center(
                  child: ListTile(
                    leading: Icon(
                      _iconList[index],
                      size: 48.0,
                      color: Colors.lightGreen,
                    ),
                    title: Text(
                      'Index $index',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
//selected: true,
                    onTap: () {
                      print('Tapped on Row $index');
                    },
                  ),
                ),
              ],
            ),
            onTap: () {
              print('Row $index');
            },
          ),
        );
      },
    );
  }
}
