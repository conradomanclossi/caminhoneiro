// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// Data Base
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
// Element
import 'package:caminhoneiro_app/app/elements/principal_element.dart';


// Registro Add
registroAdd(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddRegistro();
      });
}

class AddRegistro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    Registro registro = Registro();
    Viagem viagem = database.viagens.last;
    Categoria categoria = database.categorias.last;
    DateTime date = DateTime.now();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    DateTime _dateTime;

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        child: Scaffold(
          backgroundColor: Color(0xFFFFFF),
          body: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      // Adicionar registro (Title)
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text("Adicionar um registro",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      // Viagem (Text)
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Viagem",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      // Viagem (Selector list)
                      PrincipalElement(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Theme(
                                  data: Theme.of(context)
                                      .copyWith(canvasColor: Colors.lightGreen),
                                  child: DropdownButton<Viagem>(
                                    underline: SizedBox(),
                                    iconSize: 0,
                                    value: viagem,
                                    icon: Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    onChanged: (value) {
                                      setState(() {
                                        viagem = value;
                                      });
                                    },
                                    items: database.viagens
                                        .map<DropdownMenuItem<Viagem>>(
                                            (Viagem value) {
                                      return DropdownMenuItem<Viagem>(
                                        value: value,
                                        child: Text(
                                          dateFormat
                                              .format(
                                                  DateTime.parse(value.saida))
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      // Categoria (Text)
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Categoria",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      // Categoria (Selector list)
                      PrincipalElement(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Theme(
                                  data: Theme.of(context)
                                      .copyWith(canvasColor: Colors.lightGreen),
                                  child: DropdownButton<Categoria>(
                                    underline: SizedBox(),
                                    iconSize: 0,
                                    value: categoria,
                                    icon: Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    onChanged: (value) {
                                      setState(() {
                                        categoria = value;
                                      });
                                    },
                                    items: database.categorias
                                        .map<DropdownMenuItem<Categoria>>(
                                            (Categoria value) {
                                      return DropdownMenuItem<Categoria>(
                                        value: value,
                                        child: Text(
                                          value.titulo,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      // Data de chegada (Text)
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Data de Chegada',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      // Selector de chegada (Date picker)
                      PrincipalElement(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime,
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2021))
                              .then((date) {
                            setState(() {
                              _dateTime = date;
                            });
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                dateFormat
                                    .format(
                                        _dateTime == null ? date : _dateTime)
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Título (Text)
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Título",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      // Título (Text Field)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Título"),
                          onChanged: (text) {
                            registro.titulo = text;
                          },
                        ),
                      ),
                      // Valor (Text)
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Valor",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      // Valor (Text Field)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Valor"),
                          onChanged: (text) {
                            registro.valor = double.parse(text);
                          },
                        ),
                      ),
                      // Salvar (Botão)
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                        child: RaisedButton(
                          splashColor: Colors.green,
                          color: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPressed: () async {
                            registro.viagemId = viagem.id;
                            registro.categoriaId = categoria.id;
                            registro.date = _dateTime != null
                                ? _dateTime.toString()
                                : date.toString();
                            database.saveRegistro(registro);
                            Navigator.pop(context);
                          },
                          child: const Text('Salvar',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      );
    });
  }
}
