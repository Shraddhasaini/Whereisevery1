import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:whereisevery1/services/auth.dart';

class sign_in extends StatefulWidget {
  @override
  _sign_inState createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView( child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
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
                    left: 0,
                    bottom: 40,
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height:20.0),
                            TextFormField(
                              onChanged: (val){
                                setState(() => email = val);
                              }
                            ),
                            SizedBox(height:20.0),
                            TextFormField(
                              obscureText: true,
                              onChanged: (val){
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(height:20.0),
                            RaisedButton(
                              color: Colors.amberAccent[400],
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              onPressed: () async {
                                        print(email);
                                        print(password);
                              },
                            )
                          ],
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
    ],
    ),
    ),
    ),
    );
  }
}