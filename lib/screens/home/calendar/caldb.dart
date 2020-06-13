import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whereisevery1/models/status.dart';

class DatabaseCalService {
  final String documentID;
  DatabaseCalService({ this.documentID });
  //collection ref
  final CollectionReference statusCollection =  Firestore.instance.collection('statuses');
//  final CollectionReference calCollection = Firestore.instance.collection('statuses').document(documentID).collection('caldb');

  //cal list from snapshot
  List<MyEvent> _eventListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return MyEvent(
        date: doc.data['name'] ?? '',
        status: doc.data['status'] ?? '',
      );
    }).toList();
  }

  // get events stream
  Stream<List<MyEvent>> get events {
    return statusCollection.document(documentID).collection('caldb').snapshots()
        .map(_eventListFromSnapshot);
  }


}