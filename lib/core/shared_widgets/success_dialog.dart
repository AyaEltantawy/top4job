import 'package:flutter/material.dart';

import '../theming/styles.dart' show TextStyles;

class SuccessDialog extends StatelessWidget {
  final String text;
  const SuccessDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Optional: Rounded corners
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/illustration.png",
            width: 160,
            height: 160,
          ),
          SizedBox(height: 5),

          Text("Congratulation", style: TextStyles.font24SecondryBlue600Weight),
          SizedBox(height: 5),
          Text(
           text,
            style: TextStyles.font15MediumGrey500Weight,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
