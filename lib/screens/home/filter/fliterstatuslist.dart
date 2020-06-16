import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:WhereIsEveryone/models/status.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/screens/home/status_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FilterStatusList extends StatefulWidget {
  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterStatusList> {
  @override
  Widget build(BuildContext context) {

    final filterstatuses = Provider.of<List<Filter>>(context) ?? [];

    return ListView.builder(
      itemCount: filterstatuses.length,
      itemBuilder: (context, index){
        return FilterStatusTile(status: filterstatuses[index]);
      },
    );
  }
}