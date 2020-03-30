import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

class CommandeAjouterPage extends StatefulWidget {
  final String title;

  CommandeAjouterPage(this.title);

  @override
  _CommandeAjouterPageState createState() => _CommandeAjouterPageState();
}

class _CommandeAjouterPageState extends State<CommandeAjouterPage> {
  int _radioValue;
  var echo;
  String _valueAwa50 = '00';
  String _valueAwa25 = '00';
  String _valueAwa15 = '00';
  String _totaux = '00';

//  CONTROLLEURS DES INFORMATIONS CONCERNANT LE CLIENT
  TextEditingController _nameEditingController = new TextEditingController();
  TextEditingController _phoneEditingController = new TextEditingController();
  TextEditingController _lieuEditingController = new TextEditingController();
  TextEditingController _dateEditingController = new TextEditingController();

//  CONTROLLEUR QUANTITE DES PRODUITS
  TextEditingController _quantiteEditingController50 =
      new TextEditingController();
  TextEditingController _quantiteEditingController25 =
      new TextEditingController();
  TextEditingController _quantiteEditingController15 =
      new TextEditingController();

  //  TODO: CONTROLLEUR PRIX DES PRODUIT
  TextEditingController _prixEditingController50 = new TextEditingController();
  TextEditingController _prixEditingController25 = new TextEditingController();
  TextEditingController _prixEditingController15 = new TextEditingController();

  //  TODO: CONTROLLEUR TOTAL DES PRODUITS
  TextEditingController _totalEditingController50 = new TextEditingController();
  TextEditingController _totalEditingController25 = new TextEditingController();
  TextEditingController _totalEditingController15 = new TextEditingController();
  TextEditingController _totauxEditingController = new TextEditingController();

  TextEditingController _avanceEditingController = new TextEditingController();
  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

//  CONVERSION DE LA DATE
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
//    INFO CLIENT CONTROLLEURS
    _globalKey = new GlobalKey<FormState>();
    _nameEditingController = new TextEditingController();
    _phoneEditingController = new TextEditingController();
    _lieuEditingController = new TextEditingController();
    _dateEditingController = new TextEditingController();

    //  CONTROLLEUR QUANTITE DES PRODUIT
    _quantiteEditingController50 = new TextEditingController(text: '0');
    _quantiteEditingController25 = new TextEditingController(text: '0');
    _quantiteEditingController15 = new TextEditingController(text: '0');

    //  CONTROLLEUR PRIX DES PRODUIT
    _prixEditingController50 = new TextEditingController(text: '400');
    _prixEditingController25 = new TextEditingController(text: '500');
    _prixEditingController15 = new TextEditingController(text: '300');

    //  CONTROLLEUR TOTAL DES PRODUIT
    _totalEditingController50 = new TextEditingController(text: '0');
    _totalEditingController25 = new TextEditingController(text: '0');
    _totalEditingController15 = new TextEditingController(text: '0');
    _totauxEditingController = new TextEditingController(text: '0');
    _avanceEditingController = new TextEditingController(text: '0');

    _radioValue = 1;
    _handleRadioValueChange(_radioValue);
    echo = 'AVANCE';
  }

  @override
  Widget build(BuildContext context) {
    AllBar _bar = new AllBar(context);
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: _bar.myappBar(Colors.lightBlue, Colors.lightGreen.shade100,
          widget.title, Icons.home),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SafeArea(
              child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildPaddingRow1(),
//                  DATE DE LA COMMANDE
                buildPaddingRow2(context),
//                 TABLEAU POUR EDITER LA QUANTITÉ ACHETÉE
                _buildDataTable(),
//                  CALCUL ET AFFICHAGE DU PRIX TOTAL DES PRODUITS
                buildTotauxMontants(),
//                  CHOISIR LE TYPE DE RÈGLEMENT
                new Padding(padding: new EdgeInsets.all(5.0)),
                buildColumnTypeReglement(),
                buildBtnSave()
              ],
            ),
          )),
        ),
      ),
    );
  }

//  BOUTON D'ENREGISTREMENT
  RaisedButton buildBtnSave() {
    return RaisedButton(
      color: Colors.blue,
      elevation: 16,
      child: Text(
        'ENREGISTRER LA COMMANDE',
        style: TextStyle(
            fontSize: 24,
            fontFamily: 'Exo',
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        saveCommande();
      },
    );
  }

// LE TYPE DE RÈGLEMENT: CASH, AVANCE, CREDIT
  Column buildColumnTypeReglement() {
    return Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                new Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'CASH',
                  style: TextStyle(fontSize: 32, color: Colors.green.shade800),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'AVANCE',
                  style: TextStyle(fontSize: 32, color: Colors.orange),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'CREDIT',
                  style: TextStyle(fontSize: 32, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
        Center(
          child: echo == 'AVANCE'
              ? new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                        child: new Text('Entrer le montant avancé:',
                            style: TextStyle(
                                fontSize: 32, color: Colors.blueGrey))),
                    Flexible(
                        child: TextField(
                      onChanged: (value) {},
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32, color: Colors.black),
                      decoration: InputDecoration.collapsed(
                          hintText: '0000',
                          hintStyle: TextStyle(
                            fontSize: 32,
                          )),
                    ))
                  ],
                )
              : Text(''),
        )
      ],
    );
  }

//  BOUTON POUR AFFICHER LES TOTAUX DES SOMMES À PAYER
  Padding buildTotauxMontants() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
              onPressed: () {
                _onChangedTotaux(
                    _quantiteEditingController50.text,
                    _quantiteEditingController25.text,
                    _quantiteEditingController15.text);
                _onChanged_Q50(_quantiteEditingController50.text);
                _onChanged_Q25(_quantiteEditingController25.text);
                _onChanged_Q15(_quantiteEditingController15.text);
              },
              child: Text(
                'Afficher montant total',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    letterSpacing: 1.5,
                    fontSize: 24.0),
              )),
          Text(
            "$_totaux FCFA",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Exo',
                color: Colors.blueGrey.shade900,
                letterSpacing: 1.5,
                fontSize: 24.0),
          ),
        ],
      ),
    );
  }

//  TABLEAU RÉCAPITULATIF DES PRODUIT À CHOISIR
  Center _buildDataTable() {
    return Center(
      child: DataTable(columns: [
        DataColumn(
            label: Text(
          'Articles',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
        )),
        DataColumn(
            label: Text(
          'Prix',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
        )),
        DataColumn(
            label: Text(
          'Quantités',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
        )),
        DataColumn(
            label: Text(
          'Totaux',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
        )),
      ], rows: [
//                     ROW QUATITE 50
        DataRow(cells: [
          DataCell(Text(
            "AWA 50",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
          )),
          DataCell(
            TextFormField(
              controller: _prixEditingController50,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              decoration: InputDecoration(
                filled: true,
              ),
              textAlign: TextAlign.end,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              autovalidate: true,
            ),
          ),
          DataCell(ListTile(
            trailing: IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.red,
                  size: 48,
                ),
                onPressed: () {
                  _onChanged_Q50(_quantiteEditingController50.text);
                  _onChangedTotaux(
                      _quantiteEditingController50.text,
                      _quantiteEditingController25.text,
                      _quantiteEditingController15.text);
                }),
            title: Container(
              width: 100,
              child: TextFormField(
                controller: _quantiteEditingController50,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                decoration: InputDecoration(
                  filled: true,
                  //hintText: '____',
                ),
                textAlign: TextAlign.end,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                autovalidate: true,
              ),
            ),
          )),
          DataCell(Text(
            '$_valueAwa50 FCFA',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 18.0),
          )),
        ]),
        //                     ROW QUATITE 25
        DataRow(cells: [
          DataCell(Text(
            "AWA 25",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
          )),
          DataCell(
            TextFormField(
              controller: _prixEditingController25,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              decoration: InputDecoration(
                filled: true,
              ),
              textAlign: TextAlign.end,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              autovalidate: true,
            ),
          ),
          DataCell(ListTile(
            trailing: IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.red,
                  size: 48,
                ),
                onPressed: () {
                  _onChanged_Q25(_quantiteEditingController25.text);
                  _onChangedTotaux(
                      _quantiteEditingController50.text,
                      _quantiteEditingController25.text,
                      _quantiteEditingController15.text);
                }),
            title: Container(
              width: 100,
              child: TextFormField(
                controller: _quantiteEditingController25,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                decoration: InputDecoration(
                  filled: true,
                ),
                textAlign: TextAlign.end,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                autovalidate: true,
              ),
            ),
          )),
          DataCell(Text(
            '$_valueAwa25 FCFA',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 18.0),
          )),
        ]),
//                                          ROW QUATITE 15
        DataRow(cells: [
          DataCell(Text(
            "AWA 15",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
          )),
          DataCell(
            TextFormField(
              controller: _prixEditingController15,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              decoration: InputDecoration(
                filled: true,
              ),
              textAlign: TextAlign.end,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              autovalidate: true,
            ),
          ),
          DataCell(ListTile(
            trailing: IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.red,
                  size: 48,
                ),
                onPressed: () {
                  _onChanged_Q15(_quantiteEditingController15.text);
                  _onChangedTotaux(
                      _quantiteEditingController50.text,
                      _quantiteEditingController25.text,
                      _quantiteEditingController15.text);
                }),
            title: Container(
              width: 100,
              child: TextFormField(
                controller: _quantiteEditingController15,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                decoration: InputDecoration(
                  filled: true,
                ),
                textAlign: TextAlign.end,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                autovalidate: true,
              ),
            ),
          )),
          DataCell(Text(
            '$_valueAwa15 FCFA',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 18.0),
          )),
        ]),
      ]),
    );
  }

  //  NOMS ET TÉLÉPHONE DU CLIENT
  Padding buildPaddingRow1() {
    return Padding(
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
    );
  }

//  LIEU ET DATE DE LIVRAISON DE LA COMMANDE
  Padding buildPaddingRow2(BuildContext context) {
    return Padding(
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
                      onPressed: () {
                        _showDatePickerMethod(context);
                      })),
            ),
          ),
        ],
      ),
    );
  }

//  AFFICHER LE DIALOGUE DE SÉLECTION DE DATE
  Future _showDatePickerMethod(BuildContext context) async {
    DateTime newDateTime = await buildShowRoundedDatePicker(context);
    if (newDateTime != null) {
      String selectedDate = DateFormat.yMMMd().format(newDateTime);
      changeTheDate(selectedDate);
    }
  }

//  LA DATE À CHOISIR
  Future<DateTime> buildShowRoundedDatePicker(BuildContext context) {
    return showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 20,
    );
  }

//  CHANGEMENT DE LA VALEUR DU TYPE DE PAIEMENT: RADIO BUTTON
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          echo = 'CASH';
          break;
        case 1:
          echo = 'AVANCE';
          _onChangedTotaux(
              _quantiteEditingController50.text,
              _quantiteEditingController25.text,
              _quantiteEditingController15.text);
          break;
        case 2:
          echo = 'CREDIT';
          break;
      }

      print('echo: $echo');
    });
  }

// METHODE DE CALCULS DES SOMMES DES DIFFÉRENTS ARTICLES
  void _onChanged_Q50(String value) {
    int p1 = int.parse(_prixEditingController50.text);
    if (value.isEmpty) value = '0';
    setState(() {
      int val_50 = int.parse(value) * p1;
      _valueAwa50 = '$val_50';
    });
  }

  void _onChanged_Q25(String value) {
    int p2 = int.parse(_prixEditingController25.text);
    if (value.isEmpty) value = '0';
    setState(() {
      int val_50 = int.parse(value) * p2;
      _valueAwa25 = '$val_50';
    });
  }

  void _onChanged_Q15(String value) {
    int p3 = int.parse(_prixEditingController15.text);
    if (value.isEmpty) value = '0';
    setState(() {
      int val_50 = int.parse(value) * p3;
      _valueAwa15 = '$val_50';
    });
  }

//  CALCULER LES TOTAUX
  void _onChangedTotaux(String v1, String v2, String v3) {
    int p1, p2, p3;
    p1 = int.parse(_prixEditingController50.text);
    p2 = int.parse(_prixEditingController25.text);
    p3 = int.parse(_prixEditingController15.text);

    print('AVANT =>  v1=$v1 : v2=$v2 : v3=$v3');

    if (v1.isEmpty) {
      v1 = '0';
    }
    if (v2.isEmpty) {
      v2 = '0';
    }
    if (v3.isEmpty) {
      v3 = '0';
    }
    print('APRÈS =>   v1=$v1 : v2=$v2 : v3=$v3');
    setState(() {
      int total =
          (int.parse(v1) * p1) + (int.parse(v2) * p2) + (int.parse(v3) * p3);
      _totaux = '$total';
    });
  }

//  TODO: ENREGISTRER LA COMMANDE
  void saveCommande() {
    setState(() {
      String getName = _nameEditingController.text;
      String getAvance = _avanceEditingController.text;
      String getQuantite1 = _quantiteEditingController50.text;
      String getQuantite2 = _quantiteEditingController25.text;
      String getQuantite3 = _quantiteEditingController15.text;
      if (getAvance.isEmpty) {
        getAvance = '0';
      }

      int avance = int.parse(getAvance);
      int tot = int.parse(_totaux);

      if (getQuantite1.isNotEmpty ||
          getQuantite2.isNotEmpty ||
          getQuantite3.isNotEmpty) {
        switch (echo) {
          case 'CASH':
            print('CETTE COMMANDE EST PAYÉE EN CASH');
            break;
          case 'AVANCE':
            print('CETTE COMMANDE EST PAYÉE EN AVANCE');
            break;
          case 'CREDIT':
            print('CETTE COMMANDE EST À CRÉDIT');
            break;
        }
      }
    });
  }
}

//TODO
/*DataTable(
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
                                      _onChanged_Q50(_quantiteEditingController50.text);
                                    }),
                                    title: Container(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _quantiteEditingController50,
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
                                  DataCell(Text(_valueAwa50)),
                                ]))
                            .toList()),*/
