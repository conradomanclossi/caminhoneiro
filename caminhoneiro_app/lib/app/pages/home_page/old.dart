// Packages
import 'package:caminhoneiro_app/app/pages/home_page/home_controller.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pages

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

//import 'components/dialog.dart';
import 'components/item_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();
  DateTime date = DateTime.now();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  DateFormat dateSave = DateFormat('yyyy-MM-dd');

  List<Viagem> teste;

  @override
  void initState() {
    super.initState();
    controller.loadDataBase();
  }

  _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          Viagem v = Viagem();
          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              onChanged: (text) => v.saida = text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Novo item",
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    controller.saveViagem(v);
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")),
              FlatButton(onPressed: () {}, child: Text("Cancelar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          // onChanged: controller.setFilter,
          decoration: InputDecoration(hintText: "Pesquisa..."),
        ),
        actions: <Widget>[
          IconButton(
              icon: Observer(builder: (_) {
                return Text("teste");
              }),
              onPressed: () {})
        ],
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: controller.viagens.length,
            itemBuilder: (_, index) {
              var item = controller.viagens[index];
              return ItemViagem(
                  item: item,
                  removeClicked: () {
                    controller.deleteViagem(item.id);
                  });
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialog();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
