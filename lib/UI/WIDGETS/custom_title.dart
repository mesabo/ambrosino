class GridTitle {
  List<String> titleList = [];

//  GRIDVIEW ITEMS TITLE
  List<String> getGridTitleList() {
    titleList
      ..add("Commande")
      ..add("Vente")
      ..add("depense")
      ..add("Comptabilite")
      ..add("Statsistique")
      ..add("Client")
      ..add("Parametre")
      ..add("Aide");
    return titleList;
  }

//  COMMANDE ITEMS TITLE
  List<String> getCommandeTitleList() {
    titleList
      ..add("Ajouter commande")
      ..add("Lister commandes")
      ..add("Historique commandes");
    return titleList;
  }

  //  VENTE ITEMS TITLE
  List<String> getVenteTitleList() {
    titleList
      ..add("Effectuer Vente")
      ..add("Lister Ventes impayées")
      ..add("Historique Ventes")
      ..add("Caisse produits");
    return titleList;
  }

  //  AJOUTER COMMANDE DATATABLE ITEMS TITLE
  List<String> getAjouterCommandeTitleList() {
    titleList
      ..add("ARTICLE")
      ..add("PRIX UNITAIRE")
      ..add("QUATITÉ")
      ..add("PRIX TOTAUX");
    return titleList;
  }

  //  AJOUTER COMMANDE DATATABLE ROWS ITEMS TITLE
  List<String> getAjouterCommandeTitleRowList() {
    titleList
      ..add("ARTICLE")
      ..add("PRIX UNITAIRE")
      ..add("QUATITÉ")
      ..add("PRIX TOTAUX");
    return titleList;
  }
}
