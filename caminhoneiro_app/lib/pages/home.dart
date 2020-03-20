import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  ///Database
  DatabaseHelper helper = DatabaseHelper();
  List<Viagem> viagens = List();
  List<Categoria> categorias = List();
  List<Registro> registros = List();

  Viagem _selectedViagem;
  Viagem viagem;
  String last;

  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    _getAllRegistros();

    helper.getAllViagens().then((list) async {
      viagens = list;
      last = dateFormat.format(DateTime.parse(viagens.last.saida));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Color.fromRGBO(253, 191, 75, 1),
      ),
      child: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Color.fromRGBO(253, 191, 75, 1)),
        child: Column(
          children: <Widget>[
            Center(
              child: DropdownButton<Viagem>(
                underline: SizedBox(),
                iconEnabledColor: Colors.white,
                iconSize: 0,
                hint: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ),
                    Text(last.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                  ],
                ),
                items: viagens.map<DropdownMenuItem<Viagem>>((Viagem viagem) {
                  return DropdownMenuItem<Viagem>(
                    value: viagem,
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                                dateFormat
                                    .format(DateTime.parse(viagem.saida))
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0)),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (viagem) {
                  setState(() {
                    _selectedViagem = viagem;
                    _getAllRegistros();
                  });
                },
                value: _selectedViagem,
              ),
            ),
            Container(width: 100, height: 100, color: Colors.black)
          ],
        ),
      ),
    );
  }

  void _getAllRegistros() async {
    if (_selectedViagem == null) {
      await helper.getAllRegistros().then((list) {
        setState(() {
          registros = list;
        });
      });
    } else {
      await helper.selectRegistro(_selectedViagem.id).then((list) {
        setState(() {
          registros = list;
        });
      });
    }
  }
}
