// Packages
import 'package:caminhoneiro_app/app/add_pop_up/viagem_item.dart';
import 'package:caminhoneiro_app/app/elements/principal_element.dart';
import 'package:caminhoneiro_app/sqlite/controller/viagem_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// DataBase
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
// Pages
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

DateTime date = DateTime.now();
DateFormat dateFormat = DateFormat('dd/MM/yyyy');
DateFormat dateSave = DateFormat('yyyy-MM-dd');
DateTime _dateTime;

/// Viagem Close
viagemClose(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CloseViagem();
    },
  );
}

class CloseViagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    double space;

    switch (database.viagens.length.toString()) {
      case "1":
        space = 200;
        break;
      case "2":
        space = 200;
        break;
      case "3":
        space = 200;
        break;
      default:
        space = 160;
        break;
    }

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin:
            EdgeInsets.only(top: space, bottom: space, left: 20.0, right: 20.0),
        child: Scaffold(
          backgroundColor: Color(0xFFFFFF),
          body: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    // List of viagens
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Observer(builder: (_) {
                        return SizedBox(
                          height: 370,
                          child: ListView.builder(
                            itemCount: database.viagens.length,
                            itemBuilder: (_, index) {
                              Viagem item = database.viagens[index];
                              return ItemViagem(viagem: item);
                            },
                          ),
                        );
                      }),
                    ),

                    // Sair (Botão)
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: RaisedButton(
                        splashColor: Colors.green,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Sair',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

viagemCloseEnd(BuildContext context, Viagem viagem) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Close(viagem: viagem);
    },
  );
}

class Close extends StatelessWidget {
  final Viagem viagem;
  const Close({Key key, this.viagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    final viagemController = Provider.of<ViagemController>(context);
    viagemController.viagem = viagem;

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin:
            EdgeInsets.only(top: 240.0, bottom: 240.0, left: 20.0, right: 20.0),
        child: Scaffold(
          backgroundColor: Color(0xFFFFFF),
          body: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    // Data de saída (Text)
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Data de Saída',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20.0,
                        ),
                      ),
                    ),

                    // Mostrador de saída
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                dateFormat.format(DateTime.parse(
                                    viagemController.viagem.saida)),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
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
                            viagemController.setChegada(date.toString());
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
                                  .format(_dateTime == null ? date : _dateTime)
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

                    // Buttons
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: RaisedButton(
                                splashColor: Colors.green,
                                color: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                onPressed: viagemController.viagemIsTrue
                                    ? () {
                                        database.updateViagem(
                                            viagemController.viagem);
                                        Navigator.pop(context);
                                      }
                                    : null,
                                child: const Text('Salvar',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
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
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
