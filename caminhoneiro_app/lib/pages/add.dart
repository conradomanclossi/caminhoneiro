import 'package:flutter/material.dart';

showAdd(BuildContext context) {
  /// Popup Add
  Container add = Container(
      margin:
          EdgeInsets.only(top: 300.0, bottom: 300.0, left: 20.0, right: 20.0),
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
                          print("Adicionar Faturamento");
                        },
                        child: Container(
                            color: Colors.lightGreen,
                            height: 100,
                            width: 1000,
                            child: Center(
                                child: Text(
                              "Adicionar Faturamento",
                              textScaleFactor: 2.0,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))))),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          print("Adicionar Custo");
                        },
                        child: Container(
                          color: Colors.red,
                          height: 100,
                            child: Center(
                                child: Text(
                                  "Adicionar Custo",
                                  textScaleFactor: 2.0,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                        ))),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          print("Adicionar Despesa Pessoal");
                        },
                        child: Container(
                          color: Colors.orange,
                          height: 100,
                            child: Center(
                                child: Text(
                                  "Adicionar Despesa Pessoal",
                                  textScaleFactor: 2.0,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                        )))
              ],
            ),
          )));

  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return add;
    },
  );
}

