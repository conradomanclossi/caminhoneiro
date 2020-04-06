// Packages
import 'package:caminhoneiro_app/app/add_pop_up/add_pop_up_viagen.dart';
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DropdownViagem extends StatelessWidget {
  final Viagem viagem;

  const DropdownViagem({Key key, this.viagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    Viagem newViagem;

    return StatefulBuilder(builder: (context, setState) {
      return Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.lightGreen),
          child: DropdownButton<Viagem>(
              underline: SizedBox(),
              iconSize: 0,
              value: viagem,
              elevation: 16,
              icon: Icon(Icons.arrow_downward),
              onChanged: (Viagem valueViagem) {
                setState(() {
                  newViagem = valueViagem;
                });
              },
              items: database.viagens
                  .map<DropdownMenuItem<Viagem>>((Viagem valueViagem) {
                return DropdownMenuItem<Viagem>(
                    value: valueViagem,
                    child: Text(
                      dateFormat
                          .format(DateTime.parse(valueViagem.saida))
                          .toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ));
              }).toList()));
    });
  }
}
