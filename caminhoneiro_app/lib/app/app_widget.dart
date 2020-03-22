// Packages
import 'package:caminhoneiro_app/app/pages/home_page/home_page.dart';
import 'package:caminhoneiro_app/app/pages/home_page/old.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pages
import 'navigator.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Caminhoneiro App",
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        initialRoute: '/',
        routes: {
          '/': (context) => NavigatorApp(),
          '/second': (context) => HomePage()
        });
  }
}
