import 'package:ambrosino/UI/HOME/home.dart';
import 'package:ambrosino/tutorias/listview/gridListview.dart';
import 'package:ambrosino/tutorias/listview/home_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tutorias/listviewJson/listViewUI.dart';
import 'tutorias/radio_button.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        canvasColor: Colors.lightBlue.shade100,
        fontFamily: 'Ubuntu',
      ),
//      Je difinie ici mes différents chemin d'accès aux pages.
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/homelist': (context) => HomeList(),
        '/gridlist': (context) => GridListViewBuilder(),
        '/radioPage': (context) => RadioPage(),
        '/crudlistview': (context) => CRUDListView(),
      },
    );
  }
}
