import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/Data/lotties.dart';

class Background extends StatelessWidget {
  const Background({required this.image, required this.level, super.key});

  final String image;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Blur(
      colorOpacity: 0.1,
      blur: 1.5,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            width: 300,
            top: 120,
            // left: 1,
            child: Lottie.network(
              lotties[level.toString()]!,
            ),
          ),
        ],
      ),
    );
  }
}
