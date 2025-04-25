import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/on_boarding_screens/widgets/floating_circles.dart';
import 'package:top4job/features/on_boarding_screens/widgets/on_boaring_third_screen.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  final PageController controller;

  const OnBoardingSecondScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        padding: EdgeInsets.only(left: 40, top: 30, right: 40),
        children: [
          SvgPicture.asset(
            "assets/svgs/Logo.svg",
            alignment: Alignment.topLeft,
          ),
          SizedBox(height: 10),
          FloatingCircles(),
          SizedBox(height: 10),
          Image.asset("assets/images/smart-people.png", fit: BoxFit.fill),
          SizedBox(height: 10),

          Text(
            "pursue your dream ",
            style: TextStyles.font24Black600Weight,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Center(
            child: SmoothPageIndicator(
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
            text: "Next",
            onPressed: () {
              if (controller.page == 2) {
                MagicRouter.navigateTo(
                  OnBoardingThirdScreen(controller: controller),
                );
              } else {
                controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
