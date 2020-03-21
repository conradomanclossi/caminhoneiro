// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pages
import 'package:caminhoneiro_app/app/pages/categoria_page/categoria_page.dart';
import 'package:caminhoneiro_app/app/pages/faturamento/faturamento_page.dart';
import 'package:caminhoneiro_app/app/pages/home_page/home_page.dart';
import 'package:caminhoneiro_app/app/pages/pessoal_page/pessoal_page.dart';
import 'package:caminhoneiro_app/pages/status.dart';
import '../pages/status.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int _selectedIndex = 0;

  // Páginas
  static List<Widget> _widgetOptions = <Widget>[
    // Link page Home
    MyHomePage(),

    // Link page Faturamento
    FaturamentoPage(),

    // Link page Categorias
    CategoriaPage(),

    // Link page Pessoal
    PessoalPage()
  ];

  // Index Selector
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Caminhoneiro App",
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: Stack(
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
                onPressed: null,
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
      ),
    );
  }
}
