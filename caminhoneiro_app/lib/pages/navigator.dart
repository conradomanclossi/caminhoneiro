import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/status.dart';
import 'package:caminhoneiro_app/pages/home.dart';
import 'package:caminhoneiro_app/pages/faturamento.dart';
import 'package:caminhoneiro_app/pages/custos.dart';
import 'package:caminhoneiro_app/pages/pessoal.dart';
import 'package:caminhoneiro_app/pages/registro_page.dart';

import 'add.dart';

/// Dependecies
class AppNavigator extends StatefulWidget {
  AppNavigator({Key key}) : super(key: key);

  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _selectedIndex = 0;

  /// Conteudo das paginas
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    /// Link page Home
    HomeApp(),

    /// Link page Faturamento
    Faturamento(),

    /// Link page Custos
    Custos(),

    /// Link page Pessoal
    Pessoal()
  ];

  /// Index Selector
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Navegação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          /// Bottom Menu
          Container(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightGreen,
              ),
              body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),

              /// Bottom Navigation
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text("Total")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.monetization_on),
                      title: Text("Faturamento")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.money_off), title: Text("Custos")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text("Pessoal"))
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.lightGreen,
                onTap: _onItemTapped,
              ),

              /// Floating Button
              floatingActionButton: FloatingActionButton(
                /// Add Popup
                onPressed: () {
                  /*_showRegistroPage();*/
                  showAdd(context);
                },
                backgroundColor: Colors.lightGreen,
                child: Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            ),
          ),

          /// Top Status Bar
          StatusBar(),
        ],
      ),
    );
  }

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
}
