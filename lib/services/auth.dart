import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whereisevery1/models/users.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
   final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }
  //sign in ano
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
        print(e.toString());
        return null;
    }
  }
  //signin with email pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create a document for user with uid
      await DatabaseService(uid: user.uid).updateUserData(GeoPoint(37.77483, -122.4192), 'new member', 'Working From Home');
      await DatabaseService(uid: user.uid).createSubCollection(Timestamp.now(), 'Working From Home');
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register with google
  Future googleSignIn() async {
    try{
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser user =  result.user;
      print("signed in " + user.displayName);
      //create a document for user with ui
      //create a document for user with uid
      await DatabaseService(uid: user.uid).updateUserData(GeoPoint(37.77483, -122.4192), _googleSignIn.currentUser.displayName , 'Working From Home');
      await DatabaseService(uid: user.uid).createSubCollection(Timestamp.now(), 'Working From Home');
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

// login with Google
   Future googleSignIn1() async {
     try{
       print('trying to sign in');
       GoogleSignInAccount googleUser = await _googleSignIn.signIn();
       GoogleSignInAuthentication googleAuth = await googleUser.authentication;
       final AuthCredential credential = GoogleAuthProvider.getCredential(
           accessToken: googleAuth.accessToken,
           idToken: googleAuth.idToken
       );
       AuthResult result = await _auth.signInWithCredential(credential);
       FirebaseUser user =  result.user;
       print("signed in " + user.displayName);
       //create a document for user with uid
       return _userFromFirebaseUser(user);
     } catch(e){
       print(e.toString());
       return null;
     }
   }

  //signout
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}