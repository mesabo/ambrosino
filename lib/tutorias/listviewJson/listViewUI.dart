import 'package:flutter/material.dart';
import 'produit_bloc.dart';
import 'produit_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CRUDListView extends StatefulWidget {
  @override
  _CRUDListViewState createState() => _CRUDListViewState();
}

class _CRUDListViewState extends State<CRUDListView> {
  List<Produit> _produits;
  List<Produit> _searchProduct;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _produits = [];
    _searchProduct = [];
    _getEmployees();
  }

  _getEmployees() {
    ProduitService.getProduits().then((produits) {
      setState(() {
        _produits = produits;
      });
      print("Length ${produits.length} ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text('SEARCH ON LISTVIEW'),
        elevation: 0.0,
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            color: Theme.of(context).primaryColor,
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          new Expanded(
            child: _searchProduct.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
                    itemCount: _searchProduct.length,
                    itemBuilder: (context, i) {
                      return new Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: Text(('${_searchProduct[i].id}')),
                            title: Text(('${_searchProduct[i].article}')),
                            trailing: Text(('${_searchProduct[i].prixu}')),
                          ),
                        ),
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Archive',
                            color: Colors.blue,
                            icon: Icons.archive,
                            onTap: () {
                              print('archive');
                            },
                          ),
                          IconSlideAction(
                            caption: 'Share',
                            color: Colors.indigo,
                            icon: Icons.share,
                            onTap: () {
                              print('share');
                            },
                          ),
                        ],
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'More',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            onTap: () {
                              print('more');
                            },
                          ),
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              print('delete');
                            },
                          ),
                        ],
                      );
                    },
                  )
                : new ListView.builder(
                    itemCount: _produits.length,
                    itemBuilder: (context, index) {
                      return new Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: Text(('${_produits[index].id}')),
                            title: Text(('${_produits[index].article}')),
                            trailing: Text(('${_produits[index].prixu}')),
                          ),
                        ),
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Archive',
                            color: Colors.blue,
                            icon: Icons.archive,
                            onTap: () {
                              print('archive');
                            },
                          ),
                          IconSlideAction(
                            caption: 'Share',
                            color: Colors.indigo,
                            icon: Icons.share,
                            onTap: () {
                              print('share');
                            },
                          ),
                        ],
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'More',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            onTap: () {
                              print('more');
                            },
                          ),
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              print('delete');
                            },
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchProduct.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _produits.forEach((produit) {
      if (produit.article.contains(text) || produit.prixu.contains(text))
        _searchProduct.add(produit);
    });

    setState(() {});
  }
}

/*    Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: _produits.length,
                itemBuilder: (context,int index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(('${_produits[index].id}')),
                        title: Text(('${_produits[index].article}')),
                        trailing: Text(('${_produits[index].prixu}')),
                      ),
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Archive',
                        color: Colors.blue,
                        icon: Icons.archive,
                        onTap: () {print('archive');},
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: Icons.share,
                        onTap: () {print('share');},
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'More',
                        color: Colors.black45,
                        icon: Icons.more_horiz,
                        onTap: ()  {print('more');},
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {print('delete');},
                      ),
                    ],
                  );
                }),
          ),*/
