// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pages
import 'pages/home_page/home_page.dart';
import 'pages/faturamento/faturamento_page.dart';
import 'pages/categoria_page/categoria_page.dart';
import 'pages/pessoal_page/pessoal_page.dart';
// Aditional's
import 'package:caminhoneiro_app/pages/status.dart';
import 'add_pop_up/add_pop_up.dart';

class NavigatorApp extends StatefulWidget {
  @override
  _NavigatorAppState createState() => _NavigatorAppState();
}

class _NavigatorAppState extends State<NavigatorApp> {
  int _selectedIndex = 0;

  // Páginas
  static List<Widget> _widgetOptions = <Widget>[
    // Link page Home
    HomePage(),

    // Link page Faturamento
    FaturamentoPage(),

    // Link page Categorias
    CategoriaPage(),

    // Link page Pessoal
    PessoalPage(),
  ];

  // Index Selector
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),

          // Bottom Navigation
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on),
                title: Text("Faturamento"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                title: Text("Categorias"),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("Pessoal"))
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.lightGreen,
            onTap: _onItemTapped,
          ),
          // Floating Button
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                showAdd(context);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),

        // Top Status Bar
        StatusBar()
      ],
    );
  }
}
