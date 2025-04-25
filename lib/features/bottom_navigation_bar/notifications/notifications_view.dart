import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top4job/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:top4job/features/bottom_navigation_bar/notifications/widgets/custom_development_type.dart';
import 'package:top4job/features/bottom_navigation_bar/notifications/widgets/custom_texts_and_button.dart';

import '../../../core/routing/page_router.dart' show MagicRouter;
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart' show TextStyles;
import 'notifications_cubit.dart';
import 'notifications_state.dart';
import 'widgets/custom_text_and_divider.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotificationsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              final controller = BlocProvider.of<NotificationsCubit>(context);
              return ListView(
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
                      SizedBox(width: 70),

                      Text(
                        textAlign: TextAlign.center,
                        "Notifications",
                        style: TextStyles.font24StrongBlack600Weight,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(controller.tabs.length, (index) {
                      return Expanded(
                        child: InkWell(
                          onTap: () => controller.changeSelectedIndex(index),
                          child: CustomTextAndDivider(
                            text: controller.tabs[index],
                            isSelected: controller.selectedIndex == index,
                          ),
                        ),
                      );
                    }),
                  ),
                  if (controller.selectedIndex == 0) ...[
                    CustomTextsAndButton(
                      text: "Security update",
                      fillColor: ColorsManager.secondryBlue,
                      isNew: true,
                    ),

                    SizedBox(height: 40),
                    CustomTextsAndButton(
                      text: "Password changed",
                      fillColor: Colors.orange,
                      isNew: true,
                    ),
                    SizedBox(height: 40),
                    CustomTextsAndButton(
                      text: "Job has been updated",
                      isNew: false,
                    ),
                  ],
                  if (controller.selectedIndex == 1) ...[
                    CustomDevelopmentType(
                      imagePath: "assets/images/GoDaddy.png",
                      text: "Product Mangement",
                    ),
                    SizedBox(height: 40),
                    CustomDevelopmentType(
                      imagePath: "assets/images/Terraform Enterprise.png",
                      text: "UX Researcher",
                    ),
                    SizedBox(height: 40),
                    CustomDevelopmentType(
                      imagePath: "assets/images/ux_arch_image.png",
                      text: "UX Architecture",
                    ),
                    SizedBox(height: 40),
                    CustomDevelopmentType(
                      imagePath: "assets/images/Nomad.png",
                      text: "Developer",
                    ),
                    SizedBox(height: 40),
                    CustomDevelopmentType(
                      imagePath: "assets/images/University Of Toronto.png",
                      text: "Product Designer",
                    ),
                    SizedBox(height: 40),
                    CustomDevelopmentType(
                      imagePath: "assets/images/sanfori.png",
                      text: "Front end",
                    ),
                    SizedBox(height: 40),
                    CustomDevelopmentType(
                      imagePath: "assets/images/graphic_designer_image.png",
                      text: "Graphic Designer",
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
