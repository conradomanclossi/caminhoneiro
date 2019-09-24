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
  final _tituloFocus = FocusNode();

  // Bool
  bool _registroEdited = false;
  Registro _editedRegistro;

  @override
  void initState() {
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
    return MaterialApp(
      title: "Registro",
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
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
                    setState(() {
                      _selectedViagem = viagem;
                      _editedRegistro.viagemId = _selectedViagem.id;
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
                          setState(() {
                            _selectedCategoria = categoria;
                            _editedRegistro.categoriaId = _selectedCategoria.id;
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
                    border: OutlineInputBorder(),
                    labelText: 'Titulo',
                  ),
                  onChanged: (text) {
                    _registroEdited = true;
                    _editedRegistro.titulo = text;
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
                    _editedRegistro.valor = double.parse(text);
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
                    _editedRegistro.date = text;
                  },
                  keyboardType: TextInputType.datetime,
                ),
              ),
              GestureDetector(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
