// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Links
import 'package:caminhoneiro_app/app/add_pop_up/add_pop_up_viagen.dart';

class ItemPopUp extends StatelessWidget {
  final Color colorBg;
  final Function clicked;
  final String text;

  const ItemPopUp({Key key, this.colorBg, this.clicked, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: clicked,
        child: Container(
            color: colorBg,
            height: 100,
            child: Center(
              child: Text(
                text,
                textScaleFactor: 2.0,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}

showAdd(BuildContext context) {
  // Pop Up Add
  Container _add = Container(
    margin: EdgeInsets.only(top: 275.0, bottom: 275.0, left: 20.0, right: 20.0),
    child: Scaffold(
      backgroundColor: Color(0xFFFFFF),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            // Iniciar Viagem
            ItemPopUp(
                colorBg: Colors.lightGreen,
                text: "Iniciar Viagem",
                clicked: () {
                  Navigator.pop(context);
                  viagemAdd(context);
                }),

            // Encerrar Viagem
            ItemPopUp(
                colorBg: Colors.red,
                text: "Encerrar Viagem",
                clicked: () {
                  Navigator.pop(context);
                  print("Encerrar Viagem");
                }),

            // Adicionar Categoria
            ItemPopUp(
                colorBg: Colors.orange,
                text: "Adicionar Categoria",
                clicked: () {
                  Navigator.pop(context);
                  print("Adicionar Categoria");
                }),

            // Adicionar Registro
            ItemPopUp(
                colorBg: Colors.blue,
                text: "Adicionar Registro",
                clicked: () {
                  Navigator.pop(context);
                  print("Adicionar Registro");
                }),
          ],
        ),
      ),
    ),
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return _add;
      });
}
