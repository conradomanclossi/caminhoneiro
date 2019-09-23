import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

class AddRegistro extends StatefulWidget {
  @override
  _AddRegistroState createState() => _AddRegistroState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _AddRegistroState extends State<AddRegistro> {
  /// Database
  DatabaseHelper helper = DatabaseHelper();
  List<Categoria> categorias = List();

  @override
  void initState() {
    helper.getAllCategorias().then((list) {
      setState(() {
        categorias = list;
      });
    });

    helper.getAllCategorias().then((list) {
      print(list);
    });
  }

  String dropdownValue = 'One';
  String topdow = 'top: 15, bottom 15';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Registro",
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Viagem",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),
              SizedBox(
                width: 500.0,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 30,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.black45,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Categoria",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),
              SizedBox(
                width: 500.0,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 30,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.black45,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Titulo",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),
              Container(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Titulo',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Valor",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),
              Container(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Data",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Data",
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 25.0, bottom: 15.0),
                  height: 60,
                  width: 1000,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.orange[200],
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0, 5))
                    ],
                  ),
                  child: Center(
                      child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Salvar',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold)),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
