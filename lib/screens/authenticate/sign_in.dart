import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:whereisevery1/services/auth.dart';

class sign_in extends StatefulWidget {
  @override
  _sign_inState createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 683,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/textwie.png'),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: -30,
                    bottom: -50,
                    width: 200,
                    height: 400,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/plantlogin.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    bottom: -170,
                    width: 200,
                    height: 400,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logowhite.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: -100,
                    width: 400,
                    height: 600,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logingirl.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    bottom: -170,
                    width: 200,
                    height: 400,
                    child: Container(
                      child: RaisedButton(
                         child: Text('Login Anon'),
                         onPressed: () async{
                           dynamic result = await _auth.signInAnon();
                         } ,
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