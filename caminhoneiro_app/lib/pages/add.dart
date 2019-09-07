import 'package:flutter/material.dart';

showAdd(BuildContext context) {
  /// Popup Add
  Container add = Container(
      margin: EdgeInsets.only(top: 300.0, bottom: 300),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(0.0),
          child: SizedBox(
              width: 250,
              height: 60,
              child: RaisedButton(
                color: Colors.lightGreen,
                onPressed: () {},
                child: const Text('Faturamento',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              )),
        ),
        Padding(
          padding: EdgeInsets.all(0.0),
          child: SizedBox(
              width: 250,
              height: 60,
              child: RaisedButton(
                color: Colors.redAccent,
                onPressed: () {},
                child: const Text('Custos',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              )),
        ),
        Padding(
          padding: EdgeInsets.all(0.0),
          child: SizedBox(
              width: 250,
              height: 60,
              child: RaisedButton(
                color: Colors.orange,
                onPressed: () {},
                child: const Text('Pessoal',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              )),
        ),
      ]));

  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return add;
    },
  );
}
