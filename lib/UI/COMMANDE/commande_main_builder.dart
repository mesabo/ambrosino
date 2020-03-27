import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_ajouter.dart';
import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_historique.dart';
import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_list.dart';
import 'package:flutter/material.dart';

class CommandMainBuilderWidget extends StatelessWidget {
  const CommandMainBuilderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                height: 100,
                width: 600,
                child: Card(
                  color: Colors.lightGreen.shade50,
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.add_circle,
                          size: 64.0,
                          color: Colors.green,
                        ),
                        Divider(),
                        Text(
                          'Ajouter Commande',
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
                                CommandeAjouterPage('Ajouter Commande')),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 600,
                child: Card(
                  color: Colors.lightGreen.shade50,
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.list,
                          size: 64.0,
                          color: Colors.green,
                        ),
                        Divider(),
                        Text(
                          'Lister commandes',
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
                                CommandeListPage('Lister commandes')),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 600,
                child: Card(
                  color: Colors.lightGreen.shade50,
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.history,
                          size: 64.0,
                          color: Colors.green,
                        ),
                        Divider(),
                        Text(
                          'Historique commandes',
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
                                CommandeHistoriquePage('Historique commandes')),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
