import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

class VenteCaissePage extends StatefulWidget {
  final String title;

  VenteCaissePage(this.title);

  @override
  _VenteCaissePageState createState() => _VenteCaissePageState();
}

class _VenteCaissePageState extends State<VenteCaissePage> {
//  CONVERSION DE LA DATE
  String date1 ,date2 = DateFormat.yMMMd().format(DateTime.now());

  void changeTheDate1(String date) {
    print(date);
    setState(() {
      date1 = date;
    });
  }void changeTheDate2(String date) {
    print(date);
    setState(() {
      date2 = date;
    });
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Du    ",style: TextStyle(
                          fontFamily: 'Exo',fontSize: 32,color: Colors.black,fontWeight: FontWeight.bold
                      ),),
                      Flexible(
                        child: TextFormField(
                          onTap: () => _showDatePickerMethod1(context),
                          style: TextStyle(
                              fontFamily: 'Exo',fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            hintText: '$date1',
                            filled: true,suffixIcon: Icon(Icons.date_range,color: Colors.deepPurple,)
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text("au   ",style:TextStyle(
                            fontFamily: 'Exo',fontSize: 32,color: Colors.black,fontWeight: FontWeight.bold
                        )),
                      ),
                      Flexible(
                        child: TextFormField(
                          onTap: () => _showDatePickerMethod2(context),
                          style: TextStyle(
                              fontFamily: 'Exo',fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                              hintText: '$date2',
                              filled: true,suffixIcon: Icon(Icons.date_range,color: Colors.deepPurple,)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                DataTable(columns: [
                  DataColumn(
                      label: Text(
                    'Articles',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  )),
                  DataColumn(
                      label: Text(
                    'Prix',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  )),
                  DataColumn(
                      label: Text(
                    'Quantités',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  )),
                  DataColumn(
                      label: Text(
                    'Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  )),
                ], rows: [
//                     ROW QUATITE 50
                  DataRow(cells: [
                    DataCell(Text(
                      "AWA 50",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "400",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "2755",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "1102000",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      "AWA 25",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "600",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "1030",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "618000",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      "AWA 15",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "300",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "0",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "0",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.5),
                    )),
                    DataCell(Text(
                      "Totaux",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 33.5,
                      ),
                    )),
                    DataCell(Text(
                      "3785 paquets",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 33.5,
                          backgroundColor: Colors.grey.shade400,
                          color: Colors.deepOrange.shade900),
                    )),
                    DataCell(Text(
                      "1720000 FCFA",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 33.5,
                          backgroundColor: Colors.grey.shade400,
                          color: Colors.deepOrange.shade900),
                    )),
                  ]),
                ]),
              ],
            ),
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
