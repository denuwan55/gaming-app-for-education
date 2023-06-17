import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Blur(
            colorOpacity: 0.3,
            blur: 1.5,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/success.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 155, top: 30),
            child: Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 231, 234, 232).withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          Positioned(
            width: 300,
            top: 20,
            left: 250,
            // left: 1,
            child: Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_obhph3sh.json'),
          ),
          Positioned(
            width: 250,
            top: 20,
            left: 280,
            // left: 1,
            child: Lottie.network(
                'https://assets7.lottiefiles.com/datafiles/VtCIGqDsiVwFPNM/data.json'),
          ),
          Positioned(
            width: 200,
            top: 250,
            left: 305,
            // left: 1,
            child: OutlinedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.amberAccent)),
              child: const Text(
                "Continue",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
