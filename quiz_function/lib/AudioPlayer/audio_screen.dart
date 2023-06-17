import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final player = AudioPlayer();
              await player.play(AssetSource('/audio/song.mp3'));
            },
            child: const Text('Play!'),
          ),
        ),
      ),
    );
  }
}
