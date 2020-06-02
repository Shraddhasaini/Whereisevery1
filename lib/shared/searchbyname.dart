import 'package:flutter/material.dart';
import 'package:whereisevery1/shared/constants.dart';

class SearchByName extends StatefulWidget {
  @override
  _SearchByNameState createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  TextEditingController editingController = TextEditingController();

 /* void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      void _showSearchResult(){
        showModalBottomSheet(context: context, builder: (context){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
            child: SearchResult(),
          );
        });
      }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }*/

    @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 13.0,
        ),
      onChanged: (value) {
        //filterSearchResults(value);
      },
      controller: editingController,
        decoration: textInputDecoration.copyWith(
          labelText: "Search", labelStyle: TextStyle(color: Colors.amberAccent[400],fontFamily: 'Montserrat',fontSize: 18.0),
          //prefixIcon: Icon(Icons.search,
          //color: Colors.amberAccent[400],),
        ),
    );
  }
}
