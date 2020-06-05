import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/screens/home/filter/onboarding.dart';
import 'package:whereisevery1/screens/home/home.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:whereisevery1/shared/filterstatustile.dart';

class OnSickLeave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Status>>.value(
      value: DatabaseService().osl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 80,
                  right: 80,
                  top: 50,
                  bottom: 400,
                  child: Container(
                    child: Image.asset('assets/osl.png',fit: BoxFit.fitWidth),
                  ),
                ),
                Positioned(
                  left: 30,
                  right: 30,
                  top: 250,
                  bottom: 350,
                  child: Container(
                    child: Text(
                      'Sick Leave',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontFamily: 'Montserrat',
                        fontSize: 33.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 300,
                  bottom: 80,
                  child: Container(
                    //color: Colors.black,
                    child: StatusListOSL(),
                  ),
                ),
                Positioned(
                  top: 620,
                  bottom: 10,
                  left: 250,
                  right: 10,
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:(context) => OnboardingHome(),
                        ),
                      );
                    },
                    label: Text('Go back',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    icon: Icon(Icons.arrow_back_ios,
                      color: Colors.lightGreenAccent,),
                  ),
                ),
                Positioned(
                  top: 620,
                  bottom: 10,
                  left: 10,
                  right: 250,
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:(context) => HomePage(),
                        ),
                      );
                    },
                    label: Text('Home',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.lightGreenAccent[100],
                      ),
                    ),
                    icon: Icon(Icons.home,
                      color: Colors.lightGreenAccent[100],),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}