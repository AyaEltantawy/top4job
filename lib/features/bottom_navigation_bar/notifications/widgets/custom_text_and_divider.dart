import 'package:flutter/material.dart';
import 'package:top4job/core/theming/colors.dart';

import '../../../../core/theming/styles.dart' show TextStyles;

class CustomTextAndDivider extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomTextAndDivider({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style:
              isSelected == true
                  ? TextStyles.font14BrimaryColor500Weight
                  : TextStyles.font15MediumGrey500Weight,
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 1,
          color:
              isSelected == true
                  ? ColorsManager.brimayColor
                  : ColorsManager.nineGrey,
        ),
      ],
    );
  }
}
