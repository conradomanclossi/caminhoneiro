import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataBase extends StatefulWidget {
  @override
  _DataBaseState createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  List<Viagem> viagens = List();
  List<Categoria> categorias = List();
  List<Registro> registros = List();

  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<DatabaseHelper>(context);

   

      helper.getAllViagens().then((list) {
        print(list);
      });

      helper.getAllCategorias().then((list) {
        print(list);
      });

      helper.getAllRegistros().then((list) {
        print(list);
      });
    

    return Container();
  }
}
