
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/models/users.dart';
import 'package:WhereIsEveryone/screens/wrapper.dart';
import 'package:WhereIsEveryone/services/auth.dart';

class Provide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
