import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Video();
  }

}

class Video extends State<VideoScreen> {

  VideoPlayerController _controller;
  bool isLoaded ;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        isLoaded = true;
        print("video is initialized");

        setState(() {});
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ) : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}