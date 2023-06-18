import 'package:flutter/material.dart';

class Level2SplashScreen extends StatefulWidget {
  const Level2SplashScreen({required this.afterSplash, super.key});

  final void Function() afterSplash;

  @override
  State<Level2SplashScreen> createState() => _Level2SplashScreenState();
}

class _Level2SplashScreenState extends State<Level2SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 4), () {
      widget.afterSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Level 2",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            )),
      ),
    );
  }
}
