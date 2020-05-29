import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:whereisevery1/login.dart';
import 'dart:async';
import 'package:whereisevery1/screens/wrapper.dart';

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
        Duration(seconds: 3),
            (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context) => Wrapper(),
        ),
      );
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[400],
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 683,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splashtext.png'),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: TweenAnimationBuilder(
                      duration: Duration(seconds: 2),
                      tween: Tween<double>(begin: 0,end: 1),
                      builder: (_, double size, __){
                        return Transform.scale(scale: size,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/splash.png'),
                                ),
                              ),
                            ),
                        );
                      },
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