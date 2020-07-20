import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/models/status.dart';
import 'package:WhereIsEveryone/screens/home/filter/onboarding.dart';
import 'package:WhereIsEveryone/screens/home/home.dart';
import 'package:WhereIsEveryone/services/database.dart';
import 'package:WhereIsEveryone/shared/filterstatustile.dart';

class WorkFromHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return StreamProvider<List<Status>>.value(
    value: DatabaseService().wfh,
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
                  child: Image.asset('assets/wfh.png',fit: BoxFit.fitWidth),
                ),
              ),
                Positioned(
                  left: 30,
                  right: 30,
                  top: 0.39*_height,
                  bottom: 0.51*_height,
                  child: Container(
                    child: Text(
                      'Working From Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontFamily: 'Montserrat',
                        fontSize: _width*0.06,
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
                    child: StatusListWFH(),
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
                        color: Colors.yellowAccent,
                      ),
                    ),
                    icon: Icon(Icons.arrow_back_ios,
                      color: Colors.yellowAccent,),
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
                        color: Colors.yellowAccent[100],
                      ),
                    ),
                    icon: Icon(Icons.home,
                      color: Colors.yellowAccent[100],),
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
