import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';

class FindingJobOrEmployee extends StatelessWidget {
  const FindingJobOrEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 115,
          height: 129,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorsManager.strongGrey),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/svgs/pag.svg"),

                Text(
                  "Find a job",
                  style: TextStyles.font16StrongBlack600Weight,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 115,
          height: 129,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorsManager.strongGrey),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/svgs/person_icon_blue.svg"),

                Text(
                  textAlign: TextAlign.center,
                  "Find an \nEmployee",
                  style: TextStyles.font16StrongBlack600Weight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
