import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/theming/colors.dart';

import '../../../../core/theming/styles.dart' show TextStyles;

class CustomContainer extends StatelessWidget {
  final String smsText;
  final String mailOrPhoneText;
  final String  iconImage;
  const CustomContainer({super.key, required this.smsText, required this.mailOrPhoneText, required this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.blueTint, width: 1),
        borderRadius: BorderRadius.circular(4),

      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          SvgPicture.asset(iconImage),
          SizedBox(width: 10,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Text(smsText,style: TextStyles.font12MediumGrey400Weight,),
            SizedBox(height: 10,),
            Text(mailOrPhoneText,style: TextStyles.font12MediumGrey400Weight,)

          ],)

        ],),
      ),
    );
  }
}
