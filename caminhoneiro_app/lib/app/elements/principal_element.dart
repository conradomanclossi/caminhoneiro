// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PrincipalElement extends StatelessWidget {
  final Widget child;

  const PrincipalElement({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: RadialGradient(radius: 10, colors: [
            Colors.lightGreen[400],
            Colors.lightGreen[600],
          ]),
          boxShadow: [
            BoxShadow(
                color: Colors.lightGreen[200],
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, 10))
          ]),
      child: child,
    );
  }
}
