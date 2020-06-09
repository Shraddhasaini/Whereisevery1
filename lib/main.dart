import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whereisevery1/provide.dart';
//import 'package:whereisevery1/login.dart';
import 'dart:async';
//import 'package:whereisevery1/screens/wrapper.dart';

void main() => runApp(MaterialApp(
  home: Splash()
));

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 1),
            (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context) => Provide(),
        ),
      );
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.amberAccent[400],
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splashtext.png'),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/splash.png'),
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