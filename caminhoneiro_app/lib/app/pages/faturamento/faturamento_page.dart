// Packages
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FaturamentoPage extends StatefulWidget {
  @override
  _FaturamentoPageState createState() => _FaturamentoPageState();
}

class _FaturamentoPageState extends State<FaturamentoPage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    database.loadDataBase();
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Observer(builder: (_) {
        return ListView.builder(
          itemCount: database.viagens.length,
          itemBuilder: (_, index) {
            return Text("${database.viagens[index]}");
          },
        );
      }),
    );
  }
}
