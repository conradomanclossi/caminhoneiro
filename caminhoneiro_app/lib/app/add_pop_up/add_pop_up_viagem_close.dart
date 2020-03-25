// Packages
import 'package:caminhoneiro_app/app/elements/principal_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// DataBase
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
// Pages
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

DateTime date = DateTime.now();
DateFormat dateFormat = DateFormat('dd/MM/yyyy');
DateFormat dateSave = DateFormat('yyyy-MM-dd');
DateTime _dateTime;

/// Viagem Add
viagemClose(BuildContext context) {
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
    Viagem dropdownValue = database.viagens.last;

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin:
            EdgeInsets.only(top: 210.0, bottom: 210.0, left: 20.0, right: 20.0),
        child: Scaffold(
          backgroundColor: Color(0xFFFFFF),
          body: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    // Encerrar uma viagem (Title)
                    Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Encerrar uma viagem',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )),
                    // Data de saída (Text)
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Data de Saída',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    // Data de saída (Selector list)
                    PrincipalElement(
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
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(canvasColor: Colors.lightGreen),
                                child: DropdownButton<Viagem>(
                                  underline: SizedBox(),
                                  iconSize: 0,
                                  value: dropdownValue,
                                  icon: Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: database.viagens
                                      .map<DropdownMenuItem<Viagem>>(
                                          (Viagem value) {
                                    return DropdownMenuItem<Viagem>(
                                      value: value,
                                      child: Text(
                                        dateFormat
                                            .format(DateTime.parse(value.saida))
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ))
                        ],
                      ),
                    ),
                    // Data de chegada (Text)
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Data de Chegada',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    // Selector de chegada (Date picker)
                    PrincipalElement(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: _dateTime == null
                                    ? DateTime.now()
                                    : _dateTime,
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2021))
                            .then((date) {
                          setState(() {
                            _dateTime = date;
                          });
                        });
                      },
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
                              dateFormat
                                  .format(_dateTime == null ? date : _dateTime)
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Salvar (Botão)
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: RaisedButton(
                        splashColor: Colors.green,
                        color: Colors.lightGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () async {
                          dropdownValue.chegada = _dateTime != null
                              ? _dateTime.toString()
                              : date.toString();
                          database.updateViagem(dropdownValue);
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
