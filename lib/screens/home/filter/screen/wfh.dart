import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:whereisevery1/shared/filterstatustile.dart';

class WorkFromHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Status>>.value(
    value: DatabaseService().wfh,
    child: Scaffold(
      backgroundColor: Colors.amberAccent[100],
      body: StatusListWFH()
    ),
    );
  }
}
