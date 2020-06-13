import 'package:cloud_firestore/cloud_firestore.dart';

class Status {
  final String name;
  final GeoPoint location;
  final String status;
  final String documentID;
  Status({ this.name, this.location, this.status, this.documentID});

}


class Filter {
  //final String search;
  final String name;
  final GeoPoint location;
  final String status;
  final String documentID;
  Filter({ this.name, this.location, this.status,this.documentID});
}


class Onboard {
  //final String search;
  final String name;
  final GeoPoint location;
  final String status;
  final String documentID;
  Onboard({ this.name, this.location, this.status,this.documentID});
}

class MyEvent {
  final Timestamp date;
  final String status;
  MyEvent({ this.date, this.status});
}