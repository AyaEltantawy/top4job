import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/shared_widgets/checkbox_and_text.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/shared_widgets/custom_text_form_feild.dart';
import 'package:top4job/features/auth/otp_verify/otp_verify_view.dart';
import 'package:top4job/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';

import '../../../core/routing/page_router.dart' show MagicRouter;
import '../../../core/shared_widgets/success_dialog.dart';
import '../../../core/theming/colors.dart' show ColorsManager;
import '../../../core/theming/styles.dart' show TextStyles;
import '../../bottom_navigation_bar/home/home_view.dart' show HomePage;
import 'create_new_password_cubit.dart';
import 'create_new_password_state.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreateNewPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<CreateNewPasswordCubit, CreateNewPasswordState>(
            builder: (context, state) {
              final controller = BlocProvider.of<CreateNewPasswordCubit>(
                context,
              );
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      MagicRouter.navigateTo(OtpVerifyPage());
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),
                  SizedBox(height: 50),

                  Text(
                    textAlign: TextAlign.center,
                    "Create New Password",
                    style: TextStyles.font24StrongBlack600Weight,
                  ),
                  SizedBox(height: 50),
                  CustomTextFormFeild(
                    upperText: "New Password",
                    hint: "New Password",

                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  CustomTextFormFeild(
                    upperText: "Confirm Password",
                    hint: "Confirm Password",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  CheckBoxAndText(
                    isChecked: controller.isChecked,
                    toggleCheckbox: controller.toggleCheckbox,
                  ),
                  SizedBox(height: 300),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {
                      MagicRouter.navigateTo(BottomNavigationBarPage());
                      showDialog(
                        context: MagicRouter.currentContext,

                        builder:
                            (context) => const SuccessDialog(
                              text:
                                  "Your password is set correctly you will be redirected to home page",
                            ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
