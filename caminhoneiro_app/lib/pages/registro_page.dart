import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

class AddRegistro extends StatefulWidget {
  @override
  _AddRegistroState createState() => _AddRegistroState();
}

class _AddRegistroState extends State<AddRegistro> {
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
          color: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.lightGreen,
        ),

      ),
    );
  }
}
