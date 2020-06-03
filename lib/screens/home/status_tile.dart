import 'package:flutter/material.dart';
import 'package:whereisevery1/models/status.dart';

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
            //backgroundImage: AssetImage('assets/plantstatus.png'),
            backgroundColor: Colors.white30,
          ),
          title: Text(status.name,
            style: TextStyle(
              color: Colors.yellowAccent[400],
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
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
                //backgroundImage: AssetImage('assets/iconlogo.png'),
                backgroundColor: Colors.tealAccent[700],
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.tealAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                //backgroundImage: AssetImage('assets/iconlogo.png'),
                backgroundColor: Colors.pinkAccent,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.pinkAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                //backgroundImage: AssetImage('assets/iconlogo.png'),
                backgroundColor: Colors.lightGreenAccent,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.lightGreenAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                //backgroundImage: AssetImage('assets/iconlogo.png'),
                backgroundColor: Colors.cyan,
              ),
              title: Text(status.name,
                style: TextStyle(
                  color: Colors.cyanAccent[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
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
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.white10,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.tealAccent[700],
          ),
          title: Text(status.name,
            style: TextStyle(
              color: Colors.teal,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          isThreeLine: true,
          subtitle: Text('is ${status.status} and ${status.name} is currently at ${status.location}',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
