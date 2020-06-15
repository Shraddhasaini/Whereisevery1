import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenStatus extends StatelessWidget
{
  final String name;
  final String status;
  OpenStatus({ this.name,this.status});
  @override
  Widget build(BuildContext context) {
    switch(status) {
      case 'Working From Home':
        {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(' Status',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'Montserrat',
                        color: Colors.amberAccent[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        child: Image.asset('assets/opinion.png'),
                      ),
                    )
                  ],
                ),
                Text(name,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Montserrat',
                    color: Colors.yellowAccent[400],
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/wfh.png')),
                ),
                Text(status,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                    color: Colors.yellowAccent[400],
                  ),
                ),
                SizedBox(height: 3),
                Text('Scroll Down to view the geolocation',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Montserrat',
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          );
        }
        break;

      case 'Working in Office':
        {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(' Status',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'Montserrat',
                        color: Colors.amberAccent[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        child: Image.asset('assets/opinion.png'),
                      ),
                    )
                  ],
                ),
                Text(name,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Montserrat',
                    color: Colors.tealAccent[400],
                  ),
                ),
                Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/wio.png')),
                Text(status,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                    color: Colors.tealAccent[400],
                  ),
                ),
                SizedBox(height: 3),
                Text('Scroll Down to view the geolocation',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Montserrat',
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          );

        }
        break;

          case 'on Planned Leave':
        {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(' Status',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'Montserrat',
                        color: Colors.amberAccent[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        child: Image.asset('assets/opinion.png'),
                      ),
                    )
                  ],
                ),
                Text(name,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Montserrat',
                    color: Colors.pinkAccent[400],
                  ),
                ),
                Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/opl.png')),
                Text(status,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                    color: Colors.pinkAccent[400],
                  ),
                ),
                SizedBox(height: 3),
                Text('Scroll Down to view the geolocation',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Montserrat',
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          );
        }
        break;
        case 'on Sick Leave':
      {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(' Status',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontFamily: 'Montserrat',
                      color: Colors.amberAccent[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image.asset('assets/opinion.png'),
                    ),
                  )
                ],
              ),
              Text(name,
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Montserrat',
                  color: Colors.lightGreenAccent[400],
                ),
              ),
              Container(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/osl.png')),
              Text(status,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Montserrat',
                  color: Colors.lightGreenAccent[400],
                ),
              ),
              SizedBox(height: 3),
              Text('Scroll Down to view the geolocation',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Montserrat',
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        );

      }
      break;
        case 'out for Business Travel':
        {

          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(' Status',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'Montserrat',
                        color: Colors.amberAccent[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        child: Image.asset('assets/opinion.png'),
                      ),
                    )
                  ],
                ),
                Text(name,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Montserrat',
                    color: Colors.cyanAccent[400],
                  ),
                ), 
                Container(
                  height: 300,
                    width: 300,
                    child: Image.asset('assets/bt.png')),
                Text(status,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                    color: Colors.cyanAccent[400],
                  ),
                ),
                SizedBox(height: 3),
                Text('Scroll Down to view the geolocation',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Montserrat',
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          );
        }
        break;




        }
    }
}
