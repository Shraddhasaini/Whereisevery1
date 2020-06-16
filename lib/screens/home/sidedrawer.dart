import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:WhereIsEveryone/models/status.dart';
import 'package:WhereIsEveryone/screens/home/settingPage.dart';
import 'package:WhereIsEveryone/screens/home/settings.dart';
import 'package:WhereIsEveryone/screens/home/sidedrawer.dart';
//import 'package:WhereIsEveryone/screens/wrapper.dart';
import 'package:WhereIsEveryone/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/services/database.dart';
import 'package:WhereIsEveryone/screens/home/statuslist.dart';
import 'package:WhereIsEveryone/shared/myappbar.dart';
import 'package:WhereIsEveryone/shared/username.dart';

class CustomDrawer extends StatelessWidget {
  List<Color> _colors = [Colors.white , Colors.amberAccent[100]];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Status>>.value(
      value: DatabaseService().statuses,
    child: Drawer(
      child: Container(
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context) => SettingsFormPage(),
                    ),
                  );
                } ,
              )
              ),

          ],
        ),
        ),
    ),
    );
  }
}
