import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/navigator.dart';
import 'sqlite/database.dart';


void main() => runApp(MyApp());

String name_app = "Caminhoneiro";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name_app,
      home: AppNavigator(),
    );
  }
}


