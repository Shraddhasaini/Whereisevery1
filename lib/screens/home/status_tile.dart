import 'package:flutter/material.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/screens/openuser/openuser.dart';
import 'package:whereisevery1/screens/openuser/openuser_exactloc.dart';
import 'package:whereisevery1/screens/openuser/openuser_noloc.dart';

class StatusTile extends StatelessWidget {

  final Status status;
  StatusTile({this.status});
  @override
  Widget build(BuildContext context) {
    switch(status.status) {
      case 'Working From Home': {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.white10,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            child: Container(
              child: Image.asset('assets/wfh.png'),
            ),
            //backgroundImage: AssetImage('assets/wfh.png'),
          backgroundColor: Colors.white10,
          ),
          title: Text(status.name,
            style: TextStyle(
              color: Colors.yellowAccent[400],
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () async {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => OpenUserRadius(),
              ),
              );
              },
          isThreeLine: true,
          subtitle: Text(
            'is ${status.status} and ${status.name} is currently at ${status
                .location}',
            style: TextStyle(
              color: Colors.yellowAccent[100],
            ),
          ),
        ),
      ),
    );}
    break;

      case 'Working in Office': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.white10,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/wio.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.tealAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserExact(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.tealAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;

      case 'on Planned Leave': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.white10,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/opl.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.pinkAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserNoLoc(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.pinkAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;


      case 'on Sick Leave': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.white10,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/osl.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.lightGreenAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserNoLoc(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.lightGreenAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;


      case 'out for Business Travel': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.white10,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/bt.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.cyanAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserExact(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.cyanAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;

  }
  }
}



































class FilterStatusTile extends StatelessWidget {

  final Filter status;
  FilterStatusTile({this.status});
  @override
  Widget build(BuildContext context) {
    switch(status.status) {
      case 'Working From Home': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/wfh.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.yellowAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserRadius(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.yellowAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;

      case 'Working in Office': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/wio.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.tealAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserExact(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.tealAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;

      case 'on Planned Leave': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/opl.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.pinkAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserNoLoc(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.pinkAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;


      case 'on Sick Leave': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/osl.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.lightGreenAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserNoLoc(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.lightGreenAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;


      case 'out for Business Travel': {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Container(
                  child: Image.asset('assets/bt.png'),
                ),
                //backgroundImage: AssetImage('assets/wfh.png'),
                backgroundColor: Colors.white10,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.cyanAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenUserExact(),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${status.status} and ${status.name} is currently at ${status
                    .location}',
                style: TextStyle(
                  color: Colors.cyanAccent[100],
                ),
              ),
            ),
          ),
        );}
      break;
    }
  }
}
