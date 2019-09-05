import 'package:flutter/material.dart';
import 'package:caminhoneiro_app/pages/home.dart';

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
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home2")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home3")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home3")),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

