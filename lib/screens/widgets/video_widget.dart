import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({required this.videoURL, Key? key}) : super(key: key);
  final String videoURL;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoWidget> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoURL)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller!.pause());
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        VideoPlayer(_controller!),
        _backButton(context),
        _centerVideoControllButtons(),
        Positioned(
          bottom: 6,
          left: 0,
          right: 0,
          child: VideoProgressIndicator(_controller!, allowScrubbing: true),
        ),
      ],
    );
  }

  Center _centerVideoControllButtons() {
    return Center(
      child: IconButton(
        onPressed: () {
          setState(() {
            if (_controller!.value.isPlaying) {
              _controller!.pause();
            } else {
              _controller!.play();
            }
          });
        },
        iconSize: 45,
        icon: Icon(
          (_controller?.value.isPlaying == true)
              ? Icons.pause
              : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }

  Positioned _backButton(BuildContext context) {
    return Positioned(
      top: 20,
      left: 10,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Row(
          children: const <Widget>[
            Icon(Icons.arrow_back_ios_new, size: 18),
            Text(
              ' Back',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
