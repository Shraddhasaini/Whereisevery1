import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/models/users.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:whereisevery1/shared/constants.dart';
import 'package:whereisevery1/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> status = ['Working From Home','Working Remotely','on Planned Leave','on Sick Leave','out for Business Travel'];

  String _currentName;
  String _currentLocation;
  String _currentStatus;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData userData = snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your information',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.location,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a location' : null,
                  onChanged: (val) => setState(() => _currentLocation = val),
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: _currentStatus ?? userData.status ,
                  items: status.map((status){
                    return DropdownMenuItem(
                      value: status,
                      child: Text('$status'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentStatus = val),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.amberAccent[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(_currentName);
                    print(_currentLocation);
                    print(_currentStatus);
                  },
                ),
              ],
            ),
          );
        } else{
                return Loading();
        }

      }
    );
  }
}
