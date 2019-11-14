// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
// Pages
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

class Viagens extends StatefulWidget {
  @override
  _ViagensState createState() => _ViagensState();
}

class _ViagensState extends State<Viagens> {
  ///Database
  DatabaseHelper helper = DatabaseHelper();
  List<Viagem> viagens = List();
  List<Categoria> categorias = List();

  ///Last removed
  Viagem lastRemoved = Viagem();

  ///Date
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  @override
  void initState() {
    super.initState();

    ///Get all Viagens
    helper.getAllViagens().then((list) {
      setState(() {
        viagens = list;
      });
    });

    ///Get all Categorias
    helper.getAllCategorias().then((list) {
      setState(() {
        categorias = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          "Viagens",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20.0),
        itemCount: viagens.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            onDismissed: (direction) {
              _allertRegistros(viagens[index].id);
              /* 
              helper.deleteViagem(viagens[index].id);
              lastRemoved.id = viagens[index].id;
              lastRemoved.saida = viagens[index].saida;
              lastRemoved.chegada = viagens[index].chegada;
              final snack = SnackBar(
                content: Text("Viagem ${lastRemoved.saida} removido"),
                action: SnackBarAction(
                  label: "Desfazer",
                  onPressed: () {
                    setState(() {
                      helper.saveViagem(lastRemoved);
                    });
                  },
                ),
                duration: Duration(seconds: 3),
              );
              Scaffold.of(context).showSnackBar(snack); */
            },
            background: Container(
              margin: EdgeInsets.only(top: 20),
              color: Colors.red,
              child: Align(
                alignment: Alignment(-0.9, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            direction: DismissDirection.startToEnd,
            child: Container(
              margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue[200],
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 5))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(viagens[index].saida)),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  Text(
                    viagens[index].chegada == null
                        ? "Aberta"
                        : dateFormat
                            .format(DateTime.parse(viagens[index].chegada)),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _allertRegistros(int _id) async {
    List<Registro> _deletedRegistros = List();

    await helper.getAllRegistros().then((list) {
      setState(() {
        for (Registro _item in list) {
          if (_item.viagemId == _id) {
            _deletedRegistros.add(_item);
          } else {
            continue;
          }
        }
      });
    });

    _categoria(int _id) {
      Categoria _categoria;
      for (Categoria i in categorias) {
        if (i.id == _id) {
          _categoria = i;
        }
      }
      return _categoria.titulo;
    }

    Container _add = Container(
      margin: EdgeInsets.all(20),
      color: Colors.white,
      child: Scaffold(
        body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: _deletedRegistros.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(
                "Categoria: ${_categoria(_deletedRegistros[index].viagemId)}, Registro: ${_deletedRegistros[index].titulo}, valor: R\$${_deletedRegistros[index].valor}, data: ${dateFormat.format(DateTime.parse(_deletedRegistros[index].date))}");
          },
        ),
      ),
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return _add;
      },
    );
  }
}
