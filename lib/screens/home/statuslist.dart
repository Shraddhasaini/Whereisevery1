import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class StatusList extends StatefulWidget {
  @override
  _StatusListState createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  @override
  Widget build(BuildContext context) {

    final statuses = Provider.of<QuerySnapshot>(context);
    //print(statuses.documents);
    for (var doc in statuses.documents) {
      print(doc.data);
    }
    return Container();
  }
}
