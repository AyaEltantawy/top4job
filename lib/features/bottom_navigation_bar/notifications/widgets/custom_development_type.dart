import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart' show ColorsManager;
import '../../../../core/theming/styles.dart' show TextStyles;
import 'custom_noti_container.dart' show CustomNotiContainer;

class CustomDevelopmentType extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomDevelopmentType({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, width: 40, height: 40), // Optional size
        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: TextStyles.font20StrongBlack500Weight),
              const SizedBox(height: 4),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "28 April 2024  |  12:08 PM",
                    style: TextStyles.font14LowGrey300Weight,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: ColorsManager.deepBlue,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomNotiContainer(
                fillColor: ColorsManager.babyBlue,
                text: "View",
                horizontal: 20,
                vertical: 10,
              ),
            ],
          ),
        ),


      ],
    );
  }
}
