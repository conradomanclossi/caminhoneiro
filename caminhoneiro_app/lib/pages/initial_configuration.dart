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
        body: Container(
          margin: EdgeInsets.only(top: 60.0),
          child: Column(
            children: <Widget>[
              Text(
                'Date selected: ${dateFormat.format(_date).toString()}',
              ),
              Center(
                child: RaisedButton(
                  onPressed: (){
                    _selectDate(context);
                  },
                  child: Text(
                    'Select Date',
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
