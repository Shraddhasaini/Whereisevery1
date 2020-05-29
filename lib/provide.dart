
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/models/users.dart';
import 'package:whereisevery1/screens/wrapper.dart';
import 'package:whereisevery1/services/auth.dart';

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
