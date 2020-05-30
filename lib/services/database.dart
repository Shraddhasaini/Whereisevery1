import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  //collection ref
  final CollectionReference statusCollection =  Firestore.instance.collection('statuses');

  Future updateUserData(String location, String name, int status) async {
    return await statusCollection.document(uid).setData({
      'location': location,
      'name': name,
      'status': status
    });
  }

  // get statuses stream
  Stream<QuerySnapshot> get statuses {
    return statusCollection.snapshots();
  }
}