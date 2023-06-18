import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/VideoPLayer/youtube.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Youtube(),
        ElevatedButton(
          onPressed: () {
            onSelectAnswer('success-screen');
          },
          child: const Text("Continue"),
        ),
      ],
    );
  }
}
