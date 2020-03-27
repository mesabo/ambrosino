import 'package:ambrosino/DATA/Blocs/produit_bloc.dart';
import 'package:ambrosino/DATA/Services/produit_service.dart';
import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

class CommandeAjouterPage extends StatefulWidget {
  final String title;

  CommandeAjouterPage(this.title);

  @override
  _CommandeAjouterPageState createState() => _CommandeAjouterPageState();
}

class _CommandeAjouterPageState extends State<CommandeAjouterPage> {
  TextEditingController _nameEditingController = new TextEditingController();
  TextEditingController _phoneEditingController = new TextEditingController();
  TextEditingController _lieuEditingController = new TextEditingController();
  TextEditingController _dateEditingController = new TextEditingController();
  TextEditingController _quantiteEditingController =
      new TextEditingController();
  TextEditingController _prixEditingController = new TextEditingController();
  TextEditingController _articleEditingController = new TextEditingController();

  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();
  List<Produit> _produitList;
  GlobalKey<ScaffoldState> _scaffoldKey;
  ProduitService _produitService;

  String dateT = DateFormat.yMMMd().format(DateTime.now());

  void changeTheDate(String date) {
    print(date);
    setState(() {
      dateT = date;
    });
  }

  @override
  void initState() {
    super.initState();
    _produitList = [];
    _prixEditingController = new TextEditingController();
    _articleEditingController = new TextEditingController();
    _quantiteEditingController = new TextEditingController();
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _getProduits();

    _globalKey = new GlobalKey<FormState>();
    _nameEditingController = new TextEditingController();
    _phoneEditingController = new TextEditingController();
    _lieuEditingController = new TextEditingController();
    _dateEditingController = new TextEditingController();
  }

  _createTable() {
    ProduitService.createProduitTable().then((result) {
      if ('success' == result) {
        print(result);
        // Table is created successfully.
//        _showSnackBar(result);
//        _showProgress(widget.title);
      }
    });
  }

  _getProduits() {
    ProduitService.getProduits().then((produits) {
      setState(() {
        _produitList = produits;
      });
      print("Length ${produits.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    AllBar _bar = new AllBar(context);
    return Scaffold(
      appBar: _bar.myappBar(Colors.lightBlue, Colors.lightBlueAccent.shade100,
          widget.title, Icons.home),
      body: Container(
          color: Colors.lightGreen.shade100,
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: SafeArea(
                child: Form(
              key: _globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
//                    LIGNE CONTENANT NOMS ET TELEPHONE
                    child: Row(
                      children: <Widget>[
//                        NOMS COMPLET
                        Flexible(
                          child: TextFormField(
                            controller: _nameEditingController,
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                            ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            autovalidate: true,
                            maxLength: 50,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Noms requis !';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
//                        TELEPHONE PORTABLE
                        Flexible(
                          child: TextFormField(
                            controller: _phoneEditingController,
                            decoration: InputDecoration(
                              filled: true,
                              prefixText: '+225',
                              prefixIcon: Icon(Icons.phone),
                              //hintText: '57777500',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            autovalidate: true,
                            maxLength: 8,
                            validator: (String value) {
                              if (((value.isNotEmpty) && (value.length < 8)) ||
                                  value.length > 8) {
                                return 'Entrer un téléphone valide';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
//                  DATE DE LA COMMANDE
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            controller: _lieuEditingController,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Lieu de livraison',
                              prefixIcon: Icon(Icons.place),
                            ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            autovalidate: true,
                            maxLength: 100,
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: _dateEditingController,
                            decoration: InputDecoration(
                                helperText:
                                    'Click sur le bouton à droite pour sélectionner la date',
                                filled: true,
                                hintText: '$dateT',
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.date_range),
                                    onPressed: () async {
                                      DateTime newDateTime =
                                          await showRoundedDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:
                                            DateTime(DateTime.now().year - 1),
                                        lastDate:
                                            DateTime(DateTime.now().year + 1),
                                        borderRadius: 20,
                                      );
                                      if (newDateTime != null) {
                                        String selectedDate = DateFormat.yMMMd()
                                            .format(newDateTime);
                                        changeTheDate(selectedDate);
                                      }
                                    })),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(onPressed: (){_createTable();},child: Text('CREER LA TABLE'),),
                  Center(
                    child: DataTable(
                        sortColumnIndex: 0,
                        sortAscending: true,
                        columns: [
                          DataColumn(label: Text('N°')),
                          DataColumn(label: Text('Articles')),
                          DataColumn(label: Text('Prix Unitaire')),
                          DataColumn(label: Text('Quantité achetée')),
                          DataColumn(label: Text('Totaux montants')),
                        ],
                        rows: _produitList
                            .map((produits) => DataRow(cells: [
                                  DataCell(Text(produits.id.toString())),
                                  DataCell(Text(produits.article.toString())),
                                  DataCell(Text(produits.prixu.toString())),
                                  DataCell(ListTile(
                                    trailing: IconButton(icon: Icon(Icons.chevron_right), onPressed: (){
                                      _onChanged(_quantiteEditingController.text);
                                    }),
                                    title: Container(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _quantiteEditingController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          hintText: '____',
                                        ),
                                        textAlign: TextAlign.end,
                                        keyboardType: TextInputType.numberWithOptions(
                                            decimal: false, signed: false),
                                        autovalidate: true,
                                      ),
                                    ),
                                  )),
                                  DataCell(Text(_value)),
                                ]))
                            .toList()),
                  ),
                ],
              ),
            )),
          )),
    );
  }

  GridTile _gridTile;

  String _value = '0000';

  void _onChanged(String value) {
    setState(() {
      int val = int.parse(value) * 400;
      _value = '$val';
    });
  }

//  TODO JSON @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
