// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PrincipalElement extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const PrincipalElement({Key key, this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: RadialGradient(radius: 10, colors: [
            Colors.lightGreen[400],
            Colors.lightGreen[600],
          ]),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(139, 195, 74, 150),
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, 10))
          ]),
      child: FlatButton(
          onPressed: onTap,
          highlightColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashColor: Colors.white.withOpacity(0.5),
          child: child),
    );
  }
}
