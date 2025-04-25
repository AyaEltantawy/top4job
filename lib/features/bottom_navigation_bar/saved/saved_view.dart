import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/shared_widgets/developer_container.dart';
import 'package:top4job/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:top4job/features/bottom_navigation_bar/home/widgets/custom_home_container.dart';
import 'package:top4job/features/bottom_navigation_bar/recommendtions/recommendtions_cubit.dart'
    show RecommendtionsCubit;
import 'package:top4job/features/bottom_navigation_bar/saved/saved_cubit.dart';

import '../../../core/routing/page_router.dart' show MagicRouter;
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SavedCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            children: [
              Row(
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
                  SizedBox(height: 25),
                  Text("Saved", style: TextStyles.font24StrongBlack600Weight),
                ],
              ),
              SizedBox(height: 80),

              DeveloperContainer(
                imagePath: "assets/images/Clay.png",
                isSaved: true,
              ),
              SizedBox(height: 40),
              DeveloperContainer(
                imagePath: "assets/images/infinity.png",
                isSaved: true,
              ),
              SizedBox(height: 40),
              DeveloperContainer(
                imagePath: "assets/images/ux_image.png",
                isSaved: true,
              ),
              SizedBox(height: 40),
              DeveloperContainer(
                imagePath: "assets/images/Packer.png",
                isSaved: true,
              ),
              SizedBox(height: 40),
              DeveloperContainer(
                imagePath: "assets/images/stripe_logo.png",
                isSaved: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
