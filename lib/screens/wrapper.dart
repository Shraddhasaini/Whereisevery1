import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/authenticate/authenticate.dart';
import 'package:whereisevery1/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or authenticate widget

    return Authenticate();
  }
}
