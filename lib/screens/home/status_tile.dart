import 'package:flutter/material.dart';
import 'package:whereisevery1/models/status.dart';

class StatusTile extends StatelessWidget {

  final Status status;
  StatusTile({this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.amberAccent[status.status],
          ),
          title: Text(status.name),
          subtitle: Text('is currently at ${status.location}'),
        ),
      ),
    );
  }
}
