import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/openuser/shared/OpenCalendar.dart';
import 'package:whereisevery1/screens/openuser/shared/OpenStatus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class OpenUserRadius extends StatefulWidget {
  final String name;
  final GeoPoint location;
  final String status;
  final String documentID;
  OpenUserRadius({ this.name, this.location, this.status,this.documentID});

  @override
  _OpenUserRadius createState() => _OpenUserRadius();
}

class _OpenUserRadius extends State<OpenUserRadius> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('StatusNeo',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Montserrat'
          ),
        ),
      ),
      body: PageView(
        pageSnapping: true,
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          OpenStatus(name: widget.name,status: widget.status,),
          OpenLocation(location: widget.location,),
          OpenCalendar(documentID: widget.documentID),
        ],
      ),
    );
  }
}

class OpenLocation extends StatefulWidget {
  final GeoPoint location;
  OpenLocation({this.location});
  @override
  _OpenLocationState createState() => _OpenLocationState();
}

class _OpenLocationState extends State<OpenLocation> {
  Set<Circle> _circles = HashSet<Circle>();
  GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    _setCircles();
  }

  void _setMapStyle(GoogleMapController controller) async {
    String style =  await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    _mapController.setMapStyle(style);
  }


  void _setCircles(){
    _circles.add(
      Circle(
          circleId: CircleId("0"),
          center: LatLng(widget.location.latitude, widget.location.longitude),
          radius: 700,
          //strokeWidth: 2,
          fillColor: Color.fromRGBO(255,196,0, 0.5),
      ),
    );

  }

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;

    setState((){
    });
    _setMapStyle(_mapController);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(' Geolocation',
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'Montserrat',
                color: Colors.amberAccent[400],
              ),),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 100.0,
                width: 100.0,
                child: Image.asset('assets/loc.png'),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      Container(
        height: 420,
        width: 350,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
              target: LatLng(widget.location.latitude, widget.location.longitude),
              zoom: 12,
          ),
              circles: _circles,
          ),
        ],
        ),
      ),
        SizedBox(height: 20),
        Text('Scroll Down to view the calendar',
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Montserrat',
          color: Colors.white38,
        ),
      ),
      ],),
    );
  }
}

