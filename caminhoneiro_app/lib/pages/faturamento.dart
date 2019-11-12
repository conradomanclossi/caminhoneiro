// Package
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
// Pages
import 'package:caminhoneiro_app/pages/registro_page.dart';
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

class Faturamento extends StatefulWidget {
  @override
  _FaturamentoState createState() => _FaturamentoState();
}

class _FaturamentoState extends State<Faturamento> {
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
    return Stack(
      children: <Widget>[
        ListView.builder(
          padding: EdgeInsets.only(top: 150.0),
          itemCount: registros.length,
          itemBuilder: (context, index) {
            return _faturamentoCard(context, index);
          },
        ),

        /// Selector
        Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Container(
            height: 70.0,
            width: 10000,
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue[200],
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 5)),
                ]),
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.blue),
              child: Center(
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
            ),
          ),
        ),
      ],
    );
  }

  Widget _faturamentoCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _showRegistroPage(registro: registros[index]);
      },
      child: Container(
        height: 70.0,
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: registros[index].categoriaId == 1
                ? Colors.lightGreen
                : Colors.red,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: registros[index].categoriaId == 1
                    ? Colors.lightGreen[200]
                    : Colors.red[200],
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0, 5),
              )
            ]),
        child: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: FutureBuilder(
                future: helper.getCategoria(registros[index].categoriaId).then(
                  (list) {
                    return list.titulo;
                  },
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  return Text.rich(
                    TextSpan(
                      text: snapshot.data,
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: '\n${registros[index].titulo}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 80.0),
                child: Text.rich(
                  TextSpan(
                    text: 'R\$',
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0), // default text style
                    children: <TextSpan>[
                      TextSpan(
                          text: registros[index].valor.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRegistroPage({Registro registro}) async {
    final recRegistro = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddRegistro(
          registro: registro,
        ),
      ),
    );
    if (recRegistro != null) {
      if (registro != null) {
        await helper.updateRegistro(recRegistro);
      } else {
        await helper.saveRegistro(recRegistro);
      }
      _getAllRegistros();
    }
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
