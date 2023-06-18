import 'package:flutter/material.dart';
import 'package:quiz_app/Features/Puzzle/Presentation/Flutter%20%20Pluzzle/pluzzle_page.dart';
// import 'package:quiz_app/Puzzle/Presentation/Home%20Page/home_page.dart';
import 'package:quiz_app/Features/Puzzle/Theme/app_theme.dart';

class Puzzle extends StatelessWidget {
  Puzzle({Key? key}) : super(key: key);

  final Image image = Image.asset(
    "assets/images/tom-jerry.webp",
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Puzzle Hack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: Themes.textTheme,
      ),
      home: PluzzlePage(
        imageWidget: image,
        heroTage: image.toString(),
      ),
    );
  }
}

void pageNavigation(context, Widget newPage) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => newPage));
