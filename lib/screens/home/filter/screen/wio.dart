import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/screens/home/filter/onboarding.dart';
import 'package:whereisevery1/screens/home/home.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:whereisevery1/shared/filterstatustile.dart';

class WorkingInOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return StreamProvider<List<Status>>.value(
      value: DatabaseService().wio,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 80,
                  right: 80,
                  top: 0.073*_height,
                  bottom: 0.6*_height,
                  child: Container(
                    child: Image.asset('assets/wio.png',fit: BoxFit.fitWidth),
                  ),
                ),
                Positioned(
                  left: 30,
                  right: 30,
                  top: 0.39*_height,
                  bottom: 0.51*_height,
                  child: Container(
                    child: Text(
                      'Working in Office',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.tealAccent,
                        fontFamily: 'Montserrat',
                        fontSize: 33.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 0.439*_height,
                  bottom: 0.117*_height,
                  child: Container(
                    //color: Colors.black,
                    child: StatusListWIO(),
                  ),
                ),
                Positioned(
                  top: 0.907*_height,
                  bottom: 0.014*_height,
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
                        color: Colors.tealAccent,
                      ),
                    ),
                    icon: Icon(Icons.arrow_back_ios,
                      color: Colors.tealAccent,),
                  ),
                ),
                Positioned(
                  top: 0.907*_height,
                  bottom: 0.014*_height,
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
                        color: Colors.tealAccent[100],
                      ),
                    ),
                    icon: Icon(Icons.home,
                      color: Colors.tealAccent[100],),
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