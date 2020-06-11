import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;

  User({ this.uid });

}

class UserData {
  final String uid;
  final String name;
  final GeoPoint location;
  final String status;

  UserData({ this.uid,this.name,this.location,this.status});
}

class UserCalData {
  final String uid;
  final Timestamp date;
  final String status;

  UserCalData({ this.uid,this.date, this.status});
}