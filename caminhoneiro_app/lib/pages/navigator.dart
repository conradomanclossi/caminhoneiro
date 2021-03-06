// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pages
import 'package:caminhoneiro_app/pages/categorias.dart';
import 'package:caminhoneiro_app/pages/status.dart';
import 'package:caminhoneiro_app/pages/home.dart';
import 'package:caminhoneiro_app/pages/faturamento.dart';
//import 'package:caminhoneiro_app/pages/pessoal.dart';
import 'package:caminhoneiro_app/pages/add.dart';

/// Dependecies
class AppNavigator extends StatefulWidget {
  AppNavigator({Key key}) : super(key: key);

  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _selectedIndex = 0;

  /// Conteudo das paginas
  
  static List<Widget> _widgetOptions = <Widget>[
    /// Link page Home
    HomeApp(),

    /// Link page Faturamento
    Faturamento(),

    /// Link page Categorias
    Categorias(),

    /// Link page Pessoal
    //Pessoal()
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
                      icon: Icon(Icons.category), title: Text("Categorias")),
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
                  showAdd(context);
                },
                backgroundColor: Colors.lightGreen,
                child: Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
          ),

          /// Top Status Bar
          StatusBar(),
        ],
      ),
    );
  }
}
