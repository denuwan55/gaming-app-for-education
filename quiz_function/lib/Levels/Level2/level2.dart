import 'package:flutter/material.dart';
import 'package:quiz_app/Levels/Level2/Screens/audio_screen.dart';
import 'package:quiz_app/Levels/Level2/Screens/drag_drop_screen.dart';
import 'package:quiz_app/Levels/Level2/Screens/puzzle_main.dart';
import 'package:quiz_app/Levels/Level2/Screens/video_screen.dart';
import 'package:quiz_app/Levels/Level2/Screens/quiz_screen.dart';
import 'package:quiz_app/Levels/Level2/Screens/failure_screen.dart';
import 'package:quiz_app/Levels/Level2/Screens/level_splash_screen.dart';
import 'package:quiz_app/Levels/Level2/Screens/success_screen.dart';
import 'package:quiz_app/Widgets/Puzzle/Presentation/Flutter%20%20Pluzzle/pluzzle_page.dart';

class Level2 extends StatefulWidget {
  const Level2({
    required this.initiateLevel,
    super.key,
  });
  final void Function(String) initiateLevel;
  final int currentFeature = 1;

  @override
  State<Level2> createState() {
    return _Level2State();
  }
}

class _Level2State extends State<Level2> {
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
            _activeScreen = 'home-screen';
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
    Widget screenWidget = Level2SplashScreen(
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
      widget.initiateLevel('level2-screen');
    }

    return screenWidget;
  }
}
