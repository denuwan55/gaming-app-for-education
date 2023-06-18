import 'package:flutter/material.dart';
import 'package:quiz_app/Data/backgrounds.dart';
import 'package:quiz_app/Levels/Level1/level1.dart';
import 'package:quiz_app/Levels/Level2/level2.dart';
import 'package:quiz_app/Models/background.dart';
import 'package:quiz_app/Screens/home_screen.dart';
import 'package:quiz_app/Screens/splash_screen.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() {
    return _GameAppState();
  }
}

class _GameAppState extends State<GameApp> {
  var _currentLevel = 0;
  var _activeScreen = 'splash-screen';

  void _initiateLevel(String level) {
    setState(() {
      _activeScreen = level;
      _currentLevel++;
    });
  }

  void _afterSplash() {
    setState(() {
      _activeScreen = 'home-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = SplashScreen(
      afterSplash: _afterSplash,
    );

    if (_activeScreen == 'home-screen') {
      screenWidget = HomeScreen(
        initiateLevel: _initiateLevel,
      );
    } else if (_activeScreen == 'level1-screen') {
      screenWidget = Level1(
        initiateLevel: _initiateLevel,
      );
    } else if (_activeScreen == 'level2-screen') {
      screenWidget = Level2(
        initiateLevel: _initiateLevel,
      );
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
