// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
// Data Base
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
// Items
import 'package:caminhoneiro_app/app/pages/home_page/components/home_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    return Container(
      margin: EdgeInsets.only(top: 90),
      decoration: BoxDecoration(
          color: Color.fromRGBO(253, 191, 75, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Observer(builder: (_) {
        database.loadDataBase();
        return ListView.builder(
            itemCount: database.registros.length,
            itemBuilder: (_, index) {
              Registro item = database.registros[index];
              return ItemHome(
                registro: item,
              );
            });
      }),
    );
  }
}
