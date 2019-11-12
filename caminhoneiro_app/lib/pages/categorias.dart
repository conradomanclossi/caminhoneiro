// Package
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pages
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

class Categorias extends StatefulWidget {
  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  /// Database
  DatabaseHelper helper = DatabaseHelper();
  List<Categoria> categorias = List();
  Categoria lastRemoved = Categoria();

  @override
  void initState() {
    super.initState();
    helper.getAllCategorias().then((list) {
      setState(() {
        categorias = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 80.0),
      itemCount: categorias.length,
      itemBuilder: (context, index) {
        return listCategoria(context, index);
      },
    );
  }

  Widget listCategoria(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      onDismissed: (direction) {
        helper.deleteCategoria(categorias[index].id);
        lastRemoved.id = categorias[index].id;
        lastRemoved.tipo = categorias[index].tipo;
        lastRemoved.titulo = categorias[index].titulo;
        lastRemoved.comissao = categorias[index].comissao;
        final snack = SnackBar(
          content: Text("Categoria ${lastRemoved.titulo} removida"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                helper.saveCategoria(lastRemoved);
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
      child: Container(
        height: 70.0,
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: categorias[index].tipo == 'Faturamento'
                ? Colors.lightGreen
                : Colors.red,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                  color: categorias[index].tipo == 'Faturamento'
                      ? Colors.lightGreen[200]
                      : Colors.red[200],
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: Offset(0, 5))
            ]),
        child: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(
                  categorias[index].tipo == 'Faturamento'
                      ? Icons.monetization_on
                      : Icons.money_off,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text.rich(
                TextSpan(
                    text: categorias[index].tipo,
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\n${categorias[index].titulo}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0))
                    ]),
              ),
            ),
            categorias[index].comissao == null
                ? Text('')
                : Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(left: 140.0),
                      child: Text.rich(TextSpan(
                          text: 'Comissão',
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n${categorias[index].comissao}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0))
                          ])),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
