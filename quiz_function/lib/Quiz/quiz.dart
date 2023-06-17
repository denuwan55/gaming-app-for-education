import 'package:flutter/material.dart';
import 'package:quiz_app/AudioPlayer/audio_screen.dart';
import 'package:quiz_app/Quiz/screens/start_screen.dart';
import 'package:quiz_app/Quiz/widgets/questions_screen.dart';
import 'package:quiz_app/Quiz/data/questions.dart';
import 'package:quiz_app/Quiz/screens/results_screen.dart';
import 'package:quiz_app/VideoPLayer/video_screen.dart';
// import 'package:quiz_app/VideoPLayer/youtube.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  void audioGame() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'audio-screen';
    });
  }

  void playVideo() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'video-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(
      _switchScreen,
      playVideo,
    );

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
        onNextGame: audioGame,
      );
    } else if (_activeScreen == 'audio-screen') {
      screenWidget = AudioScreen();
    } else if (_activeScreen == 'video-screen') {
      screenWidget = VideoScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
