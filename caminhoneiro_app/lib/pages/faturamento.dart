import 'package:flutter/material.dart';

class Faturamento extends StatefulWidget {
  @override
  _FaturamentoState createState() => _FaturamentoState();
}

class _FaturamentoState extends State<Faturamento> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /// CHIP
        Container(
          height: 70.0,
          margin: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
          decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [BoxShadow(
                color: Colors.lightGreen[200],
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0,5),
              )]),
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
                  child: Text.rich(
                    TextSpan(
                      text: 'Frete',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: '\nMilho',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0)),
                      ],
                    ),
                  )),
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
                              text: '15.000,00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                        ],
                      ),
                    )),
              ),
            ],
          ),

        ),
        Container(
          height: 70.0,
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [BoxShadow(
                color: Colors.lightGreen[200],
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0,5),
              )]),
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
                  child: Text.rich(
                    TextSpan(
                      text: 'Frete',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: '\nMilho',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0)),
                      ],
                    ),
                  )),
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
                              text: '15.000,00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                        ],
                      ),
                    )),
              ),
            ],
          ),

        ),
      ],
    );
  }
}
