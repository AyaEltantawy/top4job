import 'package:flutter/material.dart';
import 'package:top4job/core/theming/colors.dart';

import '../../../../core/theming/styles.dart' show TextStyles;

class CustomNotiContainer extends StatelessWidget {
  final Color fillColor;
  final String text;
  final double horizontal;
  final double vertical;

  const CustomNotiContainer({
    super.key,
    required this.fillColor,
    required this.text,
    required this.horizontal,
    required this.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: Text(text, style: TextStyles.font12White600Weight),
      ),
    );
  }
}
