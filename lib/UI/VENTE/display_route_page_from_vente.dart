import 'package:flutter/material.dart';

import 'ROUTES/vente_ajouter.dart';
import 'ROUTES/vente_caisse.dart';
import 'ROUTES/vente_historique.dart';

class DisplayRoutePageFromVente extends StatelessWidget {
  final String routeList;
  final String titleList;

// le constructeur
  DisplayRoutePageFromVente(this.routeList, this.titleList);

//  Instanciation de tous les widget à utiliser
  VenteAjouterPage _VenteAjouterPage = new VenteAjouterPage();
  VenteListPage _VenteListPage = new VenteListPage();
  VenteHistoriquePage _VenteHistoriquePage = new VenteHistoriquePage();

//  RAS
  Widget build(BuildContext context) {
    return _getPageState(context);
  }

/* Comme tout bon programmeur, le switch case est primordial.
  le context passé à chaque methode permet,
  au clique sur le boutton home du appbar de revenir
  à l'accueil
* */
  Widget _getPageState(BuildContext buildContext) {
    switch (routeList) {
      case '/Vente_ajouter':
        return _VenteAjouterPage.scaffoldMethod(buildContext, titleList);
        break;
      case '/Vente_liste':
        return _VenteListPage.scaffoldMethod(buildContext, titleList);
        break;
      case '/Vente_historique':
        return _VenteHistoriquePage.scaffoldMethod(buildContext, titleList);
        break;
      default:
        return _VenteHistoriquePage.scaffoldMethod(buildContext, titleList);
        break;
    }
  }
}
