import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/home.dart';
import 'package:caminhoneiro_app/pages/faturamento.dart';
import 'package:caminhoneiro_app/pages/custos.dart';
import 'package:caminhoneiro_app/pages/pessoal.dart';

void main() => runApp(MyApp());

String name_app = "Caminhoneiro";

/// Essa Widget é a aplicação principal.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name_app,
      home: MyStateFulWidget(),
    );
  }
}

class MyStateFulWidget extends StatefulWidget {
  MyStateFulWidget({Key key}) : super(key: key);

  @override
  _MyStateFulWidgetState createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  int _selectedIndex = 1;

  /// Conteudo das paginas
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    /// Link page Home
    HomeApp(),
    Faturamento(),
    Custos(),
    Pessoal()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  /// Navegação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caminhoneiro'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Total")),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), title: Text("Faturamento")),
          BottomNavigationBarItem(icon: Icon(Icons.money_off), title: Text("Custos")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Pessoal")),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

