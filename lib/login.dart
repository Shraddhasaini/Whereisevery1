import 'dart:ui';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logingirl.png'),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 40,
                  bottom: 40,
                  width: 80,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage('assets/plantlogin.png'),
                  ),
                ),
            ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}