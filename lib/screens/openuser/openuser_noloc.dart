import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/openuser/shared/OpenCalendar.dart';
import 'package:whereisevery1/screens/openuser/shared/OpenStatus.dart';

class OpenUserNoLoc extends StatefulWidget {
  @override
  _OpenUserNoLocState createState() => _OpenUserNoLocState();
}

class _OpenUserNoLocState extends State<OpenUserNoLoc> {
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
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(' Geolocation',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Montserrat',
                  color: Colors.amberAccent[400],
                ),),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  child: Image.asset('assets/loc.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.0),
          Text('Access Denied',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 25.0,
            color: Colors.red[400],
          ),
          ),
          SizedBox(height: 18.0),
          Image.asset('assets/accessdenied.png'),
          SizedBox(height: 18.0),
          Text('!   Person is on leave',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.0,
              fontStyle: FontStyle.italic,
              color: Colors.red[100],
            ),
          ),
        ],
      ),
    );
  }
}

