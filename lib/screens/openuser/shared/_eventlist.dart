import 'package:flutter/material.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/screens/home/status_tile.dart';

class EventList extends StatefulWidget {
  final String documentID;
  EventList({ this.documentID });

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {

    final events = Provider.of<List<MyEvent>>(context) ?? [];

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index){
        return
      },
    );
  }
}