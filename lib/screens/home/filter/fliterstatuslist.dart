import 'package:flutter/material.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/screens/home/status_tile.dart';

class FilterStatusList extends StatefulWidget {
  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterStatusList> {
  @override
  Widget build(BuildContext context) {

    final statuses = Provider.of<List<Status>>(context) ?? [];

    return ListView.builder(
      itemCount: statuses.length,
      itemBuilder: (context, index){
        return StatusTile(status: statuses[index]);
      },
    );
  }
}