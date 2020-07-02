import 'package:WhereIsEveryone/screens/storage/video.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class StatusList extends StatefulWidget {
  @override
  _StatusListState createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  VideoPlayerController _videoPlayerController;

  StorageReference reference = FirebaseStorage.instance.ref().child('gs://where-is-everyone-statusneo.appspot.com');


  @override
  Widget build(BuildContext context) {

/*    return ListView.builder(
      itemCount: reference.length,
      itemBuilder: (context, index){
        return StatusTile(: statuses[index]);
      },
    );*/
  }
}