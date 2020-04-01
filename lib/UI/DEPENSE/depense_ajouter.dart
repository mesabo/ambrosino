import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

class DepenseCRUDPage extends StatefulWidget {
  @override
  _DepenseCRUDPageState createState() => _DepenseCRUDPageState();
}

class _DepenseCRUDPageState extends State<DepenseCRUDPage> {
//  CONVERSION DE LA DATE
  String date1, date2, dateT;

  void changeTheDate1(String date) {
    print(date);
    setState(() {
      date1 = date;
    });
  }

  void changeTheDate2(String date) {
    print(date);
    setState(() {
      date2 = date;
    });
  }

  void changeTheDateT(String date) {
    print(date);
    setState(() {
      dateT = date;
    });
  }

  @override
  void initState() {
    date1 = DateFormat.yMMMd().format(DateTime.now());
    date2 = DateFormat.yMMMd().format(DateTime.now());
    dateT = DateFormat.yMMMd().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: Text(
                    'REMPLIR LES CHAMPS POUR ENREGISTRER UNE DEPENSE',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Exo',
                      fontSize: 24,
                      height: 1.5,
                      backgroundColor: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
//              SAISIE DES DONNÉES
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  SAISIR DATE
                  SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            'Date du jour',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Exo',
                                fontSize: 24,
                                height: 1.5),
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          child: TextField(
                            onTap: () => _showDatePickerMethod(context),
                            style: TextStyle(
                                fontFamily: 'Exo',
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                hintText: '$dateT',
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.date_range,
                                  color: Colors.deepPurple,
                                )),
                          ),
                          flex: 5,
                        ),
                      ],
                    ),
//                    flex: 2,
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            'Désignation',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Exo',
                                fontSize: 24,
                                height: 1.5),
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          child: TextField(
                            style: TextStyle(
                                fontFamily: 'Exo',
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.justify,
                            decoration: InputDecoration(
                                hintText: 'ex: Frais de route',
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.text_format,
                                  color: Colors.deepPurple,
                                )),
                          ),
                          flex: 5,
                        ),
                      ],
                    ),
//                    flex: 3,
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            'Montant depensé',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Exo',
                                fontSize: 24,
                                height: 1.5),
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          child: TextField(
                            style: TextStyle(
                                fontFamily: 'Exo',
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.justify,
                            decoration: InputDecoration(
                                hintText: 'ex: 2 0 0 0',
                                suffixText: 'FCFA',
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.attach_money,
                                  color: Colors.deepPurple,
                                )),
                          ),
                          flex: 5,
                        ),
                      ],
                    ),
//                    flex: 4,
                  ),
                  SizedBox(
                    width: 50.0,
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                child: Text('AJOUTER',
                    style: TextStyle(fontFamily: 'Exo', fontSize: 32)),
                onPressed: (){
                  print('ENREGISTRER');
                },
              ),
              SizedBox(
                height: 20.0,
              ),

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(
                        height: 50,
                        color: Colors.black,
                      ),
                    ),
//                    DATE 9DE CONSULTATION PAR INTERVALLE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 50.0,
                        ),
                        Text(
                          "Du    ",
                          style: TextStyle(
                              fontFamily: 'Exo',
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: TextFormField(
                            onTap: () => _showDatePickerMethod1(context),
                            style: TextStyle(
                                fontFamily: 'Exo',
                                fontSize: 22,
                                letterSpacing: 3,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                hintText: '$date1',
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 5.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 5.0),
                                ),
                                suffixIcon: Icon(
                                  Icons.date_range,
                                  color: Colors.deepPurple,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 100.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text("au   ",
                              style: TextStyle(
                                  fontFamily: 'Exo',
                                  letterSpacing: 3,
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Flexible(
                          child: TextFormField(
                            onTap: () => _showDatePickerMethod2(context),
                            style: TextStyle(
                                fontFamily: 'Exo',
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                hintText: '$date2',
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 5.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 5.0),
                                ),
                                suffixIcon: Icon(
                                  Icons.date_range,
                                  color: Colors.deepPurple,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 100.0,
                        ),
                      ],
                    ),
//                    DISPOSITION DES DEPENSES EN TABLEAU
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        sortAscending: true,
                        sortColumnIndex: 0,
                        columns: [
                          DataColumn(
                            label: Text('N°'),
                          ),
                          DataColumn(
                            label: Text('DESIGNATION'),
                          ),
                          DataColumn(
                            label: Text('MONTANT(FCFA)'),
                          ),
                          // Lets add one more column to show a delete button
                          DataColumn(
                            label: Text('DATE DEPENSE'),
                          ),
                          DataColumn(
                            label: Text('DATE MODIFICATION'),
                          ),
                          DataColumn(
                            label: Text(
                              'ACTION',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('01')),
                              DataCell(Text('Frais de route')),
                              DataCell(Text(
                                '2000',
                                style: TextStyle(
                                  letterSpacing: 3,
                                ),
                              )),
                              DataCell(Text('01-04-2020')),
                              DataCell(Text('01-04-2020')),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.more_horiz,
                                            color: Colors.lightBlue),
                                        onPressed: () {
//                                  todo
                                          print('View data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
//                                  todo
                                          print('edit data');
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
//                                  todo
                                          print('delete data');
                                        }),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//  METHODES

//  AFFICHER LE DIALOGUE DE SÉLECTION DE DATE
  Future _showDatePickerMethod1(BuildContext context) async {
    DateTime newDateTime = await buildShowRoundedDatePicker(context);
    if (newDateTime != null) {
      String selectedDate = DateFormat.yMMMd().format(newDateTime);
      changeTheDate1(selectedDate);
    }
  }

  Future _showDatePickerMethod2(BuildContext context) async {
    DateTime newDateTime = await buildShowRoundedDatePicker(context);
    if (newDateTime != null) {
      String selectedDate = DateFormat.yMMMd().format(newDateTime);
      changeTheDate2(selectedDate);
    }
  }

  Future _showDatePickerMethod(BuildContext context) async {
    DateTime newDateTime = await buildShowRoundedDatePicker(context);
    if (newDateTime != null) {
      String selectedDate = DateFormat.yMMMd().format(newDateTime);
      changeTheDateT(selectedDate);
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
}
