import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/openuser/shared/OpenCalendar.dart';
import 'package:whereisevery1/screens/openuser/shared/OpenStatus.dart';

class OpenUserExact extends StatefulWidget {
  final String name;
  final String location;
  final String status;
  OpenUserExact({ this.name, this.location, this.status});
  @override
  _OpenUserExact createState() => _OpenUserExact();
}

class _OpenUserExact extends State<OpenUserExact> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('StatusNeo',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Montserrat'
          ),
        ),
      ),
      body: PageView(
        pageSnapping: true,
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          OpenStatus(name: widget.name,status: widget.status,),
          OpenLocation(),
          OpenCalendar(),
        ],
      ),
    );
  }
}

class OpenLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Scroll Down to view the calendar',
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Montserrat',
          color: Colors.white38,
        ),
      ),
    );
  }
}

