import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/features/on_boarding_screens/widgets/on_boarding_first_screen.dart';
import 'package:top4job/features/on_boarding_screens/widgets/on_boarding_second_screen.dart';
import 'package:top4job/features/on_boarding_screens/widgets/on_boaring_third_screen.dart';

import 'on_boarding_screens_cubit.dart';
import 'on_boarding_screens_state.dart';

class OnBoardingScreensPage extends StatelessWidget {
  const OnBoardingScreensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OnBoardingScreensCubit(),
      child: Scaffold(
        body: BlocBuilder<OnBoardingScreensCubit, OnBoardingScreensState>(
          builder: (context, state) {
            final controller = BlocProvider.of<OnBoardingScreensCubit>(context);
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      OnBoardingFirstScreen(
                        controller: controller.pageController,
                      ),
                      OnBoardingSecondScreen(
                        controller: controller.pageController,
                      ),
                      OnBoardingThirdScreen(
                        controller: controller.pageController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
