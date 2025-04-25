import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/theming/colors.dart';
import '../theming/styles.dart' show TextStyles;

class DeveloperContainer extends StatelessWidget {
  final String? imagePath;
  final bool? isSaved;

  const DeveloperContainer({super.key, this.imagePath, this.isSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: ColorsManager.lightGrey),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath ?? "assets/images/google.png"),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UI/UX Designer",
                      style: TextStyles.font16StrongBlack600Weight,
                    ),
                    Text(
                      "Google LLC",
                      style: TextStyles.font10LowGrey400Weight,
                    ),
                  ],
                ),
              ),
              isSaved == true
                  ? SvgPicture.asset("assets/svgs/blue_bookmark.svg")
                  : SvgPicture.asset("assets/svgs/bookmark.svg"),
            ],
          ),
          const SizedBox(height: 10),
          Divider(thickness: 1, color: ColorsManager.strongGrey),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                "California, United States",
                style: TextStyles.font16LowEmphasis400Weight,
              ),

              Text(
                "${10.000} - ${30.000} /month",
                style: TextStyles.font14SecondBlue400Weight,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.thirdGrey, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Part time",
                    style: TextStyles.font10MediumGrey500Weight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
