import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/shared_widgets/custom_text_form_feild.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/auth/forget_password/forget_password_view.dart';
import 'package:top4job/core/shared_widgets/checkbox_and_text.dart';
import 'package:top4job/features/auth/login/widgets/platforms.dart';

import '../register/register_view.dart' show RegisterPage;
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final controller = BlocProvider.of<LoginCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {MagicRouter.navigateTo(RegisterPage());},
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset("assets/images/Logo.png"),
                  SizedBox(height: 20),
                  Text(
                    "Login to your account",
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
                    child: CustomButton(text: "Login",onPressed: (){controller.login();},),
                  ),
                  SizedBox(height: 20),
                  InkWell(onTap: (){MagicRouter.navigateTo(ForgetPasswordPage());},
                    child: Text(
                      "Forget your password",
                      style: TextStyles.font12Blue500Weight,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 50,),
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
