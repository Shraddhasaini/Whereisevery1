import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/models/users.dart';
import 'package:whereisevery1/screens/home/filter/fliterstatuslist.dart';
import 'package:whereisevery1/screens/home/sidedrawer.dart';
import 'package:whereisevery1/screens/home/status_tile.dart';
import 'package:whereisevery1/screens/home/statuslist.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:whereisevery1/services/dbfilter.dart';
import 'package:whereisevery1/shared/constants.dart';
import 'package:whereisevery1/shared/loading.dart';

class SearchModal extends StatelessWidget {
  final String name;
  SearchModal({this.name});
  @override
  Widget build(BuildContext context) {
    //return Text(name);
    return StreamProvider<List<Filter>>.value(
    value: DatabaseServiceForFilter(name: name).filtered,
      child: FilterStatusList(),
    );
  }
}
