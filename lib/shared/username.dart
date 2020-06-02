import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/models/users.dart';
import 'package:whereisevery1/services/database.dart';

class UserName extends StatefulWidget {
  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  String _currentName;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){

            UserData userData = snapshot.data;

            return Text(
                    userData.name,
                    style: TextStyle(fontSize: 20.0,
                      fontFamily: 'Montserrat',
                      color: Colors.amberAccent[700],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                  /*SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                ],
              ),
            );*/
          } else{
            return Text(
              ' ',
              style: TextStyle(fontSize: 18.0),
            );
          }
        }
    );
  }
}
