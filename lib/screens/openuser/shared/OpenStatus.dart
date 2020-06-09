import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                ),),
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
          Text('Scroll Down to view the calendar',
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
}
