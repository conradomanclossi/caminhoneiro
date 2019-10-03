import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InitialConfiguration extends StatefulWidget {
  @override
  _InitialConfigurationState createState() => _InitialConfigurationState();
}

class _InitialConfigurationState extends State<InitialConfiguration> {
  DateTime _date = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2020));
    if (picked != null && picked != _date) {
      print('Date selected: ${dateFormat.format(_date).toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                _selectDate(context);
              },
              child: Container(
                height: 60.0,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.lightGreen[200],
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0, 10))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.lightGreen,
                      size: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        dateFormat.format(_date).toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        
      ),
    );
  }
}
