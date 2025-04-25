import 'package:flutter/material.dart';
import 'package:top4job/core/theming/colors.dart';

import '../theming/styles.dart' show TextStyles;

class CheckBoxAndText extends StatelessWidget {
  final bool isChecked;
  void Function() toggleCheckbox;

  CheckBoxAndText({
    super.key,
    required this.isChecked,
    required this.toggleCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          //
          value: isChecked,
          onChanged: (value) => toggleCheckbox(),
          activeColor: ColorsManager.secondryBlue,
          side: BorderSide(color: ColorsManager.secondryBlue, width: 1),

          // Rounded checkbox
        ),

        Text("Remember me", style: TextStyles.font12StrongBlack500Weight),
      ],
    );
  }
}
