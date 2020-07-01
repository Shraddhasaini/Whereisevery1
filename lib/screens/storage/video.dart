import 'package:WhereIsEveryone/models/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';


class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _videoPlayerController;
  File _videoFile;
  bool _uploaded = false;
  String _downloadURL;
 final _picker = ImagePicker();
  int _counter = 0;


  StorageReference reference = FirebaseStorage.instance.ref();

  Future getVideo (bool isCamera) async {
    PickedFile video;
    if(isCamera) {
      video = await _picker.getVideo(source: ImageSource.camera);

    } else {
      video = await _picker.getVideo(source: ImageSource.gallery);
    }
    _videoFile = File(video.path);
    _videoPlayerController = VideoPlayerController.file(_videoFile)..initialize().then((_) {
      setState(() {
      });
      _videoPlayerController.play();
    });
  }


  Future uploadImage () async{
   final user = Provider.of<User>(context);
   String _userID = user.uid.toString();
    StorageUploadTask uploadTask = reference.child(_userID+'video$_counter.mp4').putFile(_videoFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      _uploaded = true;
    });
  }

  Future downloadImage() async {
    String downloadAddress = await reference.getDownloadURL();
    setState(() {
      _downloadURL = downloadAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            onPressed: (){
              getVideo(false);
            },
            icon: Icon(Icons.file_upload,
            color: Colors.white,),
          ),
          IconButton(
            onPressed: (){
              getVideo(true);
            },
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
            Divider(height: 20,),
            if(_videoFile != null)
              _videoPlayerController.value.initialized
                  ? Stack(
                    children: <Widget>[
                      AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio*5.2,
                child: VideoPlayer(_videoPlayerController),
              ),
                      _uploaded == false ?
                      FlatButton.icon(
                      onPressed: (){
                        _counter++;
                      uploadImage();
                      showAlertDialog(context);
                      },
                      color: Colors.black26,
                      icon: Icon(Icons.cloud_upload,
                      color: Colors.white),
                      label: Text('Add to highlights',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Montserrat'
                      ),
                      ),
                      )
                          : RaisedButton.icon(
                        icon: Icon(Icons.file_download,
                          color: Colors.white,
                        ),
                        color: Colors.black26,
                        label: Text('Download',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Montserrat'
                          ),
                        ),
                        onPressed: (){
                          downloadImage();
                          showAlertDialog1(context);
                        },
                      ),
                      _downloadURL == null ? Container() : Image.network(_downloadURL),
           ],
             )
                  : Container(),


          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  /*Widget okButton = FlatButton(
    color: Colors.white10,
    child: Text("OK",
    style: TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white
    ),
    ),
    onPressed: () {

    },*/
  //);


  AlertDialog alert = AlertDialog(
    elevation: 24.0,
    backgroundColor: Colors.black54,
    title: Text('Posted!',
      style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.amberAccent[400]
      ),
    ),
    content: Text('Your video is now posted to highlights',
      style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white
      ),
    ),
    actions: [
      // okButton,
    ],
  );


  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog1(BuildContext context) {
  // Create button
  /*Widget okButton = FlatButton(
    color: Colors.white10,
    child: Text("OK",
    style: TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white
    ),
    ),
    onPressed: () {

    },*/
  //);


  AlertDialog alert = AlertDialog(
      elevation: 24.0,
      backgroundColor: Colors.black54,
      title: Text('Downloaded!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.amberAccent[400]
        ),
      ),
);


  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return alert;
    },
  );
}