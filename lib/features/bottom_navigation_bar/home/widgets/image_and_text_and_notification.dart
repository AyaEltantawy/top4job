import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/bottom_navigation_bar/notifications/notifications_view.dart';

class ImageAndTextAndNotification extends StatelessWidget {
  const ImageAndTextAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/home_image.png"),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning👋", style: TextStyles.font10MediumGrey500Weight),
            Text("Mahmoud Meki", style: TextStyles.font12StrongBlack500Weight),
          ],
        ),

        Expanded(
          child: InkWell(
            onTap: () {
              MagicRouter.navigateTo(NotificationsPage());
            },
            child: SvgPicture.asset(
              "assets/svgs/Notafication.svg",
              alignment: Alignment.topRight,
            ),
          ),
        ),
      ],
    );
  }
}
