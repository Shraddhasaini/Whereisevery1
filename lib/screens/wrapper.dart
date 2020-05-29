import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/models/users.dart';
import 'package:whereisevery1/screens/authenticate/authenticate.dart';
import 'package:whereisevery1/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either Home or authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }

  }
}
