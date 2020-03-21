import 'package:caminhoneiro_app/controllers/database_controller.dart';
import 'package:caminhoneiro_app/controllers/item_viagem_model.dart';
import 'package:caminhoneiro_app/pages/elements/viagem_widget.dart';
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sqflite/sqlite_api.dart';

class DataBaseTest extends StatefulWidget {
  @override
  _DataBaseTestState createState() => _DataBaseTestState();
}

class _DataBaseTestState extends State<DataBaseTest> {
  final controller = DataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataBase"),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: controller.viagens.length,
              itemBuilder: (_, index) {
                var item = controller.viagens[index];
                return ItemViagem(item: item);
              });
        },
      ),
    );
  }
}
