import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:whereisevery1/services/auth.dart';
import 'package:whereisevery1/shared/constants.dart';
import 'package:whereisevery1/shared/loading.dart';
import 'package:google_sign_in/google_sign_in.dart';

class sign_in extends StatefulWidget {

  final Function toggleView;
  sign_in({this.toggleView});
  @override
  _sign_inState createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :  Scaffold(
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
                    bottom: 0,
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height:10.0),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                                decoration: textInputDecoration.copyWith(hintText: 'Email', hintStyle: TextStyle(color: Colors.white)),
                                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val){
                                setState(() => email = val);
                              }
                            ),
                            SizedBox(height:10.0),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: textInputDecoration.copyWith(hintText: 'Password',hintStyle: TextStyle(color: Colors.white)),
                              obscureText: true,
                              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                              onChanged: (val){
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(height:10.0),
                            Container(
                              child: Row(
                              children: <Widget>[
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
                                    if (_formKey.currentState.validate()){
                                      setState(() => loading = true);
                                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                      if (result == null){
                                        setState(() {
                                          error = 'Could not sign in!';
                                          loading = false;
                                        });
                                        }
                                      }
                                  },
                                ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                child: Text('-OR-',style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white30,
                                  fontStyle: FontStyle.italic,
                                ),),
                              ),
                              Positioned(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  child: RaisedButton(
                                    color: Colors.white12,
                                    child: Text(
                                      'Google',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    onPressed: () async {
                                      dynamic result = await _auth.googleSignIn();
                                      if (result == null){
                                        setState(() { error = 'please supply a valid email';
                                        loading = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              ],
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                            SizedBox(height:2.0),
                            FlatButton(
                              //color: Colors.black,
                              child: Text(
                                '       Register your account',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.amberAccent[400],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              onPressed: (){
                                widget.toggleView();
                              },
                            ),
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