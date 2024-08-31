import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomShowVideo extends StatefulWidget {
  final String videoKey;
  final String title;
  const CustomShowVideo(
      {super.key, required this.videoKey, required this.title});

  @override
  State<CustomShowVideo> createState() => _CustomShowVideoState();
}

class _CustomShowVideoState extends State<CustomShowVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    // Pause the video when navigating away
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose");
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          _controller.pause();
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                playedColor: Colors.red, // Color of the played portion
                handleColor: Colors.redAccent, // Color of the handle
                bufferedColor: Colors.white, // Color of the buffered portion
                backgroundColor:
                    Colors.grey, // Background color of the progress bar
              ),
              // progressIndicatorColor: Colors.blueAccent,
            ),
            verticalSpace(16),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Text(
            //     widget.title,
            //     style: Theme.of(context).textTheme.titleLarge,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
