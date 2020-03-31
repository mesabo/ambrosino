import 'package:ambrosino/DATA/Blocs/produit_bloc.dart';
import 'package:ambrosino/DATA/Services/produit_service.dart';
import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:super_rich_text/super_rich_text.dart';


class CommandeListPage extends StatefulWidget {
  final String title;

  CommandeListPage(this.title);

  @override
  _CommandeListPageState createState() => _CommandeListPageState();
}

class _CommandeListPageState extends State<CommandeListPage> {
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
    AllBar _bar = new AllBar(context);
    return Scaffold(backgroundColor: Colors.lightGreen.shade100,
      appBar: _bar.myappBar(Colors.lightBlue, Colors.lightGreen.shade100,
          widget.title, Icons.home),
      body: new Column(
        children: <Widget>[
          new Container(
            color: Theme.of(context).primaryColor,
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildSearchFieldCard(),
            ),
          ),
          new Expanded(
            child: _searchProduct.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
              itemCount: _searchProduct.length,
              itemBuilder: (context, i) {
                return buildSlidableSearchable(i);
              },
            )
                : new ListView.builder(
              itemCount: _produits.length,
              itemBuilder: (context, index) {
                return buildSlidable(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  //  CHAMP DE RECHERCHE
  Card buildSearchFieldCard() {
    return new Card(
              child: new ListTile(
                leading: new Icon(Icons.search),
                title: new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                      hintText: 'Chercher', border: InputBorder.none),
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
            );
  }
//RESULTAT DE RECHERCHE
  Slidable buildSlidableSearchable(int i) {
    return new Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(('${_searchProduct[i].id}')),
                    title: Text(('${_searchProduct[i].article}  ${_searchProduct[i].desc}')),
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
                    caption: 'supprimer',
                    color: Colors.red,
                    icon: Icons.delete_forever,
                    onTap: () {
                      print('supprimer');
                    },
                  ),
                  IconSlideAction(
                    caption: 'editer',
                    color: Colors.green,
                    icon: Icons.edit,
                    onTap: () {
                      print('editer');
                    },
                  ),
                  IconSlideAction(
                    caption: 'plus',
                    color: Colors.lightBlue,
                    icon: Icons.more_horiz,
                    onTap: () {
                      print('plus');
                    },
                  ),
                ],
              );
  }

//  LISTE INITIALE DES ELEMENTS
  Slidable buildSlidable(int index) {
    return new Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(('${_produits[index].id}')),
                    title: Text(('${_produits[index].article}   ${_produits[index].desc}')),
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
                    caption: 'supprimer',
                    color: Colors.red,
                    icon: Icons.delete_forever,
                    onTap: () {
                      print('supprimer');
                    },
                  ),
                  IconSlideAction(
                    caption: 'editer',
                    color: Colors.green,
                    icon: Icons.edit,
                    onTap: () {
                      print('editer');
                    },
                  ),
                  IconSlideAction(
                    caption: 'plus',
                    color: Colors.lightBlue,
                    icon: Icons.more_horiz,
                    onTap: () async{
                      await buildEasyDialog('${_produits[index].article}','${_produits[index].prixu}','${_produits[index].desc}').show(context);
                      print('plus');
                    },
                  ),
                ],
              );
  }

  EasyDialog buildEasyDialog(String article, String prix, String description) {
    return EasyDialog(cardColor: Colors.lightGreen.shade100,
                        closeButton: true,
                        title: Text(
                          "DÉTAILS DE LA COMMANDE",
                          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Exo', fontSize: 24),
                          textScaleFactor: 1.2,
                        ),
                        height: MediaQuery.of(context).size.width/2.75,
                        width: MediaQuery.of(context).size.width/1.5,
                        contentList: [
                          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                            SuperRichText(
                              text: 'Le client *$article* a commandé oo220oo packets à rr${prix}rr, ll${description}ll',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22
                              ),
                              othersMarkers: [
                                MarkerText(
                                    marker: 'oo',
                                    style: TextStyle(
                                        color: Colors.orangeAccent
                                    )
                                ),
                                MarkerText(
                                    marker: 'rr',
                                    style: TextStyle(
                                        color: Colors.redAccent
                                    )
                                ),
                                MarkerText.withUrl(
                                    marker: 'll',
                                    urls: [
                                      'https://www.google.com',
                                      'https://www.facebook.com'
                                    ]
                                ),
                                MarkerText.withFunction(
                                    marker: 'ff',
                                    functions: [
                                          () => print('function 1'),
                                          () => print(('function 2'))
                                    ],
                                    style: TextStyle(
                                        color: Colors.greenAccent
                                    )
                                )
                              ],
                            ),
                            SuperRichText(
                              text: 'Le client *$article* a commandé oo220oo packets à rr${prix}rr, ll${description}ll',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22
                              ),
                              othersMarkers: [
                                MarkerText(
                                    marker: 'oo',
                                    style: TextStyle(
                                        color: Colors.orangeAccent
                                    )
                                ),
                                MarkerText(
                                    marker: 'rr',
                                    style: TextStyle(
                                        color: Colors.redAccent
                                    )
                                ),
                                MarkerText.withUrl(
                                    marker: 'll',
                                    urls: [
                                      'https://www.google.com',
                                      'https://www.facebook.com'
                                    ]
                                ),
                                MarkerText.withFunction(
                                    marker: 'ff',
                                    functions: [
                                          () => print('function 1'),
                                          () => print(('function 2'))
                                    ],
                                    style: TextStyle(
                                        color: Colors.greenAccent
                                    )
                                )
                              ],
                            ),
                            SuperRichText(
                              text: 'Le client *$article* a commandé oo220oo packets à rr${prix}rr, ll${description}ll',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22
                              ),
                              othersMarkers: [
                                MarkerText(
                                    marker: 'oo',
                                    style: TextStyle(
                                        color: Colors.orangeAccent
                                    )
                                ),
                                MarkerText(
                                    marker: 'rr',
                                    style: TextStyle(
                                        color: Colors.redAccent
                                    )
                                ),
                                MarkerText.withUrl(
                                    marker: 'll',
                                    urls: [
                                      'https://www.google.com',
                                      'https://www.facebook.com'
                                    ]
                                ),
                                MarkerText.withFunction(
                                    marker: 'ff',
                                    functions: [
                                          () => print('function 1'),
                                          () => print(('function 2'))
                                    ],
                                    style: TextStyle(
                                        color: Colors.greenAccent
                                    )
                                )
                              ],
                            ),
                            SuperRichText(
                              text: 'Le client *$article* a commandé oo220oo packets à rr${prix}rr, ll${description}ll',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22
                              ),
                              othersMarkers: [
                                MarkerText(
                                    marker: 'oo',
                                    style: TextStyle(
                                        color: Colors.orangeAccent
                                    )
                                ),
                                MarkerText(
                                    marker: 'rr',
                                    style: TextStyle(
                                        color: Colors.redAccent
                                    )
                                ),
                                MarkerText.withUrl(
                                    marker: 'll',
                                    urls: [
                                      'https://www.google.com',
                                      'https://www.facebook.com'
                                    ]
                                ),
                                MarkerText.withFunction(
                                    marker: 'ff',
                                    functions: [
                                          () => print('function 1'),
                                          () => print(('function 2'))
                                    ],
                                    style: TextStyle(
                                        color: Colors.greenAccent
                                    )
                                )
                              ],
                            ),
                            SuperRichText(
                              text: 'Le client *$article* a commandé oo220oo packets à rr${prix}rr, ll${description}ll',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22
                              ),
                              othersMarkers: [
                                MarkerText(
                                    marker: 'oo',
                                    style: TextStyle(
                                        color: Colors.orangeAccent
                                    )
                                ),
                                MarkerText(
                                    marker: 'rr',
                                    style: TextStyle(
                                        color: Colors.redAccent
                                    )
                                ),
                                MarkerText.withUrl(
                                    marker: 'll',
                                    urls: [
                                      'https://www.google.com',
                                      'https://www.facebook.com'
                                    ]
                                ),
                                MarkerText.withFunction(
                                    marker: 'ff',
                                    functions: [
                                          () => print('function 1'),
                                          () => print(('function 2'))
                                    ],
                                    style: TextStyle(
                                        color: Colors.greenAccent
                                    )
                                )
                              ],
                            ),
                          ],),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FlatButton(
                                padding: const EdgeInsets.only(top: 8.0),
                                textColor: Colors.lightBlue,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: new Text(
                                  "QUITER",
                                  textScaleFactor: 1.2,
                                  style: TextStyle(fontSize: 24,fontFamily: 'Exo',fontWeight: FontWeight.bold),
                                ),
                              ),
                              new FlatButton(
                                padding: const EdgeInsets.only(top: 8.0),
                                textColor: Colors.green,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: new Text(
                                  "MODIFIER",
                                  textScaleFactor: 1.2,
                                  style: TextStyle(fontSize: 24,fontFamily: 'Exo',fontWeight: FontWeight.bold),
                                ),
                              ),

                            ],
                          )
                        ]);
  }

// FONCTION DE RECHERCHE
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

//  ALERT DIALOG POUR PLUS DE DETAILS...
}
