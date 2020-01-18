import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/src/videos/video_service.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  VideoPlayerController _controller;
  final List<VideoPlayerController> _videoList = [];
  VoidCallback _listener;
  BaseVideoService _videoService;

  @override
  void initState() {
    super.initState();
    _videoService = VideoService();
    _listener = () {
      setState(() {});
    };
    _initVideo();

  }

  @override
  void deactivate() {
    _controller.setVolume(0.0);
    _controller.removeListener(_listener);
    super.deactivate();
  }

  _initVideo() {


    _controller =VideoPlayerController.network(_videoService.getVideo())
      ..addListener(_listener)
      ..setVolume(0.25)
      ..setLooping(true)
      ..initialize()
      ..play();
    // ADD next video to list que //
    _videoList.add(  VideoPlayerController.network(_videoService.getVideo())
      ..addListener(_listener)..initialize());

  }

  _nextVideo() {
    _controller.pause();
    _controller.removeListener(_listener);
    _controller = _videoList.removeAt(0);
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.25);
    _videoList.add(  VideoPlayerController.network(_videoService.getVideo())
      ..addListener(_listener)
      ..initialize());
    }

  @override
  Widget build(BuildContext context) {
    final Function _nextVideoFunction = () => _nextVideo();

    return Scaffold(
        body:GestureDetector(
          onTap: _nextVideoFunction,
          onVerticalDragCancel: _nextVideoFunction,
            onHorizontalDragCancel: _nextVideoFunction,
          child: Stack(
            children: <Widget>[
          Container(
          color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
              Center(
                  child:  Container(
                    child: _controller != null
                        ?  AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller))
                        : Text('no video'),
                  ))
            ],
          )));

  }
}
