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
  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

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
    _globalKey = new GlobalKey<FormState>();
    _nameEditingController = new TextEditingController();
    _phoneEditingController = new TextEditingController();
    _lieuEditingController = new TextEditingController();
    _dateEditingController = new TextEditingController();
    _quantiteEditingController = new TextEditingController();
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
                  Center(
                    child: DataTable(
                        sortColumnIndex: 0,
                        sortAscending: true,
                        columns: [
                          DataColumn(label: Text('Articles')),
                          DataColumn(label: Text('Prix Unitaire')),
                          DataColumn(label: Text('Quantité achetée')),
                          DataColumn(label: Text('Totaux montants')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('gggjjj')),
                            DataCell(Center(child: Text('gggjjj'))),
                            DataCell(Center(child: Text('gggjjj'))),
                            DataCell(Center(child: Text('gggjjj'))),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('$_value')),
                            DataCell(Text('$_value')),
                            DataCell(Text('$_value')),
                            DataCell(
                              ListTile(
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 48,
                                  ),
                                  onPressed: () {
                                    String value =
                                        _quantiteEditingController.value.text;
                                    _onChanged(value);
                                  },
                                ),
                              ),
                            ),
                          ]),
                        ]),
                  )
                ],
              ),
            )),
          )),
    );
  }

  GridTile _gridTile;

  String _value;

  void _onChanged(String value) {
    setState(() {
      int val = int.parse(value) * 10;
      _value = '$val';
    });
  }

//  TODO JSON @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
