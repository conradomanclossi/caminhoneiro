// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Controllers
import 'package:provider/provider.dart';
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:caminhoneiro_app/sqlite/controller/registro_controller.dart';
import 'package:caminhoneiro_app/sqlite/controller/viagem_controller.dart';
// Pages
import 'app/app_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DataBase>(create: (_) => DataBase()),
        Provider(create: (_) => ViagemController()),
        Provider(create: (_) => RegistroController()),
      ],
      child: AppWidget(),
    );
  }
}
