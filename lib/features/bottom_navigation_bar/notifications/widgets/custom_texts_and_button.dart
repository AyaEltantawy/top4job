import 'package:flutter/material.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/features/bottom_navigation_bar/notifications/widgets/custom_noti_container.dart'
    show CustomNotiContainer;

import '../../../../core/theming/styles.dart' show TextStyles;

class CustomTextsAndButton extends StatelessWidget {
  final String text;
  final Color? fillColor;
  final bool isNew;

  const CustomTextsAndButton({
    super.key,
    required this.text,
    this.fillColor,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: TextStyles.font20StrongBlack500Weight),
           if (isNew == true)
            CustomNotiContainer(
              horizontal: 10,
              vertical: 10,
              text: "New",
              fillColor: fillColor ?? ColorsManager.white,
            )
          ],
        ),
        Text(
          "28 April 2024  I   12:08 PM",
          style: TextStyles.font13LowGrey400Weight,
        ),

        Text(
          "ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc",
          style: TextStyles.font13LowGrey400Weight,
        ),
      ],
    );
  }
}
