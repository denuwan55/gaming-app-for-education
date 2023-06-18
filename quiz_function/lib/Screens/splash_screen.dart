import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.afterSplash, super.key});

  final void Function() afterSplash;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
        child: Image.asset("assets/images/splash_screen.png"),
      ),
    );
  }
}
