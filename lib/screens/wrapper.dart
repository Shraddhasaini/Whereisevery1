import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/models/users.dart';
import 'package:WhereIsEveryone/screens/authenticate/authenticate.dart';
import 'package:WhereIsEveryone/screens/authenticate/sign_in.dart';
import 'package:WhereIsEveryone/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either Home or authenticate widget
    if (user == null){
      print('authentictaedwrapper');
      return Authenticate();
    } else {
      return Home();
    }

  }
}
