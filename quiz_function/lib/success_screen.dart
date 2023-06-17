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
                color: Colors.white.withOpacity(0.9),
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
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(255, 14, 222, 97),
                      Color.fromARGB(255, 14, 194, 116),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
