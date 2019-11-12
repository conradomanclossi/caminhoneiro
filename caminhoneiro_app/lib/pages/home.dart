// Package
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pages
import 'package:caminhoneiro_app/pages/registro_page.dart';
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

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

  List<Registro> selectedRegistros = List();

  @override
  void initState() {
    super.initState();

    _getAllRegistros();

    helper.getAllViagens().then((list) {
      setState(() {
        viagens = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 60.0),
      itemCount: registros.length,
      itemBuilder: (BuildContext context, int index) {
        return _faturamentoCard(context, index);
      },
    );
  }

  Widget _faturamentoCard(BuildContext context, int index) {
    Registro _lastRemoved = Registro();
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      onDismissed: (direction) {
        helper.deleteRegistro(registros[index].id);
        _lastRemoved.id = registros[index].id;
        _lastRemoved.viagemId = registros[index].viagemId;
        _lastRemoved.categoriaId = registros[index].categoriaId;
        _lastRemoved.date = registros[index].date;
        _lastRemoved.titulo = registros[index].titulo;
        _lastRemoved.valor = registros[index].valor;
        final snack = SnackBar(
          content: Text("Registro ${_lastRemoved.titulo} removido"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                helper.saveRegistro(_lastRemoved);
              });
            },
          ),
          duration: Duration(seconds: 3),
        );
        Scaffold.of(context).showSnackBar(snack);
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
      child: GestureDetector(
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
                  future:
                      helper.getCategoria(registros[index].categoriaId).then(
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
                            fontSize: 10.0),
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

  void _getAllRegistros() {
    helper.getAllRegistros().then((list) {
      setState(() {
        registros = list;
      });
    });
  }
}
