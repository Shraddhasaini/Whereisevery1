import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/home/settings.dart';

class CustomDrawer extends StatelessWidget {
  List<Color> _colors = [Colors.white , Colors.amberAccent[100]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _colors,
            )
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50,
                 right: 50,
                 top: 100,
                 bottom: 480,
                 child: CircleAvatar(
                   backgroundColor: Colors.blueGrey,
                 ),
            ),
            Positioned(
              left: 30,
              right: 30,
              top: 300,
              bottom: 350,
              child: Container(
                color: Colors.blueGrey,
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              top: 300,
              bottom: 350,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              top: 350,
              bottom: 300,
              child: Container(
                color: Colors.blueGrey,
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              top: 350,
              bottom: 300,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              top: 400,
              bottom: 250,
              child: FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('settings'),
                onPressed: () => (),
              )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
