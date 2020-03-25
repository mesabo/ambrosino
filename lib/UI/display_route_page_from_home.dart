import 'package:ambrosino/UI/CLIENT/client.dart';
import 'package:ambrosino/UI/PARAMETRE/parametre.dart';
import 'package:ambrosino/UI/STATISTIQUE/statistique.dart';
import 'package:ambrosino/UI/VENTE/vente.dart';
import 'package:flutter/material.dart';

import 'AIDE/aide.dart';
import 'COMMANDE/commande.dart';
import 'COMPTABILITE/comptabilite.dart';
import 'DEPENSE/depense.dart';

class DisplayRoutePageFromGrid extends StatelessWidget {
  final String routeList;

// le constructeur
  DisplayRoutePageFromGrid(this.routeList);

//  Instanciation de tous les widget à utiliser
  CommandePage _commandePage = new CommandePage();
  VentePage _ventePage = new VentePage();
  DepensePage _depensePage = new DepensePage();
  ComptabilitePage _comptabilitePage = new ComptabilitePage();
  StatistiquePage _statistiquePage = new StatistiquePage();
  ClientPage _clientPage = new ClientPage();
  ParametrePage _parametrePage = new ParametrePage();
  AidePage _aidePage = new AidePage();

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
      case '/commande':
        return _commandePage.scaffoldMethod(buildContext);
        break;
      case '/vente':
        return _ventePage.scaffoldMethod(buildContext);
        break;
      case '/depense':
        return _depensePage.scaffoldMethod(buildContext);
        break;
      case '/comptabilite':
        return _comptabilitePage.scaffoldMethod(buildContext);
        break;
      case '/statistique':
        return _statistiquePage.scaffoldMethod(buildContext);
        break;
      case '/client':
        return _clientPage.scaffoldMethod(buildContext);
        break;
      case '/parametre':
        return _parametrePage.scaffoldMethod(buildContext);
        break;
      case '/aide':
        return _aidePage.scaffoldMethod(buildContext);
        break;

      default:
        return _aidePage.scaffoldMethod(buildContext);
        break;
    }
  }
}
