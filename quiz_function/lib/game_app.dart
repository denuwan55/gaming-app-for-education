import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz/quiz.dart';
import 'package:quiz_app/Puzzle/puzzle_main.dart';
import 'package:quiz_app/home_screen.dart';

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
    Widget screenWidget = HomeScreen(
      startQuiz: _switchToQuiz,
      startPuzzle: _switchToPuzzle,
    );

    if (_activeScreen == 'quiz-screen') {
      screenWidget = const Quiz();
    }

    if (_activeScreen == 'puzzle-screen') {
      screenWidget = Puzzle();
    }

    return MaterialApp(
      home: Scaffold(
          // body: Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         Color.fromARGB(255, 78, 13, 151),
          //         Color.fromARGB(255, 107, 15, 168),
          //       ],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //     ),
          //   ),
          //   child: screenWidget,
          // ),
          body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
              // gradient: LinearGradient(
              //   colors: [
              //     Color.fromARGB(255, 78, 13, 151),
              //     Color.fromARGB(255, 107, 15, 168),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
            ),
            child: screenWidget,
          ),
          const Center(
            child: Text("Hello background"),
          )
        ],
      )),
    );
  }
}
