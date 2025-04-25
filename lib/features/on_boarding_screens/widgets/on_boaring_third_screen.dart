import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/auth/login/login_view.dart';
import 'package:top4job/features/auth/register/register_view.dart';
import 'package:top4job/features/on_boarding_screens/widgets/floating_circles.dart';

class OnBoardingThirdScreen extends StatelessWidget {
  final PageController controller;

  const OnBoardingThirdScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 40, top: 30, right: 40),
          children: [
            SvgPicture.asset(
              "assets/svgs/Logo.svg",
              alignment: Alignment.topLeft,
            ),
            SizedBox(height: 10),
            FloatingCircles(),
            SizedBox(height: 10),
            Image.asset(
              "assets/images/payment-processed.png",
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),

            Text(
              "let's go fishing",
              style: TextStyles.font24Black600Weight,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Center(
              child:

              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: ColorsManager.secondryBlue,
                  dotColor: ColorsManager.branding,
                ),
              ),
            ),
            SizedBox(height: 60),
            CustomButton(
              text: "Get  started",
              onPressed: () {
                MagicRouter.navigateTo(RegisterPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
