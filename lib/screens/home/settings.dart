import 'package:flutter/material.dart';
import 'package:whereisevery1/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<int> status = [0,1,2,3,4];

  String _currentName;
  String _currentLocation;
  int _currentStatus;

  @override
  Widget build(BuildContext context) {
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
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a location' : null,
            onChanged: (val) => setState(() => _currentLocation = val),
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentStatus ?? 2 ,
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
  }
}
