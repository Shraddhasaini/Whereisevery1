import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/screens/home/calendar/caldb.dart';

class OpenCalendar extends StatefulWidget {
  final String documentID;
  OpenCalendar({this.documentID});
  @override
  _OpenCalendarState createState() => _OpenCalendarState();
}

class _OpenCalendarState extends State<OpenCalendar> with TickerProviderStateMixin {
  CalendarController _controller;
  Map<DateTime, List> _events;
  List _selectedEvents;


  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)): Set.from(
          ['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(' Calendar',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Montserrat',
                    color: Colors.amberAccent[400],
                  ),),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset('assets/usercal.png'),
                  ),
                )
              ],
            ),
            TableCalendar(
              events: _events,     daysOfWeekStyle: DaysOfWeekStyle(
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
                markersColor: Colors.amberAccent[400],
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
                formatButtonTextStyle: TextStyle(
                  color: Colors.amberAccent[400],
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
          ]
      ),
    );
  }


}


