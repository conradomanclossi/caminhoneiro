import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/navigator.dart';

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


