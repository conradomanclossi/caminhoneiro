// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Links
import 'add_pop_up_viagen.dart';
import 'add_pop_up_viagem_close.dart';
import 'add_pop_up_categoria.dart';
import 'add_pop_up_registro.dart';

// Pop Up Add
showAdd(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AddPopUp();
    },
  );
}

class AddPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: 275.0, bottom: 275.0, left: 20.0, right: 20.0),
      child: Scaffold(
        backgroundColor: Color(0xFFFFFF),
        body: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            children: <Widget>[
              // Iniciar Viagem
              itemPopUP(
                  colorBg: Colors.lightGreen,
                  text: "Iniciar Viagem",
                  clicked: () {
                    Navigator.pop(context);
                    viagemAdd(context);
                  }),
              // Encerrar Viagem
              itemPopUP(
                  colorBg: Colors.red,
                  text: "Encerrar Viagem",
                  clicked: () {
                    Navigator.pop(context);
                    viagemClose(context);
                  }),
              // Adicionar Categoria
              itemPopUP(
                  colorBg: Colors.orange,
                  text: "Adicionar Categoria",
                  clicked: () {
                    Navigator.pop(context);
                    categoriaAdd(context);
                  }),
              // Adicionar Registro
              itemPopUP(
                  colorBg: Colors.blue,
                  text: "Adicionar Registro",
                  clicked: () {
                    Navigator.pop(context);
                    registroAdd(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemPopUP({Color colorBg, String text, Function clicked}) {
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
