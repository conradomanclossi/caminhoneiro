// Packages
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Controllers
import 'package:provider/provider.dart';
// Pages
import 'app/app_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<DataBase>(
      create: (_) => DataBase(),
      child: AppWidget(),
    );
  }
}
