import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/date_symbol_data_local.dart';

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

  Widget build(BuildContext context) {

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
                todayStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
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
              onDaySelected: (date, events) {
                setState( ()
                  {
                _selectedEvents =  events;
                }
                );
              },
              calendarController: _controller,
               ),
            Row(
              children: <Widget>[
                ..._selectedEvents.map((event) => ListTile(
                  title: Text(event,
                  style: TextStyle(
                      color: Colors.amberAccent[400],
                      fontFamily: 'Montserrat',
                      fontSize: 20.0
                  ),
                  ),
                )),
            Image.asset('assets/pot.png',
            fit: BoxFit.cover,),
           ],
            ),
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
  }

_showAddDialog(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _eventController,
        ),
        actions: <Widget>[
          FlatButton(
          child: Text('save'),
          onPressed: (){
            if(_eventController.text.isEmpty) return;
            setState(() {
              if(_events[_controller.selectedDay] != null){
                _events[_controller.selectedDay].add
                  (_eventController.text);
              } else {
                _events[_controller.selectedDay] =
                [_eventController.text];
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


