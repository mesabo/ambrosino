class GridRoute {
  List<String> routeList = [];

// GRIDVIEW ROUTES
  List<String> getGridRouteList() {
    routeList
      ..add('/commande')
      ..add('/vente')
      ..add('/depense')
      ..add('/comptabilite')
      ..add('/statistique')
      ..add('/client')
      ..add('/parametre')
      ..add('/aide');
    return routeList;
  }

//  COMMANDE ROUTES
  List<String> getCommandeRouteList() {
    routeList
      ..add('/commande_ajouter')
      ..add('/commande_liste')
      ..add('/commande_historique');
    return routeList;
  }

//  VENTES ROUTES
  List<String> getVenteRouteList() {
    routeList
      ..add('/Vente_ajouter')
      ..add('/Vente_lister')
      ..add('/Vente_historique')
      ..add('/Vente_caisse');
    return routeList;
  }
}
