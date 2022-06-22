import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class TradingVideo extends StatefulWidget {
  const TradingVideo({Key? key}) : super(key: key);

  @override
  _TradingVideoState createState() => _TradingVideoState();
}

class _TradingVideoState extends State<TradingVideo> {
  late VideoPlayerController controller; // used to controller videos
  late Future<void>
      futureController; // network takes time to load video, so to control future video data

  @override
  void initState() {
    //url to load network
    controller = VideoPlayerController.network(
        "https://www.youtube.com/watch?v=S2nBBMbjS8w");
    futureController = controller.initialize();

    controller.setLooping(
        true); // this will keep video looping active, means video will keep on playing
    controller.setVolume(25.0); // default  volume to initially play the video
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); // when app is been closed destroyed the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: FutureBuilder(
            future: futureController,
            builder: (context, snapshot) {
              // if video to ready to play, else show a progress bar to the user
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        //button to play/pause the video
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: const Color(0xff17255A)),
          child:
              Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            setState(() {
              if (controller.value.isPlaying) {
                controller.pause();
              } else {
                controller.play();
              }
            });
          },
        )
      ],
    );
  }
}
