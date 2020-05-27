import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Splash()
));

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
                'Monteserrat Regular',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            ),
          ),
        ),
    );
  }
}