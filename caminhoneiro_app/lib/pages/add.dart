import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime date = DateTime.now();
DateFormat dateFormat = DateFormat('dd/MM/yyyy');

showAdd(BuildContext context) {
  /// Popup Add
  Container _add = Container(
    margin: EdgeInsets.only(top: 300.0, bottom: 300.0, left: 20.0, right: 20.0),
    child: Scaffold(
      backgroundColor: Color(0xFFFFFF),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  viagemAdd(context);
                  //print("Adicionar Faturamento");
                },
                child: Container(
                  color: Colors.lightGreen,
                  height: 100,
                  width: 1000,
                  child: Center(
                    child: Text(
                      "Iniciar Viagem",
                      textScaleFactor: 2.0,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print("Adicionar Categoria");
                },
                child: Container(
                  color: Colors.red,
                  height: 100,
                  child: Center(
                    child: Text(
                      "Encerrar Viagem",
                      textScaleFactor: 2.0,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print("Adicionar Categoria");
                },
                child: Container(
                  color: Colors.orange,
                  height: 100,
                  child: Center(
                    child: Text(
                      "Adicionar Categoria",
                      textScaleFactor: 2.0,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return _add;
    },
  );
}

viagemAdd(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
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
            margin: EdgeInsets.only(
                top: 225.0, bottom: 225.0, left: 20.0, right: 20.0),
            child: Scaffold(
              backgroundColor: Color(0xFFFFFF),
              body: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: <Widget>[
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
                              top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            decoration: InputDecoration(hintText: 'Frete'),
                            maxLength: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            decoration: InputDecoration(hintText: 'Valor'),
                            maxLength: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10.0, bottom: 30.0, left: 20.0, right: 20.0),
                          child: RaisedButton(
                            onPressed: () {},
                            child: const Text('Salvar',
                                style: TextStyle(fontSize: 20)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
