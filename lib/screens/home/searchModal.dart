import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/models/status.dart';
import 'package:WhereIsEveryone/models/users.dart';
import 'package:WhereIsEveryone/screens/home/filter/fliterstatuslist.dart';
import 'package:WhereIsEveryone/screens/home/sidedrawer.dart';
import 'package:WhereIsEveryone/screens/home/status_tile.dart';
import 'package:WhereIsEveryone/screens/home/statuslist.dart';
import 'package:WhereIsEveryone/services/database.dart';
import 'package:WhereIsEveryone/services/dbfilter.dart';
import 'package:WhereIsEveryone/shared/constants.dart';
import 'package:WhereIsEveryone/shared/loading.dart';

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
