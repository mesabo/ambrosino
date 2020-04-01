import 'package:ambrosino/UI/CLIENT/client.dart';
import 'package:ambrosino/UI/PARAMETRE/parametre.dart';
import 'package:ambrosino/UI/STATISTIQUE/statistique.dart';
import 'package:ambrosino/UI/VENTE/vente.dart';
import 'package:flutter/material.dart';

import 'AIDE/aide.dart';
import 'COMMANDE/commande.dart';
import 'COMPTABILITE/comptabilite.dart';
import 'DEPENSE/depense.dart';

class DisplayRoutePageFromGrid extends StatefulWidget {
  final String routeList;
  final String titleList;

// le constructeur
  DisplayRoutePageFromGrid(this.routeList, this.titleList);

  @override
  _DisplayRoutePageFromGridState createState() => _DisplayRoutePageFromGridState();
}

class _DisplayRoutePageFromGridState extends State<DisplayRoutePageFromGrid> {
  CommandePage _commandePage = new CommandePage();

  VentePage _ventePage = new VentePage();

  DepensePage _depensePage = new DepensePage();

  ComptabilitePage _comptabilitePage = new ComptabilitePage();

  StatistiquePage _statistiquePage = new StatistiquePage();

  ClientPage _clientPage = new ClientPage();

  ParametrePage _parametrePage = new ParametrePage();

  AidePage _aidePage = new AidePage();
@override
  Widget build(BuildContext context) {
    return _getPageState(context);
  }

  Widget _getPageState(BuildContext buildContext) {
    switch (widget.routeList) {
      case '/commande':
        return _commandePage.scaffoldMethod(buildContext, widget.titleList);
        break;
      case '/vente':
        return _ventePage.scaffoldMethod(buildContext, widget.titleList);
        break;
      case '/depense':
        return _depensePage.scaffoldMethod(buildContext, widget.titleList);
        break;
      case '/comptabilite':
        return _comptabilitePage.scaffoldMethod(buildContext, widget.titleList);
        break;
      case '/statistique':
        return _statistiquePage.scaffoldMethod(buildContext, widget.titleList);
        break;
      case '/client':
        return _clientPage.scaffoldMethod(buildContext, widget.titleList);
        break;
      case '/parametre':
        return _parametrePage.scaffoldMethod(buildContext, widget.titleList);
        break;
      case '/aide':
        return _aidePage.scaffoldMethod(buildContext, widget.titleList);
        break;

      default:
        return _aidePage.scaffoldMethod(buildContext, widget.titleList);
        break;
    }
  }
}
