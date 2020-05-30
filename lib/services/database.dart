import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/models/users.dart';

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

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      location: snapshot.data['location'],
      status: snapshot.data['status']
    );
  }

  // get statuses stream
  Stream<List<Status>> get statuses {
    return statusCollection.snapshots()
    .map(_statusListFromSnapshot);
  }

  //get user doc stream
 Stream<UserData> get userData {
    return statusCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
 }

}