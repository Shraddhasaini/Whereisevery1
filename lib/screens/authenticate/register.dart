import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whereisevery1/services/auth.dart';
import 'package:whereisevery1/shared/constants.dart';
import 'package:whereisevery1/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _size = MediaQuery.of(context).devicePixelRatio;
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView( child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: _width,
                    height: _height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/splashtext.png'),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          bottom: 0,
                          width: 0.3*_width,
                          height: 0.3*_height,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/Symbols.png'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: -(_height-1.0*(_height)),
                          width: _width,
                          height: 0.5*_height,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/registerboy.png'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.01*_height,
                          child: Container(
                            width: _width,
                            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height:0.01*_height),
                                    SizedBox(
                                      height: 0.08*_height,
                                    child: TextFormField(
                                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                        onChanged: (val){
                                          setState(() => email = val);
                                        }
                                    ),
                                  ),
                                  SizedBox(height:0.03*_height),
                                  SizedBox(
                                    height: 0.08*_height,
                                    child: TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                                      obscureText: true,
                                      onChanged: (val){
                                        setState(() => password = val);
                                      },
                                    ),
                                  ),
                                  SizedBox(height:0.05*_height),
                                  Container(
                                    child: Row(
                                        children: <Widget>[
                                          Positioned(
                                            child: RaisedButton(
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
                                                  setState(() => loading = true);
                                                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                                  if (result == null){
                                                    setState(() { error = 'please supply a valid email';
                                                    loading = false;
                                                    });
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                            child: Text('-OR-',style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black26,
                                              fontStyle: FontStyle.italic,
                                            ),),
                                          ),
                                          Positioned(
                                            right: 10,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                              child: RaisedButton(
                                                color: Colors.white30,
                                                child: Text(
                                                  'Google',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
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
                                        ]
                                    ),
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
