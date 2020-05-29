import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/authenticate/register.dart';
import 'package:whereisevery1/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return sign_in(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
