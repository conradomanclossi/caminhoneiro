// Packages
import 'package:caminhoneiro_app/app/pages/home_page/components/item_widget.dart';
import 'package:caminhoneiro_app/app/pages/home_page/components/register_card.dart';
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

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
          return Observer(builder: (_) {
            return ListView.builder(
                itemCount: database.categorias.length,
                itemBuilder: (_, index) {
                  var item = database.categorias[index];
                  return ItemViagem(
                    item: item,
                    removeClicked: () {
                      database.deleteCategoria(item.id);
                    },
                  );
                });
          });
        },
      ),
    );
  }
}
