import 'package:caminhoneiro_app/pages/initial_configuration.dart';
import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/navigator.dart';

import 'package:caminhoneiro_app/pages/registro_page.dart';


void main() => runApp(MyApp());

String name_app = "Caminhoneiro";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialConfiguration(),
    );
  }
}


