import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/models/users.dart';
import 'package:WhereIsEveryone/screens/home/sidedrawer.dart';
import 'package:WhereIsEveryone/services/database.dart';
import 'package:WhereIsEveryone/shared/constants.dart';
import 'package:WhereIsEveryone/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> status = ['Working From Home','Working in Office','on Planned Leave','on Sick Leave','out for Business Travel'];

  String _currentName;
  GeoPoint _currentLocation;
  Position _currentPosition;
  //GeoPoint geoPoint = userData.location.getGeoPoint("position");

  String _currentStatus;
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;

  void _setMapStyle(GoogleMapController controller) async {
    String style =  await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    _mapController.setMapStyle(style);
  }

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;

    setState((){
      if (_currentPosition != null)
      _markers.add(
          Marker(
              /*onTap: () {
                print('Tapped');
              },*/
              /*draggable: true,*/
              markerId: MarkerId('Marker'),
              position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
              onDragEnd: ((value) {
                print(value.latitude);
                print(value.longitude);
              }))
      );
    });
    _setMapStyle(_mapController);
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your information',
                  style: TextStyle(fontSize: 18.0,
                  fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent[400]
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  style: TextStyle(fontSize: 18.0,
                      fontFamily: 'Montserrat',
                      color: Colors.amberAccent[400]
                  ),
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  style: TextStyle(fontSize: 18.0,
                      fontFamily: 'Montserrat',
                      color: Colors.amberAccent[400]
                  ),
                  iconEnabledColor: Colors.amberAccent[400],
                  decoration: textInputDecoration,
                  value: _currentStatus ?? userData.status ,
                  items: status.map((status){
                    return DropdownMenuItem(
                      value: status,
                      child: Text('$status',
                        style: TextStyle(fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            color: Colors.amberAccent[400]
                        ),),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentStatus = val),
                ),
                SizedBox(height: 20.0),
                /*TextFormField(
                  initialValue: userData.location.toString(),
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a location' : null,
                  onChanged: (val) => setState(() => _currentLocation = val),
                ),*/
                FlatButton.icon(
                  icon: Icon(Icons.location_on,
                    color: Colors.amberAccent[400],),
                  label: Text("Get location",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.amberAccent[400]
                    ),
                  ),
              onPressed: () {
                _getCurrentLocation();
                _currentLocation = GeoPoint(_currentPosition.latitude,_currentPosition.longitude);
              },
                ),
                if (_currentPosition != null)
                  Container(
                    height: 300,
                    width: 360,
                    child: Stack(
                      children: <Widget>[
                        GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(_currentPosition.latitude,_currentPosition.longitude),
                            zoom: 12,
                          ),
                          markers: _markers,
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.amberAccent[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.black,
                    fontFamily: 'Montserrat'
                    ),
                  ),
                  onPressed: () async {
                    //if(_formKey.currentState.validate()) {
                    if (_currentPosition != null)
                      await DatabaseService(uid: user.uid).updateUserData(
                          GeoPoint(_currentPosition.latitude,_currentPosition.longitude) ?? userData.location,
                          _currentName ?? userData.name,
                          _currentStatus ?? userData.status
                      );
                      Navigator.pop(context);
                   // }
                  },
                ),
              ],
            ),
          );
        } else{
                return Text(
                  'You are in View-mode. To update your information you need to register your account',
                  style: TextStyle(fontSize: 18.0),
                );
        }
      }
    );
  }
  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}

