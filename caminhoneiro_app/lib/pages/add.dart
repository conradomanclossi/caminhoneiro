import 'package:caminhoneiro_app/pages/registro_page.dart';
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime date = DateTime.now();
DateFormat dateFormat = DateFormat('dd/MM/yyyy');
DateFormat dateSave = DateFormat('yyyy-MM-dd');

String dropdownValue = 'Faturamento';

DatabaseHelper helper = DatabaseHelper();

showAdd(BuildContext context) {
  void _showRegistroPage({Registro registro}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddRegistro(
          registro: registro,
        ),
      ),
    );
  }

  /// Popup Add
  Container _add = Container(
    margin: EdgeInsets.only(top: 275.0, bottom: 275.0, left: 20.0, right: 20.0),
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
                  categoriaAdd(context);
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
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  _showRegistroPage();
                },
                child: Container(
                  color: Colors.blueAccent,
                  height: 100,
                  child: Center(
                    child: Text(
                      "Adicionar Registro",
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
                top: 265.0, bottom: 265.0, left: 20.0, right: 20.0),
            child: Scaffold(
              backgroundColor: Color(0xFFFFFF),
              body: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Iniciar uma viagem',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Data de Saída',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
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
                              top: 10.0, bottom: 30.0, left: 20.0, right: 20.0),
                          child: RaisedButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              Viagem v = Viagem();
                              v.saida = '${dateSave.format(date).toString()}';
                              helper.saveViagem(v);
                              Navigator.pop(context);
                            },
                            child: const Text('Salvar',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
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

categoriaAdd(BuildContext context) {
  Categoria c = Categoria();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            margin: EdgeInsets.only(
                top: 175.0, bottom: 175.0, left: 20.0, right: 20.0),
            child: Scaffold(
              backgroundColor: Color(0xFFFFFF),
              body: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        /// Adicionar Categoria
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Adicionar Categoria',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        /// Tipo
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Tipo',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 25.0,
                            ),
                          ),
                        ),

                        /// Tipo Selector
                        DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['Faturamento', 'Custo']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),

                        /// Título título
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Título',
                            ),
                            onChanged: (text) {
                              c.titulo = text;
                            },
                          ),
                        ),

                        /// Comissão título
                        dropdownValue == 'Custo'
                            ? Text('')
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Comissão',
                                  ),
                                  onChanged: (text) {
                                    c.comissao = double.parse(text);
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ),

                        /// Salvar
                        Container(
                          margin: EdgeInsets.only(
                              top: 10.0, bottom: 30.0, left: 20.0, right: 20.0),
                          child: RaisedButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              c.tipo = dropdownValue;
                              helper.saveCategoria(c);
                              Navigator.pop(context);
                            },
                            child: const Text('Salvar',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
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
