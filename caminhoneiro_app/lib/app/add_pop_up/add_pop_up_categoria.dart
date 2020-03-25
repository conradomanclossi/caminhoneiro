// Packages
import 'package:caminhoneiro_app/app/elements/principal_element.dart';
import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// Pages
import 'package:caminhoneiro_app/sqlite/suport_database.dart';

String dropdownValue = 'Faturamento';

/// Categoria Add
categoriaAdd(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AddCategoria();
    },
  );
}

class AddCategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    Categoria c = Categoria();
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: dropdownValue == 'Custo'
              ? EdgeInsets.only(
                  top: 225.0, bottom: 225.0, left: 20.0, right: 20.0)
              : EdgeInsets.only(
                  top: 195.0, bottom: 195.0, left: 20.0, right: 20.0),
          child: Scaffold(
            backgroundColor: Color(0xFFFFFF),
            body: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      // Adicionar Categoria (Text)
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Adicionar Categoria',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Tipo (Text)
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Tipo',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      // Tipo (Selector)
                      PrincipalElement(
                        child: Center(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(canvasColor: Colors.lightGreen),
                            child: DropdownButton<String>(
                                iconEnabledColor: Colors.white,
                                underline: SizedBox(),
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.white),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Faturamento',
                                  'Custo'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none),
                                    ),
                                  );
                                }).toList()),
                          ),
                        ),
                      ),

                      /// Título (Text Field)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20, right: 20),
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

                      /// Comissão (Text Field)
                      dropdownValue == 'Custo'
                          ? Text('')
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 20.0, right: 20.0),
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

                      /// Salvar (Botão)
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                        child: RaisedButton(
                          splashColor: Colors.green,
                          color: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            c.tipo = dropdownValue;
                            database.saveCategoria(c);
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
      },
    );
  }
}
