import 'package:flutter/material.dart';
import 'package:quiz_app/Features/VideoPLayer/video_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/quiz_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/failure_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/level_splash_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/success_screen.dart';

class Level1 extends StatefulWidget {
  const Level1({super.key});

  final int currentFeature = 1;

  @override
  State<Level1> createState() {
    return _Level1State();
  }
}

class _Level1State extends State<Level1> {
  // List<String> _selectedAnswers = [];
  var _activeScreen = 'home-screen';

  void _chosenAnswer(String screenToShow) {
    setState(() {
      _activeScreen = screenToShow;
    });
  }

  void _afterSplash() {
    setState(() {
      _activeScreen = 'question-screen';
    });
  }

  void changeScreenFromSuccess() {
    setState(() {
      _activeScreen = 'puzzle-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = Level1SplashScreen(
      afterSplash: _afterSplash,
    );

    if (_activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chosenAnswer,
      );
    } else if (_activeScreen == 'failure-screen') {
      screenWidget = const FailScreen();
    } else if (_activeScreen == 'success-screen') {
      screenWidget = SuccessScreen(
        changeScreen: changeScreenFromSuccess,
      );
    } else if (_activeScreen == 'puzzle-screen') {
      screenWidget = const VideoScreen();
    }

    return screenWidget;
  }
}
