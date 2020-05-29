import 'package:flutter/material.dart';
import 'package:whereisevery1/services/auth.dart';
import 'package:whereisevery1/shared/constants.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        image: AssetImage('assets/splashtext.png'),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: -10,
                          bottom: -50,
                          width: 200,
                          height: 400,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Symbols.png'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: -100,
                          width: 400,
                          height: 500,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/registerboy.png'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: -40,
                          child: Container(
                            width: 400,
                            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height:10.0),
                                  TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                      onChanged: (val){
                                        setState(() => email = val);
                                      }
                                  ),
                                  SizedBox(height:10.0),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                                    obscureText: true,
                                    onChanged: (val){
                                      setState(() => password = val);
                                    },
                                  ),
                                  SizedBox(height:10.0),
                                  RaisedButton(
                                    color: Colors.amberAccent[400],
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()){
                                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                        if (result == null){
                                            setState(() => error = 'please supply a valid email');
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                      error,
                                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                                  ),
                                  SizedBox(height:2.0),
                                  FlatButton(
                                    child: Text(
                                      'Already have an account?',
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
