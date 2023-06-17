import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/Quiz/quiz.dart';
import 'package:quiz_app/Puzzle/puzzle_main.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/success_screen.dart';
import 'package:quiz_app/failure_screen.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() {
    return _GameAppState();
  }
}

class _GameAppState extends State<GameApp> {
  var _activeScreen = 'start-screen';

  void _switchToQuiz() {
    setState(() {
      _activeScreen = 'quiz-screen';
    });
  }

  void _switchToPuzzle() {
    setState(() {
      _activeScreen = 'puzzle-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = SuccessScreen();
    // Widget screenWidget = HomeScreen(
    //   startQuiz: _switchToQuiz,
    //   startPuzzle: _switchToPuzzle,
    // );

    if (_activeScreen == 'quiz-screen') {
      screenWidget = const Quiz();
    }

    if (_activeScreen == 'puzzle-screen') {
      screenWidget = Puzzle();
    }

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Blur(
              colorOpacity: 0.1,
              blur: 1.5,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    width: 300,
                    top: 120,
                    // left: 1,
                    child: Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_i9mxcD.json'),
                  ),
                ],
              ),
            ),
            screenWidget,
          ],
        ),
      ),
    );
  }
}
