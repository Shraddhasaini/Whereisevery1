import 'package:flutter/material.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:provider/provider.dart';

class StatusList extends StatefulWidget {
  @override
  _StatusListState createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  @override
  Widget build(BuildContext context) {

    final statuses = Provider.of<List<Status>>(context);
    statuses.forEach((status) {
      print(status.name);
      print(status.location);
      print(status.status);
    });

    return Container();
  }
}