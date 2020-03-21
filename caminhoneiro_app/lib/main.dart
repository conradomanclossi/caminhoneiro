// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// Controllers
import 'controllers/database_controller.dart';
// Pages
import 'app/app_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {
        Provider<DataBase>(
          create: (_) => DataBase(),
        );
      },
      child: AppWidget(),
    );
  }
}
