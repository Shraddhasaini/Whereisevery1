import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/home/filter/screen/bt.dart';
import 'package:whereisevery1/screens/home/filter/screen/opl.dart';
import 'package:whereisevery1/screens/home/filter/screen/osl.dart';
import 'package:whereisevery1/screens/home/filter/screen/pageview.dart';
import 'package:whereisevery1/screens/home/filter/screen/wfh.dart';
import 'package:whereisevery1/screens/home/filter/screen/wio.dart';
import 'package:whereisevery1/screens/home/home.dart';

class OnboardingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
          Positioned(
            top: 100,
            bottom: 450,
            left: 10,
            right: 200,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context) => WorkFromHome(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.white12,
                child: Container(
                  padding: EdgeInsets.all(28.0),
                  child: Image.asset('assets/wfh.png') ,
                ),
                radius: 80.0,
              ),
            ),
          ),
              Positioned(
                top: 200,
                bottom: 450,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Working from Home',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.yellowAccent,
                    fontSize: 16.0,
                  ),),
                ),
              ),
              Positioned(
                top: 200,
                bottom: 350,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => WorkingInOffice(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white12,
                    child: Container(
                      padding: EdgeInsets.all(28.0),
                      child: Image.asset('assets/wio.png') ,
                    ),
                    radius: 80.0,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                bottom: 350,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Working in Office',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.tealAccent,
                      fontSize: 16.0,
                    ),),
                ),
              ),
              Positioned(
                top: 300,
                bottom: 250,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => OnPlannedLeave(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white12,
                    child: Container(
                      padding: EdgeInsets.all(28.0),
                      child: Image.asset('assets/opl.png') ,
                    ),
                    radius: 80.0,
                  ),
                ),
              ),Positioned(
                top: 400,
                bottom: 250,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('on Planned Leave',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.pinkAccent,
                      fontSize: 16.0,
                    ),),
                ),
              ),
              Positioned(
                top: 400,
                bottom: 150,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => OnSickLeave(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white12,
                    child: Container(
                      padding: EdgeInsets.all(28.0),
                      child: Image.asset('assets/osl.png') ,
                    ),
                    radius: 80.0,
                  ),
                ),
              ),Positioned(
                top: 500,
                bottom: 150,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('on Sick Leave',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.lightGreenAccent,
                      fontSize: 16.0,
                    ),),
                ),
              ),
              Positioned(
                top: 500,
                bottom: 50,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => BusinessTravel(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white12,
                    child: Container(
                      padding: EdgeInsets.all(28.0),
                      child: Image.asset('assets/bt.png') ,
                    ),
                    radius: 80.0,
                  ),
                ),
              ),Positioned(
                top: 600,
                bottom: 50,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Business Travel',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.cyanAccent,
                      fontSize: 16.0,
                    ),),
                ),
              ),
              Positioned(
                top: 20,
                bottom: 600,
                left: 6,
                right: 180,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('F I L T E R S',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30.0,
                    color: Colors.amberAccent[400],
                  ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                bottom: 500,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder:(context) => PageViewFilter(),
                        ),
                        );
                  },
                  child: Container(
                    child: Image.asset('assets/onboard.png'),
                  ),
                ),
              ),Positioned(
                top: 620,
                bottom: 10,
                left: 250,
                right: 10,
                child: FlatButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => HomePage(),
                      ),
                    );
                  },
                  label: Text('Go back',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.amberAccent[400],
                  ),
                  ),
                  icon: Icon(Icons.arrow_back_ios,
                  color: Colors.amberAccent[400],),
                ),
              ),
          ],
        ),
        ),
      ),
    );
  }
}
