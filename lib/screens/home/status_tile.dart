import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/screens/openuser/openuser.dart';
import 'package:whereisevery1/screens/openuser/openuser_exactloc.dart';
import 'package:whereisevery1/screens/openuser/openuser_noloc.dart';

class StatusTile extends StatefulWidget {
  final Status status;
  StatusTile({this.status});

  @override
  _StatusTileState createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  String _currentAddress;


  @override
  Widget build(BuildContext context) {
    _getAddressFromLatLng();
    switch(widget.status.status) {
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
          title: Text(widget.status.name,
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
              builder: (context) => OpenUserRadius(status: widget.status.status, name: widget.status.name, location: widget.status.location),
              ),
              );
              },
          isThreeLine: true,
          subtitle: Text(
            'is ${widget.status.status} and ${widget.status.name} is currently at ${_currentAddress}',
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserExact(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and ${widget.status.name} is currently at ${_currentAddress}',
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserNoLoc(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and the location of ${widget.status.name} cannot be accessed',
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserNoLoc(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and the location of ${widget.status.name} cannot be accessed',
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserExact(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and ${widget.status.name} is currently at ${_currentAddress}',
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

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          widget.status.location.latitude, widget.status.location.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}



































class FilterStatusTile extends StatefulWidget {

  final Filter status;
  FilterStatusTile({this.status});

  @override
  _FilterStatusTileState createState() => _FilterStatusTileState();
}

class _FilterStatusTileState extends State<FilterStatusTile> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  String _currentAddress;
  @override
  Widget build(BuildContext context) {
    _getAddressFromLatLng();
    switch(widget.status.status) {
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserRadius(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and ${widget.status.name} is currently at ${_currentAddress}',
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserExact(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and ${widget.status.name} is currently at ${_currentAddress}',
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserNoLoc(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and the location of ${widget.status.name} cannot be accessed',
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserNoLoc(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and the location of ${widget.status.name} cannot be accessed',
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
              title: Text(widget.status.name,
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
                    builder: (context) => OpenUserExact(status: widget.status.status, name: widget.status.name, location: widget.status.location),
                  ),
                );
              },
              isThreeLine: true,
              subtitle: Text(
                'is ${widget.status.status} and ${widget.status.name} is currently at ${_currentAddress}',
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

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          widget.status.location.latitude, widget.status.location.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

}
