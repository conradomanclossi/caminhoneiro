// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pages
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

class StatusBar extends StatefulWidget {
  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  DatabaseHelper helper = DatabaseHelper();
  List<Registro> registros = List();
  double total;

  @override
  void initState() {
    super.initState();
    helper.getTotalRegistro().then((list) {
      setState(() {
        total = list[0]['SUM(valorColumn)'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 1000.0,
      margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0, 5))
          ]),
      child: GestureDetector(
        onTap: () {
          print("It's Work");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// TOTAL
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, top: 8.0),
                child: Text(
                  "Total",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            /// TOTAL VALOR
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 10.0),
                    child: Icon(
                      Icons.poll,
                      color: Colors.black54,
                      size: 30.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      '$total',
                      textScaleFactor: 3.0,
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            /// Menores
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding:
                        EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Faturamento',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.0), // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: '\n150.000,00',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                        ],
                      ),
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Despesa',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.0), // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: '\n100.000,00',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Text.rich(
                    TextSpan(
                      text: 'Comissão',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10.0), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: '\n15.000,00',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
