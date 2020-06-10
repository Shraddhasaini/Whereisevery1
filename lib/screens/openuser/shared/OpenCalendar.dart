import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class OpenCalendar extends StatefulWidget {
  @override
  _OpenCalendarState createState() => _OpenCalendarState();
}

class _OpenCalendarState extends State<OpenCalendar> with TickerProviderStateMixin {
  CalendarController _controller;


  @override
  void initState(){
    _controller = CalendarController();
  }

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
            ]
        ),
    );
  }
}
