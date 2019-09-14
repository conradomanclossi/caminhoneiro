import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/navigation.dart';

void main() => runApp(MyApp());

String name_app = "Caminhoneiro";

/// Essa Widget é a aplicação principal.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name_app,
      home: AppNavigation(),
    );
  }
}
