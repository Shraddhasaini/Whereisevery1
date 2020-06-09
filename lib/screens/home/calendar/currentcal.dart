import 'package:flutter/cupertino.dart';
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


  @override
void initState(){
    _controller = CalendarController();
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
              calendarController: _controller,
               ),
            Image.asset('assets/pot.png',
            fit: BoxFit.cover,),
          ]
        ),
      ),
    );
  }
}
