import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/navigator.dart';
import 'sqlite/database.dart';


void main() => runApp(MyApp());

String name_app = "Caminhoneiro";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  DatabaseHelper helper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    /*/// Salvando uma viagem
    Viagem v = Viagem();
    v.saida = '2019-09-10';
    v.chegada = '2019-09-10';

    helper.saveViagem(v);

    /// Salvando uma categoria
    Categoria c = Categoria();
    c.tipo = 'faturamento';
    c.titulo = 'frete';

    helper.saveCategoria(c);


    helper.getAllCategorias().then((list){
      print(list);
    });

    helper.getAllViagens().then((list){
      print(list);
    });*/

    /*/// Salvando um registro
    Registro r = Registro();
    r.viagemId = 1;
    r.categoriaId = 1;
    r.date = '2019-09-10';
    r.titulo = 'Milho';
    r.valor = 19000.25;

    helper.saveRegistro(r);*/

    helper.getAllRegistros().then((list){
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name_app,
      home: AppNavigator(),
    );
  }
}*/


