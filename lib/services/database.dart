import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whereisevery1/models/status.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  //collection ref
  final CollectionReference statusCollection =  Firestore.instance.collection('statuses');

  Future updateUserData(String location, String name, String status) async {
    return await statusCollection.document(uid).setData({
      'location': location,
      'name': name,
      'status': status
    });
  }


  //status list from snapshot
  List<Status> _statusListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Status(
        name: doc.data['name'] ?? '',
        status: doc.data['status'] ?? '',
        location: doc.data['location'] ?? ''
      );
    }).toList();
  }

  // get statuses stream
  Stream<List<Status>> get statuses {
    return statusCollection.snapshots()
    .map(_statusListFromSnapshot);
  }
}