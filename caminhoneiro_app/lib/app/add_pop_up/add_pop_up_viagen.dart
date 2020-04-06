// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// DataBase
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
// Elements
import 'package:caminhoneiro_app/app/elements/principal_element.dart';

DateTime date = DateTime.now();
DateFormat dateFormat = DateFormat('dd/MM/yyyy');
DateFormat dateSave = DateFormat('yyyy-MM-dd');
DateTime _dateTime;

/// Viagem Add
viagemAdd(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AddViagem();
    },
  );
}

class AddViagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin:
            EdgeInsets.only(top: 275.0, bottom: 275.0, left: 20.0, right: 20.0),
        child: Scaffold(
          backgroundColor: Color(0xFFFFFF),
          body: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    
                    // Iniciar uma viagem (Text)
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Iniciar uma viagem',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

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

                    // Data de saída (Date picker)
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

                    // Botões
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Salvar (Botão)
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: RaisedButton(
                              splashColor: Colors.green,
                              color: Colors.lightGreen,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              onPressed: () async {
                                Viagem v = Viagem();
                                v.saida = _dateTime != null
                                    ? _dateTime.toString()
                                    : date.toString();
                                database.saveViagem(v);
                                Navigator.pop(context);
                              },
                              child: const Text('Salvar',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),

                          // Sair (Botão)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
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
            ),
          ),
        ),
      );
    });
  }
}
