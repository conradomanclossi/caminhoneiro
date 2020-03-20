// Packages
import 'package:caminhoneiro_app/pages/database.dart';
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Page
import 'package:caminhoneiro_app/pages/navigator.dart';
import 'package:provider/provider.dart';
// import 'package:caminhoneiro_app/pages/viagens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseHelper>(
          create: (_) => DatabaseHelper(),
        )
      ],
      child: MaterialApp(
        home: AppNavigator(),
      ),
    );
  }
}
