import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/models/users.dart';

class DatabaseServiceCal {

  final String uid;
  DatabaseServiceCal({ this.uid });
  //collection ref
  final CollectionReference calCollection =  Firestore.instance.collection('calendar');

  Future updateUserCalData(Timestamp date, String status) async {
    return await calCollection.document(uid).setData({
      'date': date,
      'status': status
    });
  }
  //userData from snapshot
  UserCalData _usercalDataFromSnapshot(DocumentSnapshot snapshot){
    return UserCalData(
        uid: uid,
        date: snapshot.data['date'],
        status: snapshot.data['status']
    );
  }

  //get user doc stream
  Stream<UserCalData> get usercalData {
    return calCollection.document(uid).snapshots()
        .map(_usercalDataFromSnapshot);
  }

}