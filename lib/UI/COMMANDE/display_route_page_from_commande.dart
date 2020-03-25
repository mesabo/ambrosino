import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_ajouter.dart';
import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_historique.dart';
import 'package:ambrosino/UI/COMMANDE/ROUTES/commande_list.dart';
import 'package:flutter/material.dart';

class DisplayRoutePageFromCommande extends StatelessWidget {
  final String routeList;
  final String titleList;

// le constructeur
  DisplayRoutePageFromCommande(this.routeList, this.titleList);

//  Instanciation de tous les widget à utiliser
  CommandeAjouterPage _commandeAjouterPage = new CommandeAjouterPage();
  CommandeListPage _commandeListPage = new CommandeListPage();
  CommandeHistoriquePage _commandeHistoriquePage = new CommandeHistoriquePage();

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
      case '/commande_ajouter':
        return _commandeAjouterPage.scaffoldMethod(buildContext, titleList);
        break;
      case '/commande_liste':
        return _commandeListPage.scaffoldMethod(buildContext, titleList);
        break;
      case '/commande_historique':
        return _commandeHistoriquePage.scaffoldMethod(buildContext, titleList);
        break;
      default:
        return _commandeHistoriquePage.scaffoldMethod(buildContext, titleList);
        break;
    }
  }
}
