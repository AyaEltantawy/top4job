import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/shared_widgets/developer_container.dart';
import 'package:top4job/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:top4job/features/bottom_navigation_bar/home/widgets/custom_home_container.dart';

import '../../../core/routing/page_router.dart' show MagicRouter;
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import 'recent_jobs_cubit.dart';
import 'recent_jobs_state.dart';

class RecentJobsPage extends StatelessWidget {
  const RecentJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RecentJobsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      MagicRouter.navigateTo(BottomNavigationBarPage());
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),

                  Text(
                    "Recent Jobs",
                    style: TextStyles.font24StrongBlack600Weight,
                  ),
                  SvgPicture.asset("assets/svgs/search.svg"),
                ],
              ),
              SizedBox(height: 40),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(isSelected: true, text: "All"),
                    CustomHomeContainer(isSelected: false, text: "Design"),
                    CustomHomeContainer(isSelected: false, text: "Marketing"),
                    CustomHomeContainer(isSelected: false, text: "Finance"),
                  ],
                ),
              ),
              SizedBox(height: 30),

              DeveloperContainer(imagePath: "assets/images/Clay.png"),
              SizedBox(height: 40),
              DeveloperContainer(imagePath: "assets/images/infinity.png"),
              SizedBox(height: 40),
              DeveloperContainer(imagePath: "assets/images/ux_image.png"),
              SizedBox(height: 40),
              DeveloperContainer(imagePath: "assets/images/Packer.png"),
              SizedBox(height: 40),
              DeveloperContainer(imagePath: "assets/images/stripe_logo.png"),
            ],
          ),
        ),
      ),
    );
  }
}
