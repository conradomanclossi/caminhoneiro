// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Page
// import 'package:caminhoneiro_app/pages/navigator.dart';
import 'package:caminhoneiro_app/pages/viagens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Viagens(),
    );
  }
}
