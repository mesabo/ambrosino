import 'package:ambrosino/BLOC/helper_methods.dart';
import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_ajouter.dart';
import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_historique.dart';
import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_list.dart';
import 'package:flutter/material.dart';

class CommandMainBuilderWidget extends StatelessWidget {
   CommandMainBuilderWidget({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    HelperMethods helperMethods = new HelperMethods(context);
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[

//              AJOUTER COMMANDE ROUTE PAGE
              helperMethods.buildContainerItem(

                  Colors.lightBlue,
                  Icons.add_circle,
                  'Ajouter Commande',
                  CommandeAjouterPage('Ajouter Commande')),

//              AJOUTER COMMANDE ROUTE PAGE
              helperMethods.buildContainerItem(

                  Colors.blueGrey,
                  Icons.list,
                  'Lister commandes',
                  CommandeListPage('Lister commandes')),

//              AJOUTER COMMANDE ROUTE PAGE
              helperMethods.buildContainerItem(

                  Colors.orange,
                  Icons.history,
                  'Historique commandes',
                  CommandeHistoriquePage('Historique commandes')),
            ],
          ),
        )),
      ),
    );
  }
}
