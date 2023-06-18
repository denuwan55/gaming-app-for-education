import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/Puzzle/Presentation/Flutter%20%20Pluzzle/pluzzle_page.dart';
// import 'package:quiz_app/Puzzle/Presentation/Home%20Page/home_page.dart';
import 'package:quiz_app/Widgets/Puzzle/Theme/app_theme.dart';

class Puzzle extends StatelessWidget {
  Puzzle({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  final Image image = Image.asset(
    "assets/images/tom-jerry.webp",
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return PluzzlePage(
      imageWidget: image,
      heroTage: image.toString(),
      onSelectAnswer: onSelectAnswer,
    );
  }
}

void pageNavigation(context, Widget newPage) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => newPage));
