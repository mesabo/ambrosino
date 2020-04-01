import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

class ComptabilitePageView extends StatefulWidget {
  ComptabilitePageView({
    Key key,
  }) : super(key: key);

  @override
  _ComptabilitePageViewState createState() => _ComptabilitePageViewState();
}

class _ComptabilitePageViewState extends State<ComptabilitePageView> {
  //  CONVERSION DE LA DATE
  String date1, date2;

  static var now = new DateTime.now();
  var sixtyDaysFromNow = now.subtract(new Duration(days: 6));

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

  @override
  void initState() {
    date2 = DateFormat.yMMMd().format(DateTime.now());
    date1 = DateFormat.yMMMd().format(sixtyDaysFromNow);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
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
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0),
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
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "COMMANDE AVANCÉE:",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          letterSpacing: 3,
                          wordSpacing: 10,
                          fontFamily: 'Exo',
                          fontSize: 24,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Text(
                      "100000 FCFA",
                      style: TextStyle(
                          fontFamily: 'Exo',
                          letterSpacing: 3,
                          fontSize: 32,
                          color: Colors.blueGrey,
                          wordSpacing: 3,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0),
              child: DataTable(columns: [
                DataColumn(
                    label: Text(
                  "ACTIVITES RÉALISÉES",
                  style: TextStyle(
                      letterSpacing: 3,
                      wordSpacing: 10,
                      fontFamily: 'Exo',
                      fontSize: 24,
                      color: Colors.blueGrey.shade900,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "MONTANTS RELATIFS",
                  style: TextStyle(
                      letterSpacing: 3,
                      wordSpacing: 10,
                      fontFamily: 'Exo',
                      fontSize: 24,
                      color: Colors.blueGrey.shade900,
                      fontWeight: FontWeight.bold),
                )),
              ], rows: [
                DataRow(
                  cells: [
                    DataCell(Text(
                      "VENTES:",
                      style: TextStyle(
                          letterSpacing: 3,
                          wordSpacing: 10,
                          fontFamily: 'Exo',
                          decoration: TextDecoration.underline,
                          fontSize: 24,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(
                      "350000 FCFA",
                      style: TextStyle(
                          letterSpacing: 3,
                          wordSpacing: 10,
                          fontFamily: 'Exo',
                          fontSize: 24,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text(
                      "DEPENSES:",
                      style: TextStyle(
                          letterSpacing: 3,
                          wordSpacing: 10,
                          fontFamily: 'Exo',
                          decoration: TextDecoration.underline,
                          fontSize: 24,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(
                      "43000 FCFA",
                      style: TextStyle(
                          letterSpacing: 3,
                          wordSpacing: 10,
                          fontFamily: 'Exo',
                          fontSize: 24,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text(
                      "TOTAUX:",
                      style: TextStyle(
                          letterSpacing: 3,
                          wordSpacing: 10,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Exo',
                          fontSize: 24,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(
                      "307000 FCFA",
                      style: TextStyle(
                          letterSpacing: 3,
                          wordSpacing: 10,
                          fontFamily: 'Exo',
                          fontSize: 24,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text(
                      "",
                    )),
                    DataCell(Text("")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text(
                      "COMPTE FINAL:",
                      style: TextStyle(
                          letterSpacing: 3,
                          wordSpacing: 10,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Exo',
                          fontSize: 24,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(
                      "450000 FCFA",
                      style: TextStyle(
                          letterSpacing: 3,
                          wordSpacing: 10,
                          fontFamily: 'Exo',
                          fontSize: 24,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ]),
            )
          ],
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
