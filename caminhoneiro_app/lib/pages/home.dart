import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  ///Database
  DatabaseHelper helper = DatabaseHelper();
  List<Registro> registros = List();

  @override
  void initState() {
    super.initState();
    helper.getAllRegistros().then((list) {
      setState(() {
        registros = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 60.0),
      itemCount: registros.length,
      itemBuilder: (context, index) {
        return _faturamentoCard(context, index);
      },
    );
  }

  Widget _faturamentoCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print(registros[index].id);
      },
      child: Container(
        height: 70.0,
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: registros[index].categoriaId == 1
                ? Colors.lightGreen
                : Colors.red,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: registros[index].categoriaId == 1
                    ? Colors.lightGreen[200]
                    : Colors.red[200],
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0, 5),
              )
            ]),
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
                    text: registros[index].categoriaId.toString(),
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0), // default text style
                    children: <TextSpan>[
                      TextSpan(
                          text: registros[index].titulo,
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
                            text: registros[index].valor.toString(),
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
    );
  }
}
