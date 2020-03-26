// Packages
import 'package:caminhoneiro_app/app/add_pop_up/add_pop_up_registro.dart';
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemHome extends StatelessWidget {
  final Registro registro;
  const ItemHome({
    Key key,
    this.registro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    Registro _lastRemoved = Registro();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    Categoria _categoria = database.getCategoria(registro.categoriaId);

    var _parseData = dateFormat.format(DateTime.parse(registro.date));
    NumberFormat numberFormat =
        NumberFormat.currency(locale: 'pt_BR', name: "");

    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        _lastRemoved = registro;
        database.deleteRegistro(registro.id);
        final snack = SnackBar(
          content: Text("Registro ${_lastRemoved.titulo} removido"),
          action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                database.saveRegistro(_lastRemoved);
              }),
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

      child: Container(
          height: 70.0,
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          decoration: BoxDecoration(
              color: _categoria.tipo == "Faturamento"
                  ? Colors.lightGreen
                  : Colors.red,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                    color: _categoria.tipo == "Faturamento"
                        ? Colors.lightGreen.withOpacity(0.6)
                        : Colors.red.withOpacity(0.6),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0, 5))
              ]),
          child: FlatButton(
            onPressed: () {
              registroAdd(context, registro: registro);
            },
            highlightColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            splashColor: Colors.white.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            _categoria.tipo == "Faturamento"
                                ? Icons.monetization_on
                                : Icons.money_off,
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text.rich(
                              TextSpan(
                                  text: _categoria.titulo,
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "\n${registro.titulo}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0))
                                  ]),
                            ))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: Text(
                            _parseData,
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text.rich(
                            TextSpan(
                                text: "R\$",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${numberFormat.format(registro.valor)}", // TODO: concert value
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0)),
                                ]),
                          )),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
