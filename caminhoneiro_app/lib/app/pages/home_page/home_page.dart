// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
// Data Base
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
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
    database.loadDataBase();
    return Container(
      margin: EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
          color: Color.fromRGBO(253, 191, 75, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Stack(
        children: <Widget>[
          Text("10/02/20"),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Observer(builder: (_) {
              return ListView.builder(
                  itemCount: database.registros.length,
                  itemBuilder: (_, index) {
                    return ItemHome(
                      registro: database.registros[index],
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
