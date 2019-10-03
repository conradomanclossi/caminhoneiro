import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
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

  // Controladores
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
      });
    });

    helper.getAllViagens().then((list) {
      setState(() {
        viagens = list;
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
            if (_editedRegistro.titulo != null &&
                _editedRegistro.titulo.isNotEmpty) {
              Navigator.pop(context, _editedRegistro);
              helper.saveRegistro(_editedRegistro);
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
              SizedBox(
                width: 500.0,
                child: DropdownButton<Viagem>(
                  hint: Text(viagens.last.saida.toString()),
                  items: viagens.map<DropdownMenuItem<Viagem>>((Viagem viagem) {
                    return DropdownMenuItem<Viagem>(
                      value: viagem,
                      child: Text(_editedRegistro.viagemId != null
                          ? viagem.saida
                          : viagens.last.saida.toString()),
                    );
                  }).toList(),
                  onChanged: (viagem) {
                    _registroEdited = true;
                    _editedRegistro.viagemId = 1;
                    print(_selectedViagem.id);
                    setState(() {
                      _selectedViagem = viagem;
                    });
                  },
                  value: _selectedViagem,
                ),
              ),
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
                        hint: Text(categorias.last.titulo.toString()),
                        items: categorias.map<DropdownMenuItem<Categoria>>(
                            (Categoria categoria) {
                          return DropdownMenuItem<Categoria>(
                            value: categoria,
                            child: Text(categoria.titulo),
                          );
                        }).toList(),
                        onChanged: (categoria) {
                          _registroEdited = true;
                          _editedRegistro.categoriaId = 1;
                          print(_selectedCategoria.id);
                          setState(() {
                            _selectedCategoria = categoria;
                          });
                        },
                        value: _selectedCategoria,
                      );
                    return DropdownButton<Categoria>(
                      hint: Text(_editedRegistro.categoriaId != null
                          ? snapshot.data
                          : categorias.last.titulo.toString()),
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
              /*GestureDetector(
              onTap: () {
                if (_editedRegistro.titulo != null &&
                    _editedRegistro.titulo.isNotEmpty) {
                  Navigator.pop(context, _editedRegistro);
                } else {
                  FocusScope.of(context).requestFocus(_tituloFocus);
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 25.0, bottom: 15.0),
                height: 60,
                width: 1000,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.orange[200],
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                        offset: Offset(0, 5))
                  ],
                ),
                child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Salvar',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    )),
              ),
            ),*/
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
