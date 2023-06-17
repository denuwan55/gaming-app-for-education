import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  const Youtube({super.key});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  late YoutubePlayerController _controller;
  final url = "https://youtu.be/GQyWIur03aw";

  @override
  void initState() {
    final id = YoutubePlayer.convertUrlToId(url);
    _controller = YoutubePlayerController(initialVideoId: id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ],
    );
  }
}
