// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
// DataBase
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
// Pages
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:provider/provider.dart';

DateTime date = DateTime.now();
DateFormat dateFormat = DateFormat('dd/MM/yyyy');
DateFormat dateSave = DateFormat('yyyy-MM-dd');

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
      Future<Null> selectDate(BuildContext context) async {
        final DateTime picked = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2019),
            lastDate: DateTime(2020));
        if (picked != null && picked != date) {
          setState(() {
            date = picked;
          });
        }
      }

      return Container(
        margin:
            EdgeInsets.only(top: 265.0, bottom: 265.0, left: 20.0, right: 20.0),
        child: Scaffold(
          backgroundColor: Color(0xFFFFFF),
          body: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Iniciar uma viagem',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Data de Saída',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectDate(context);
                      },
                      child: Container(
                        height: 60.0,
                        margin: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: RadialGradient(
                            radius: 10,
                            colors: [
                              Colors.lightGreen[400],
                              Colors.lightGreen[600],
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.lightGreen[200],
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                                offset: Offset(0, 10))
                          ],
                        ),
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
                                dateFormat.format(date).toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 30.0, left: 20.0, right: 20.0),
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        onPressed: () async {
                          Viagem v = Viagem();
                          v.saida = '${dateSave.format(date).toString()}';
                          database.saveViagem(v);
                          Navigator.pop(context);
                        },
                        child: const Text('Salvar',
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
