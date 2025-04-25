import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/shared_widgets/custom_text_form_feild.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/auth/login/login_view.dart';
import 'package:top4job/core/shared_widgets/checkbox_and_text.dart';
import 'package:top4job/features/auth/login/widgets/platforms.dart';
import 'package:top4job/features/auth/register/register_cubit.dart';
import 'package:top4job/features/auth/register/register_state.dart';
import 'package:top4job/features/on_boarding_screens/widgets/on_boaring_third_screen.dart';

import '../select_region/select_region_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              final controller = BlocProvider.of<RegisterCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {MagicRouter.navigateTo(OnBoardingThirdScreen(controller: PageController(initialPage: 2)));},
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset("assets/images/Logo.png"),
                  SizedBox(height: 20),
                  Text(
                    "Create new account",
                    textAlign: TextAlign.center,
                    style: TextStyles.font24StrongBlack600Weight,
                  ),
                  CustomTextFormFeild(controller: controller.emailController,
                    upperText: "Email",
                    prefixIcon: SvgPicture.asset("assets/svgs/email_icon.svg"),
                    hint: "Email",
                  ),
                  CustomTextFormFeild(controller: controller.passwordController,
                    upperText: "Password",
                    prefixIcon: SvgPicture.asset("assets/svgs/person_icon.svg"),
                    hint: "Password",
                  ),
                  CheckBoxAndText(
                    isChecked: controller.isChecked,
                    toggleCheckbox: controller.toggleCheckbox,
                  ),
                  SizedBox(height: 100),
                  FractionallySizedBox(
                    widthFactor: .75,

                    child: CustomButton(
                      text: "Sign Up",
                      onPressed: () {
                        controller.signUp();

                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(LoginPage());
                    },
                    child: Text(
                      "Have Account? Login",
                      style: TextStyles.font12Blue500Weight,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 50),
                  Platforms(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
