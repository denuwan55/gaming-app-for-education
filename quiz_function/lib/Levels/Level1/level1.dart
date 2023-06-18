import 'package:flutter/material.dart';
import 'package:quiz_app/Levels/Level1/Screens/audio_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/drag_drop_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/level_accomplished_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/puzzle_main.dart';
import 'package:quiz_app/Levels/Level1/Screens/video_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/quiz_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/failure_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/level_splash_screen.dart';
import 'package:quiz_app/Levels/Level1/Screens/success_screen.dart';

class Level1 extends StatefulWidget {
  const Level1({
    required this.initiateLevel,
    super.key,
  });
  final void Function(String) initiateLevel;
  final int currentFeature = 1;

  @override
  State<Level1> createState() {
    return _Level1State();
  }
}

class _Level1State extends State<Level1> {
  // List<String> _selectedAnswers = [];
  var _activeScreen = 'home-screen';
  var _previousScreen = 'Nothing';

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

  void changeScreenFromSuccessOrFailure() {
    if (_previousScreen == 'question-screen') {
      if (_activeScreen == 'success-screen') {
        setState(
          () {
            _activeScreen = 'puzzle-screen';
          },
        );
      } else if (_activeScreen == 'failure-screen') {
        setState(
          () {
            _activeScreen = 'question-screen';
          },
        );
      }
    } else if (_previousScreen == 'puzzle-screen') {
      if (_activeScreen == 'success-screen') {
        setState(
          () {
            _activeScreen = 'audio-screen';
          },
        );
      } else if (_activeScreen == 'failure-screen') {
        setState(
          () {
            _activeScreen = 'puzzle-screen';
          },
        );
      }
    } else if (_previousScreen == 'audio-screen') {
      if (_activeScreen == 'success-screen') {
        setState(
          () {
            _activeScreen = 'video-screen';
          },
        );
      } else if (_activeScreen == 'failure-screen') {
        setState(
          () {
            _activeScreen = 'audio-screen';
          },
        );
      }
    } else if (_previousScreen == 'video-screen') {
      if (_activeScreen == 'success-screen') {
        setState(
          () {
            _activeScreen = 'drag-drop-screen';
          },
        );
      } else if (_activeScreen == 'failure-screen') {
        setState(
          () {
            _activeScreen = 'video-screen';
          },
        );
      }
    } else if (_previousScreen == 'drag-drop-screen') {
      if (_activeScreen == 'success-screen') {
        setState(
          () {
            _activeScreen =
                'level2-screen'; ////////////////////////////////////
          },
        );
      } else if (_activeScreen == 'failure-screen') {
        setState(
          () {
            _activeScreen = 'drag-drop-screen';
          },
        );
      }
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = Level1SplashScreen(
      afterSplash: _afterSplash,
    );

    if (_activeScreen == 'question-screen') {
      _previousScreen = 'question-screen';
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chosenAnswer,
      );
    } else if (_activeScreen == 'puzzle-screen') {
      _previousScreen = 'puzzle-screen';
      screenWidget = Puzzle(
        onSelectAnswer: _chosenAnswer,
      );
    } else if (_activeScreen == 'audio-screen') {
      _previousScreen = 'audio-screen';
      screenWidget = AudioScreen(
        onSelectAnswer: _chosenAnswer,
      );
    } else if (_activeScreen == 'video-screen') {
      _previousScreen = 'video-screen';
      screenWidget = VideoScreen(
        onSelectAnswer: _chosenAnswer,
      );
    } else if (_activeScreen == 'drag-drop-screen') {
      _previousScreen = 'drag-drop-screen';
      screenWidget = DragAndDropScreen(
        onSelectAnswer: _chosenAnswer,
      );
    } else if (_activeScreen == 'failure-screen') {
      screenWidget = FailScreen(
        changeScreen: changeScreenFromSuccessOrFailure,
      );
    } else if (_activeScreen == 'success-screen') {
      screenWidget = SuccessScreen(
        changeScreen: changeScreenFromSuccessOrFailure,
      );
    } else if (_activeScreen == 'level2-screen') {
      screenWidget = LevelAccomplishedScreen(
        levelUp: widget.initiateLevel,
      );
    }

    return screenWidget;
  }
}
