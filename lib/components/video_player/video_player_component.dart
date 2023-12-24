import 'package:flutter/material.dart';
import 'package:tiktok/components/video_player_progress_bar/video_player_progress_bar_component.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerComponent extends StatefulWidget {
  final String media;

  const VideoPlayerComponent({
    super.key,
    required this.media,
  });

  @override
  State<VideoPlayerComponent> createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late VideoPlayerController _controller;
  double _position = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      widget.media,
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (_controller.value.position.inMilliseconds > 0) {
        setState(() {
          _position = double.parse((_controller.value.position.inMilliseconds /
                  _controller.value.duration.inMilliseconds)
              .toStringAsFixed(2));
        });
      }
    });

    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _controller.value.isInitialized
          ? SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            )
          : Container(),
      Positioned(
        bottom: 95.0,
        left: 0.0,
        right: 0.0,
        child: VideoPlayerProgressBarComponent(
          progress: _position,
          onTap: (position) {
            _controller.seekTo(Duration(
                microseconds:
                    (_controller.value.duration.inMilliseconds * position)
                        .toInt()));
            setState(() => _position = position);
          },
        ),
      ),
    ]);
  }
}
