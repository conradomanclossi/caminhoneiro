// Packages
import 'package:caminhoneiro_app/sqlite/controller/registro_controller.dart';
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
registroAdd(BuildContext context, {Registro registro}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddRegistro(
          registro: registro,
        );
      });
}

class AddRegistro extends StatefulWidget {
  final Registro registro;

  AddRegistro({this.registro});

  @override
  _AddRegistroState createState() => _AddRegistroState();
}

class _AddRegistroState extends State<AddRegistro> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    final registroController = Provider.of<RegistroController>(context);
    Registro _editedRegistro;
    Viagem viagem;
    Categoria categoria;
    DateTime date;
    final _tituloController = TextEditingController();
    final _valorController = TextEditingController();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    DateTime _dateTime;

    if (widget.registro != null) {
      _editedRegistro = widget.registro;
      viagem = database.getViagem(widget.registro.viagemId);
      categoria = database.getCategoria(widget.registro.categoriaId);
      _tituloController.text = widget.registro.titulo;
      _valorController.text = widget.registro.valor.toString();
      date = DateTime.parse(widget.registro.date);
    } else {
      registroController.registro = Registro();
      viagem = database.viagens[0];
      categoria = database.categorias[0];
      date = DateTime.now();
    }

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
                                  fontWeight: FontWeight.bold))),

                      // Viagem (Text)
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Viagem",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 20.0))),

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
                                    data: Theme.of(context).copyWith(
                                        canvasColor: Colors.lightGreen),
                                    child: DropdownButton<Viagem>(
                                        underline: SizedBox(),
                                        iconSize: 0,
                                        value: viagem,
                                        icon: Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        onChanged: (Viagem valueViagem) {
                                          setState(() {
                                            viagem = valueViagem;
                                          });
                                        },
                                        items: database.viagens
                                            .map<DropdownMenuItem<Viagem>>(
                                                (Viagem valueViagem) {
                                          return DropdownMenuItem<Viagem>(
                                              value: valueViagem != null
                                                  ? valueViagem
                                                  : null,
                                              child: Text(
                                                  dateFormat
                                                      .format(DateTime.parse(
                                                          valueViagem.saida))
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22)));
                                        }).toList())))
                          ])),

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
                                    data: Theme.of(context).copyWith(
                                        canvasColor: Colors.lightGreen),
                                    child: DropdownButton<Categoria>(
                                        underline: SizedBox(),
                                        iconSize: 0,
                                        value: categoria,
                                        icon: Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        onChanged: (Categoria valueCategoria) {
                                          setState(() {
                                            categoria = valueCategoria;
                                          });
                                        },
                                        items: database.categorias
                                            .map<DropdownMenuItem<Categoria>>(
                                                (Categoria valueCategoria) {
                                          return DropdownMenuItem<Categoria>(
                                              value: valueCategoria,
                                              child: Text(
                                                valueCategoria.titulo,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ));
                                        }).toList())))
                          ])),

                      // Data (Text)
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Data',
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
                          controller: _tituloController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Título"),
                          onChanged: (text) {
                            _editedRegistro.titulo = text;
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
                          controller: _valorController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Valor"),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          onChanged: (text) {
                            _editedRegistro.valor = double.parse(text);
                          },
                        ),
                      ),
                      
                      // Botões
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            // Salvar (Botão)
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: RaisedButton(
                                splashColor: Colors.green,
                                color: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () async {
                                  _editedRegistro.viagemId = viagem.id;
                                  _editedRegistro.categoriaId = categoria.id;
                                  _editedRegistro.date = _dateTime != null
                                      ? _dateTime.toString()
                                      : date.toString();
                                  _editedRegistro.id != null
                                      ? database.updateRegistro(_editedRegistro)
                                      : database.saveRegistro(_editedRegistro);
                                  Navigator.pop(context);
                                },
                                child: const Text('Salvar',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ),
                            ),

                            // Sair (Botão)
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: RaisedButton(
                                splashColor: Colors.redAccent,
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Sair',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ),
                            ),
                          ],
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
