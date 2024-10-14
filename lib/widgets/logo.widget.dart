import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60.0,
        ),
        Image.asset(
          "assets/images/logo.png",
          height: 80.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          "Etanol ou Gasolina",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontFamily: "Big Shoulders Display",
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
