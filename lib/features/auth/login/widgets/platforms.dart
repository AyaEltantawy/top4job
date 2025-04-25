import 'package:flutter/material.dart';

class Platforms extends StatelessWidget {
  const Platforms({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/facebook.png"),
        SizedBox(width: 20),
        Image.asset("assets/images/google.png"),
        SizedBox(width: 20),
        Image.asset("assets/images/linkedIn.png"),
      ],
    );
  }
}
