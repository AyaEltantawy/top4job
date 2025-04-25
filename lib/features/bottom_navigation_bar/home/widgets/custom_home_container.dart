import 'package:flutter/material.dart';
import 'package:top4job/core/theming/colors.dart';

import '../../../../core/theming/styles.dart' show TextStyles;

class CustomHomeContainer extends StatelessWidget {

  final String text;
  final bool isSelected;

  const CustomHomeContainer({
    super.key,

    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isSelected == true
                ? ColorsManager.secondryBlue
                : ColorsManager.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color:
              isSelected == true
                  ? ColorsManager.white
                  : ColorsManager.secondryBlue,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style:
              isSelected == true
                  ? TextStyles.font13White600Weight
                  : TextStyles.font14SecondBlue400Weight,
        ),
      ),
    );
  }
}
