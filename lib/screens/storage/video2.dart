import 'package:flutter/material.dart';
import 'dart:io';

import 'package:video_player/video_player.dart';

class VideoTwo extends StatefulWidget {
  @override
  _VideoTwoState createState() => _VideoTwoState();
}

class _VideoTwoState extends State<VideoTwo> {
  VideoPlayerController _controller;


  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/where-is-everyone-statusneo.appspot.com/o/190111_08_BuildingsTraffic_Drone_20.mp4?alt=media&token=cf50f7e3-2498-4cb5-a79d-8959adc6b7dc')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Divider(height: 30),
          Stack(
            //alignment: Alignment.bottomCenter,
            children: <Widget>[
              _controller.value.initialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Container(),
              FloatingActionButton(
                backgroundColor: Colors.amberAccent[400],
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ],
          ),

          Divider(height: 40),
          Text('Slide to see more Highlights',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Sacramento',
                fontSize: 50,
                color: Colors.white24
            ),
          ),

        ]
    );
  }
}
