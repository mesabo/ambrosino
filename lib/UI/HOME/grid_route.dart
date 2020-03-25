

class GridRoute {
  List<String> routeList = [];

  List<String> getRouteList() {
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
}
