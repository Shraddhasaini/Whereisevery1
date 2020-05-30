import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/wrapper.dart';
import 'package:whereisevery1/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:whereisevery1/screens/home/statuslist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 600),
          (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context) => HomePage(),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
         child: Column(
             children: <Widget>[
           Center(
             child: TweenAnimationBuilder(
                    duration: Duration(milliseconds: 200),
                   tween: Tween<double>(begin: 0,end: 1),
                  builder: (_, double size, __) {
                   return Transform.scale(scale: size,
                    child: Container(
                      height: 683,
                       decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage('assets/cats.png'),
                   ),
                  ),
                ),
               );
              },
             ),
           ),
         ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().statuses,
      child: Scaffold(
          backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Where is EveryOne'),
          backgroundColor: Colors.amberAccent[100],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async{
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('logout'),
            )
          ],
        ),
        body: StatusList(),
      ),
    );
  }
}

