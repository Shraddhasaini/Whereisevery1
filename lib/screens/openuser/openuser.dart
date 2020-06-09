import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/openuser/shared/OpenCalendar.dart';
import 'package:whereisevery1/screens/openuser/shared/OpenStatus.dart';

class OpenUserRadius extends StatefulWidget {
  @override
  _OpenUserRadius createState() => _OpenUserRadius();
}

class _OpenUserRadius extends State<OpenUserRadius> {
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
          OpenStatus(),
          OpenCalendar(),
          OpenLocation(),
        ],
      ),
    );
  }
}

class OpenLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('this is only radius'),
    );
  }
}

