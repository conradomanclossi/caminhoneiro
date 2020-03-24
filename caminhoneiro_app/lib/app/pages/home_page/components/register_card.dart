// Packages
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegisterCard extends StatelessWidget {
  final int index;
  final DataBase database;
  final Viagem registro;

  const RegisterCard({Key key, this.index, this.registro, this.database})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Registro _lastRemoved;
    return Container(
      margin: EdgeInsets.all(10),
      width: 10,
      height: 20,
      color: Colors.white,
      child: Text("ID: ${registro.id}, Saída: ${registro.saida}, Chegada: ${registro.chegada}"),
    );
  }
}
