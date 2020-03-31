import 'package:ambrosino/BLOC/helper_methods.dart';
import 'package:ambrosino/UI/VENTE/ROUTES/vente_list.dart';
import 'package:flutter/material.dart';

import 'ROUTES/vente_ajouter.dart';
import 'ROUTES/vente_historique.dart';

class VenteMainBuilderWidget extends StatelessWidget {
  VenteMainBuilderWidget({
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
                  'Ajouter Vente',
                  VenteAjouterPage('Ajouter Vente')),

//              AJOUTER COMMANDE ROUTE PAGE
              helperMethods.buildContainerItem(Colors.blueGrey, Icons.list,
                  'Lister vente', VenteListPage('Lister vente')),

//              AJOUTER COMMANDE ROUTE PAGE
              helperMethods.buildContainerItem(
                  Colors.orange,
                  Icons.history,
                  'Historique vente',
                  VenteHistoriquePage('Historique vente')),
//                 AJOUTER COMMANDE ROUTE PAGE
              helperMethods.buildContainerItem(
                  Colors.orange,
                  Icons.monetization_on,
                  'Caisse vente',
                  VenteHistoriquePage('Caisse vente')),
            ],
          ),
        )),
      ),
    );
  }
}
