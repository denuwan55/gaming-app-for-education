import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Features/DragAndDrop/draggable_target.dart';
import 'package:quiz_app/Features/DragAndDrop/draggable_widget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, this.startVideo, {super.key});

  final void Function() startQuiz;
  final void Function() startVideo;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DraggableWidget(
            data: 'icon',
            child: Image.asset(
              'assets/images/logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startVideo,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Video'),
          ),
          const SizedBox(height: 30),
          DragTargetWidget(
            onWillAccept: (data) => data == 'icon',
            onAccept: (data) => (),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
