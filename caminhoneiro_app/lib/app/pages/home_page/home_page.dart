// Packages
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'components/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      child: FutureBuilder(
        future: database.loadDataBase(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Observer(builder: (_) {
              return ListView.builder(
                  itemCount: database.viagens.length,
                  itemBuilder: (_, index) {
                    var item = database.viagens[index];
                    return ItemViagem(
                        item: item,
                        removeClicked: () {
                          database.deleteViagem(item.id);
                        });
                  });
            });
        },
      ),
    );
  }
}
