import 'package:flutter/material.dart';
import 'package:WhereIsEveryone/screens/authenticate/register.dart';
import 'package:WhereIsEveryone/screens/home/searchModal.dart';
import 'package:WhereIsEveryone/screens/home/status_tile.dart';
import 'package:WhereIsEveryone/screens/home/statuslist.dart';
import 'package:WhereIsEveryone/shared/constants.dart';

class SearchByName extends StatefulWidget {
  @override
  _SearchByNameState createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  TextEditingController editingController = TextEditingController();

  void filterSearchResults(String query) {
    if(query.isNotEmpty) {
        showModalBottomSheet(context: context, builder: (context) {
          return Container(
            color: Colors.black87,
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: SearchModal(name: query),
          );
        });
    }
    }

    @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 13.0,
        ),
      //onChanged: (value) {
        //filterSearchResults(value);
      //},
      onSubmitted: (value) {
          //checkedit
        filterSearchResults(value);
    },
      controller: editingController,
        decoration: textInputDecoration.copyWith(
          labelText: "Search", labelStyle: TextStyle(color: Colors.amberAccent[400],fontFamily: 'Montserrat',fontSize: 18.0),
          prefixIcon: Icon(Icons.search,
          color: Colors.amberAccent[400],),
        ),
    );
  }
}
