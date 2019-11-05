import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppNavigator(),
    );
  }
}
