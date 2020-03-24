// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
// DataBase
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

class AddRegistro extends StatefulWidget {
  final Registro registro;

  AddRegistro({this.registro});

  @override
  _AddRegistroState createState() => _AddRegistroState();
}

class _AddRegistroState extends State<AddRegistro> {
  /// Database
  DatabaseHelper helper = DatabaseHelper();
  List<Categoria> categorias = List();
  List<Viagem> viagens = List();

  /// Controladores
  Viagem _selectedViagem;
  Categoria _selectedCategoria;
  final _tituloController = TextEditingController();
  final _valorController = TextEditingController();
  final _dataController = TextEditingController();

  // Focus
  final _tituloFocus = FocusNode();

  // Bool
  bool _registroEdited = false;

  Registro _editedRegistro;

  String lastViagem;
  String lastCategoria;

  @override
  void initState() {
    super.initState();
    if (widget.registro == null) {
      _editedRegistro = Registro();
    } else {
      _editedRegistro = Registro.fromMap(widget.registro.toMap());
      _tituloController.text = _editedRegistro.titulo;
      _valorController.text = _editedRegistro.valor.toString();
      _dataController.text = _editedRegistro.date;
    }

    helper.getAllCategorias().then((list) {
      setState(() {
        categorias = list;
        lastCategoria = categorias.last.titulo.toString();
      });
    });

    helper.getAllViagens().then((list) {
      setState(() {
        viagens = list;
        lastViagem = viagens.last.saida.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registro"),
          backgroundColor: Colors.lightGreen,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          onPressed: () {
            if (_editedRegistro.viagemId == null) {
              _editedRegistro.viagemId = viagens.last.id;
            }
            if (_editedRegistro.categoriaId == null) {
              _editedRegistro.categoriaId = categorias.last.id;
            }
            if (_editedRegistro.titulo != null &&
                _editedRegistro.titulo.isNotEmpty &&
                _editedRegistro.id == null) {
              Navigator.pop(context, _editedRegistro);
              helper.saveRegistro(_editedRegistro);
            } else if (_editedRegistro.id != null) {
              Navigator.pop(context, _editedRegistro);
              helper.updateRegistro(_editedRegistro);
            } else {
              FocusScope.of(context).requestFocus(_tituloFocus);
            }
          },
          child: Icon(Icons.save),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              /// Viagem Título
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Viagem",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),

              /// Viagem Selector
              SizedBox(
                  width: 500.0,
                  child: FutureBuilder(
                    future:
                        helper.getViagem(_editedRegistro.viagemId).then((list) {
                      return list.saida;
                    }),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return DropdownButton<Viagem>(
                          hint: Text(lastViagem.toString()),
                          items: viagens
                              .map<DropdownMenuItem<Viagem>>((Viagem viagem) {
                            return DropdownMenuItem<Viagem>(
                              value: viagem,
                              child: Text(viagem.saida.toString()),
                            );
                          }).toList(),
                          onChanged: (viagem) {
                            _registroEdited = true;
                            setState(() {
                              _editedRegistro.viagemId = 1;
                              _selectedViagem = viagem;
                            });
                          },
                          value: _selectedViagem,
                        );
                      return DropdownButton<Viagem>(
                        hint: Text(_editedRegistro.viagemId.toString() != null
                            ? snapshot.data
                            : lastViagem.toString()),
                        items: viagens
                            .map<DropdownMenuItem<Viagem>>((Viagem viagem) {
                          return DropdownMenuItem<Viagem>(
                            value: viagem,
                            child: Text(viagem.saida.toString()),
                          );
                        }).toList(),
                        onChanged: (viagem) {
                          setState(() {
                            _selectedViagem = viagem;
                            _editedRegistro.viagemId = _selectedViagem.id;
                          });
                        },
                      );
                    },
                  )),

              /// Categoria Titulo
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Categoria",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),

              /// Categoria Selector
              SizedBox(
                width: 500.0,
                child: FutureBuilder(
                  future: helper
                      .getCategoria(_editedRegistro.categoriaId)
                      .then((list) {
                    return list.titulo;
                  }),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return DropdownButton<Categoria>(
                        hint: Text(lastCategoria.toString()),
                        items: categorias.map<DropdownMenuItem<Categoria>>(
                            (Categoria categoria) {
                          return DropdownMenuItem<Categoria>(
                            value: categoria,
                            child: Text(categoria.titulo),
                          );
                        }).toList(),
                        onChanged: (categoria) {
                          _registroEdited = true;
                          setState(() {
                            _editedRegistro.categoriaId = 1;
                            _selectedCategoria = categoria;
                          });
                        },
                        value: _selectedCategoria,
                      );
                    return DropdownButton<Categoria>(
                      hint: Text(_editedRegistro.categoriaId != null
                          ? snapshot.data
                          : lastCategoria.toString()),
                      items: categorias.map<DropdownMenuItem<Categoria>>(
                          (Categoria categoria) {
                        return DropdownMenuItem<Categoria>(
                          value: categoria,
                          child: Text(categoria.titulo),
                        );
                      }).toList(),
                      onChanged: (categoria) {
                        setState(() {
                          _selectedCategoria = categoria;
                          _editedRegistro.categoriaId = _selectedCategoria.id;
                        });
                      },
                      value: _selectedCategoria,
                    );
                  },
                ),
              ),

              /// Titulo titulo
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Titulo",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),

              /// Titulo Selector
              Container(
                child: TextField(
                  controller: _tituloController,
                  focusNode: _tituloFocus,
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    _registroEdited = true;
                    setState(() {
                      _editedRegistro.titulo = text;
                    });
                  },
                ),
              ),

              /// Valor titulo
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Valor",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),

              /// Valor Selector
              Container(
                child: TextField(
                  controller: _valorController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor',
                  ),
                  onChanged: (text) {
                    _registroEdited = true;
                    setState(() {
                      _editedRegistro.valor = double.parse(text);
                    });
                  },
                  keyboardType: TextInputType.number,
                ),
              ),

              /// Data titulo
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Data",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),

              /// Data selector
              Container(
                child: TextField(
                  controller: _dataController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Data',
                  ),
                  onChanged: (text) {
                    _registroEdited = true;
                    setState(() {
                      _editedRegistro.date = text;
                    });
                  },
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_registroEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
