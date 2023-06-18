import 'package:flutter/material.dart';
import 'package:quiz_app/Data/backgrounds.dart';
import 'package:quiz_app/Levels/Level1/level1.dart';
import 'package:quiz_app/Models/background.dart';
import 'package:quiz_app/Screens/home_screen.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() {
    return _GameAppState();
  }
}

class _GameAppState extends State<GameApp> {
  var _currentLevel = 0;
  var _activeScreen = 'home-screen';

  void _startGame() {
    setState(() {
      _activeScreen = 'level1-screen';
      _currentLevel++;
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(
      startGame: _startGame,
    );

    if (_activeScreen == 'level1-screen') {
      screenWidget = Level1();
    }

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Background(
              image: backgrounds[_currentLevel.toString()]!,
              level: _currentLevel,
            ),
            screenWidget,
          ],
        ),
      ),
    );
  }
}