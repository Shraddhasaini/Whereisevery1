import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:WhereIsEveryone/models/status.dart';
import 'package:WhereIsEveryone/models/users.dart';

class DatabaseServiceForFilter {
  final String name;
  DatabaseServiceForFilter({ this.name });
  //collection ref
  final CollectionReference statusCollection =  Firestore.instance.collection('statuses');

  //filter

  List<Filter> _filterListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Filter(
          name: doc.data['name'] ?? '',
          status: doc.data['status'] ?? '',
          location: doc.data['location'] ?? '',
          documentID: doc.documentID
      );
    }).toList();
  }

  // get filtered statuses stream
  Stream<List<Filter>> get filtered {
    return statusCollection.where('name', isEqualTo: name).snapshots()
        .map(_filterListFromSnapshot);
  }
}