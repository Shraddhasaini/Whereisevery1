import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:WhereIsEveryone/models/status.dart';
import 'package:WhereIsEveryone/models/users.dart';
import 'package:WhereIsEveryone/screens/home/calendar/caldb.dart';
import 'package:WhereIsEveryone/services/database.dart';
import 'package:WhereIsEveryone/shared/constants.dart';

class MyCalendar extends StatefulWidget {

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> with TickerProviderStateMixin {
 CalendarController _controller;
 Map<DateTime, List<dynamic>> _events;
 List<dynamic> _selectedEvents;
 TextEditingController _eventController;

  @override
void initState(){
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events =  {};
    _selectedEvents = [];
  }

 Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
   Map<String, dynamic> newMap = {};
   map.forEach((key, value) {
     newMap[key.toString()] = map[key];
   });
   return newMap;
 }

 Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
   Map<DateTime, dynamic> newMap = {};
   map.forEach((key, value) {
     newMap[DateTime.parse(key)] = map[key];
   });
   return newMap;
 }


 Map<DateTime, List<dynamic>> _groupEvents(List<MyEvent> allEvents) {
   Map<DateTime, List<dynamic>> data = {};
   allEvents.forEach((event) {
     DateTime date = DateTime(
         event.date.toDate().year, event.date.toDate().month, event.date.toDate().day, 12);
     if (data[date] == null) data[date] = [];
     data[date].add(event.status);
     if(event.status != null) data[date] = [event.status];
     if(_events[_controller.selectedDay] !=  null){
       _events[_controller.selectedDay].add(event.status);
     } else {
       _events[_controller.selectedDay] =
       [event.status];
     }
   }
   );
   return data;
 }

  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return    StreamBuilder<List<MyEvent>>(
        stream: DatabaseCalService(documentID: user.uid).events,
        builder: (context, snapshot) {
    print(_events);
    if (snapshot.hasData) {
    List<MyEvent> allEvents = snapshot.data;
    print(allEvents);
    if (allEvents.isNotEmpty) {
    _events = _groupEvents(allEvents);
    } else {
    _events = {};
    _selectedEvents = [];
    }
    }

    return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
    backgroundColor: Colors.black,
    title: Text('Calendar',
    textAlign: TextAlign.left,
    style: TextStyle(
    fontFamily: 'Montserrat'
    ),
    ),
    ),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
    TableCalendar(
    onDaySelected: (date, events) {
    setState( ()
    {
    _selectedEvents = events;
    }
    );
    },
    events: _events,
    daysOfWeekStyle: DaysOfWeekStyle(
    weekdayStyle: TextStyle(
    color: Colors.amberAccent[100],
    fontFamily: 'Montserrat',
    ),
    weekendStyle: TextStyle(
    color: Colors.amberAccent[400],
    fontFamily: 'Montserrat',
    ),
    ),
    calendarStyle: CalendarStyle(
    markersColor: Colors.white,
    weekdayStyle: TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.white,
    ),
    todayColor: Colors.amberAccent[400],
    selectedColor: Colors.white30,
      selectedStyle:TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    todayStyle: TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    ),
    headerStyle: HeaderStyle(
    //centerHeaderTitle: true,
    titleTextStyle: TextStyle(
    color: Colors.amberAccent[400],
    fontFamily: 'Montserrat',
    fontSize: 20.0
    ),
    formatButtonDecoration: BoxDecoration(
    color: Colors.white10,
    borderRadius: BorderRadius.circular(10.0),
    ),
    leftChevronIcon: Icon(Icons.chevron_left,
    color: Colors.amberAccent[400],
    ),
    rightChevronIcon: Icon(Icons.chevron_right,
    color: Colors.amberAccent[400],
    ),
    formatButtonTextStyle: TextStyle(color: Colors.amberAccent[400],
    fontFamily: 'Montserrat',),
    formatButtonShowsNext: false,
    ),
    startingDayOfWeek: StartingDayOfWeek.sunday,
    calendarController: _controller,
    ),
    ..._selectedEvents.map((event) => ListTile(
    title: Text(event,
    style: TextStyle(
    color: Colors.amberAccent[400],
    fontFamily: 'Montserrat',
    fontSize: 20.0
    ),
    ),
    )),
    Container(
    height: 150,
    width: 150,
    child: Image.asset('assets/pot.png'),),
    ]
    ),
    ),
    floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.amberAccent[400],
    child: Icon(Icons.add,
    color: Colors.black),
    onPressed: _showAddDialog,
    ),
    );
    });
  }

_showAddDialog(){

  final user = Provider.of<User>(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.amberAccent[400],
        //backgroundColor: Color.fromRGBO(255, 202, 40, 0.8),
        content: TextField(
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontSize: 20.0
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black,width: 2.0)
              )
          ),
          controller: _eventController,
        ),
        actions: <Widget>[
          FlatButton(
          child: Text('Save',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 20.0
            ),
          ),
          onPressed: (){
           if(_eventController.text.isEmpty) return;
            setState(() async {
              if(_events[_controller.selectedDay] !=  null){
                /*Firestore.instance.collection('statuses').document(user.uid).collection('caldb').document().setData({
                  'date': Timestamp.fromDate(_controller.selectedDay),
                  'status': _eventController.text,
                });*/
               // await DatabaseService(uid: user.uid).newSubCollection(Timestamp.fromDate(_controller.selectedDay), _eventController.text);
                _events[_controller.selectedDay].add(_eventController.text);
              } else {
                _events[_controller.selectedDay] =
                [_eventController.text];
                await DatabaseService(uid: user.uid).newSubCollection(Timestamp.fromDate(_controller.selectedDay), _eventController.text);
              }
              _eventController.clear();
              Navigator.pop(context);
            });
          },
          ),
        ]
      )

    );

}

}


