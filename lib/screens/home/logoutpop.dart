import 'package:flutter/material.dart';
import 'package:WhereIsEveryone/screens/authenticate/sign_in.dart';
import 'package:WhereIsEveryone/screens/home/home.dart';
import 'package:WhereIsEveryone/services/auth.dart';

class LogOut extends StatelessWidget {
  final AuthService _auth = AuthService();
  List<Color> _colors = [Colors.white , Colors.amberAccent[100]];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _colors,
              )
          ),
         // child: Text('Do you want to logout?',
            child: FlatButton.icon(
              icon: Icon(Icons.person,
                color: Colors.teal,
              ),
              label: Text('logout',
                style:TextStyle(
                    color: Colors.teal,
                    fontSize: 15.0,
                    fontFamily: 'Montserrat'
                ),
              ),
              onPressed: () async{
                await _auth.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context) => HomePage(),
                  ),
                );
              },
            ),
          ),
    );
  }
}
