import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_pop_up_viagem_close.dart';

class ItemViagem extends StatelessWidget {
  final Viagem viagem;
  final Function viagemClose;

  const ItemViagem({Key key, this.viagem, this.viagemClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    DateFormat dateFormat = DateFormat('dd/MM/yy');
    Viagem _lastRemoved = Viagem();

    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        _lastRemoved = viagem;
        database.deleteViagem(viagem.id);
        final snack = SnackBar(
          content: Text("Viagem ${_lastRemoved.saida} removido"),
          action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                database.saveViagem(_lastRemoved);
              }),
          duration: Duration(seconds: 3),
        );
        Scaffold.of(context).showSnackBar(snack);
      },
      background: Container(
        
        margin: EdgeInsets.only(top: 20,bottom: 15),
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: Container(
        height: 60,
        margin: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: RadialGradient(radius: 10, colors: [
              Colors.lightGreen[400],
              Colors.lightGreen[600],
            ]),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(139, 195, 74, 150),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(0, 10))
            ]),
        child: FlatButton(
          onPressed: (){
            viagemCloseEnd(context, viagem);
          },
          highlightColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashColor: Colors.white.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text.rich(
                TextSpan(
                    text: "Saída",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "\n${dateFormat.format(DateTime.parse(viagem.saida)).toString()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0))
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "Chegada",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: viagem.chegada == null
                              ? "\nAberta"
                              : "\n${dateFormat.format(DateTime.parse(viagem.chegada)).toString()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
