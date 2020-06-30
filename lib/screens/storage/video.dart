import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  StorageReference reference = FirebaseStorage.instance.ref().child('myvideo.mp4');

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
    StorageUploadTask uploadTask = reference.putFile(_videoFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      _uploaded = true;
    });
  }

  Future downloadImage() async {
    String downloadAddress = await _reference.getDownloadURL();
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
            FlatButton.icon(
                onPressed: (){
                 uploadImage();
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
            ),
                      _uploaded == false ? Container() : RaisedButton(
                        child: Text('Download'),
                        onPressed: (){
                          downloadImage();
                        },
                      ),
                      _downloadURL == null ? Container() : Image.network(_downloadURL),

           ],
             )
                  : Container(),
            /*_videoFile == null ? Container() : Image.file(_videoFile),*/
            Divider(height: 10,),
           // _videoFile == null ? Container() : Video.file(_videoFile),
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
