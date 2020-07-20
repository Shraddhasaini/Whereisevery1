import 'package:flutter/material.dart';
import 'package:WhereIsEveryone/screens/home/filter/screen/bt.dart';
import 'package:WhereIsEveryone/screens/home/filter/screen/opl.dart';
import 'package:WhereIsEveryone/screens/home/filter/screen/osl.dart';
import 'package:WhereIsEveryone/screens/home/filter/screen/pageview.dart';
import 'package:WhereIsEveryone/screens/home/filter/screen/wfh.dart';
import 'package:WhereIsEveryone/screens/home/filter/screen/wio.dart';
import 'package:WhereIsEveryone/screens/home/home.dart';

class OnboardingHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
          Positioned(
            top: _height*0.14,
            bottom: _height*0.65,
            left: 10,
            right: 200,
            child: FlatButton(
              splashColor: Colors.yellowAccent,
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
                top: 0.29*_height,
                bottom: _height*0.65,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Working from Home',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.yellowAccent,
                    fontSize: _width*0.036,
                  ),),
                ),
              ),
              Positioned(
                top: 0.29*_height,
                bottom: 0.51*_height,
                left: 200,
                right: 10,
                child: FlatButton(
                  splashColor: Colors.tealAccent,
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
                top: 0.43*_height,
                bottom: 0.51*_height,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Working in Office',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.tealAccent,
                      fontSize: _width*0.036,
                    ),),
                ),
              ),
              Positioned(
                top: 0.43*_height,
                bottom: 0.36*_height,
                left: 10,
                right: 200,
                child: FlatButton(
                  splashColor: Colors.pinkAccent,
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
                top: 0.58*_height,
                bottom: 0.36*_height,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('on Planned Leave',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.pinkAccent,
                      fontSize: _width*0.036,
                    ),),
                ),
              ),
              Positioned(
                top: 0.58*_height,
                bottom: 0.21*_height,
                left: 200,
                right: 10,
                child: FlatButton(
                  splashColor: Colors.lightGreenAccent,
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
                top: 0.73*_height,
                bottom: 0.21*_height,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('on Sick Leave',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.lightGreenAccent,
                      fontSize: _width*0.036,
                    ),),
                ),
              ),
              Positioned(
                top: _height*0.73,
                bottom: _height*0.07,
                left: 10,
                right: 200,
                child: FlatButton(
                  splashColor: Colors.cyanAccent,
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
                top: 0.87*_height,
                bottom: _height*0.07,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Business Travel',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.cyanAccent,
                      fontSize: _width*0.036,
                    ),),
                ),
              ),
              Positioned(
                top: 0.02*_height,
                bottom: 0.87*_height,
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
                top: 0.02*_height,
                bottom: 0.73*_height,
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
                top: _height*0.9,
                bottom: 30,
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
