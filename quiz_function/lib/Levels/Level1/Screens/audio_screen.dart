import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final player = AudioPlayer();
                  await player.play(AssetSource('/audio/song.mp3'));
                },
                child: const Text('Play!'),
              ),
              ElevatedButton(
                onPressed: () {
                  onSelectAnswer('success-screen');
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
