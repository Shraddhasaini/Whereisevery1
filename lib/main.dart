import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whereisevery1/login.dart';

void main() => runApp(MaterialApp(
  home: Splash()
));

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FlatButton(
              onPressed: (){
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => Login()
                      )
                );
              },
              child: Text(
                'Montserrat Regular',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            ),
          ),
        ),
        ),
    );
  }
}