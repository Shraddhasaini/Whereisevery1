import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:WhereIsEveryone/screens/openuser/shared/OpenCalendar.dart';
import 'package:WhereIsEveryone/screens/openuser/shared/OpenStatus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OpenUserExact extends StatefulWidget {
  final String name;
  final GeoPoint location;
  final String status;
  final String documentID;
  OpenUserExact({ this.name, this.location, this.status,this.documentID});
  @override
  _OpenUserExact createState() => _OpenUserExact();
}

class _OpenUserExact extends State<OpenUserExact> {
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
          OpenLocation(location: widget.location),
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
  Set<Marker> _markers = HashSet<Marker>();

  GoogleMapController _mapController;

  void _setMapStyle(GoogleMapController controller) async {
    String style =  await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    _mapController.setMapStyle(style);
  }

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;

    setState((){
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(widget.location.latitude, widget.location.longitude),
        ),
      );
    });
    _setMapStyle(_mapController);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
          Expanded(
            child: Container(
              width: _width,
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(widget.location.latitude, widget.location.longitude),
                      zoom: 12,
                    ),
                    markers: _markers,
                  ),
                ],
              ),
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

