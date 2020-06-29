import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text('Highlights',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Montserrat'
          ),
        ),
        leading: IconButton(
          alignment: AlignmentDirectional.centerEnd,
          splashColor: Colors.amberAccent,
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_upload,
            color: Colors.white,),
          ),
          IconButton(
            icon: Icon(Icons.camera_alt,
              color: Colors.white,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Divider(height: 10,),
            Container(color: Colors.red, child: Text('qwertyui'),),
            Divider(height: 10,),
            Container(color: Colors.blue, child: Text('qwertyui'),),
            Divider(height: 10,),
            Container(color: Colors.red, child: Text('qwertyui'),),
            Divider(height: 10,),
            Container(color: Colors.blue, child: Text('qwertyui'),),
            Divider(height: 10,),
            Container(color: Colors.red, child: Text('qwertyui'),),
            Divider(height: 10,),
            Container(color: Colors.blue, child: Text('qwertyui'),),
          ],
        ),
      ),
    );
  }
}
