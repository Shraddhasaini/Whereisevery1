import 'package:cloud_firestore/cloud_firestore.dart';

class Status {
  final String name;
  final GeoPoint location;
  final String status;
  Status({ this.name, this.location, this.status});

}


class Filter {
  //final String search;
  final String name;
  final GeoPoint location;
  final String status;
  Filter({ this.name, this.location, this.status});
}


class Onboard {
  //final String search;
  final String name;
  final GeoPoint location;
  final String status;
  Onboard({ this.name, this.location, this.status});
}
