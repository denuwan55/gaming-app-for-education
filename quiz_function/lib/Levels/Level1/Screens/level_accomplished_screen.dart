import 'package:flutter/material.dart';

class LevelAccomplishedScreen extends StatelessWidget {
  const LevelAccomplishedScreen({
    required this.levelUp,
    super.key,
  });

  final void Function(String) levelUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Level 1 Done!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                  onPressed: () {
                    levelUp('level2-screen');
                  },
                  child: const Text("Continue"),
                ),
              ],
            )),
      ),
    );
  }
}
