import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/auth/forget_password/widgets/custom_container.dart';
import 'package:top4job/features/auth/otp_verify/otp_verify_view.dart';

import '../../../core/theming/colors.dart' show ColorsManager;
import '../login/login_view.dart' show LoginPage;
import 'forget_password_cubit.dart';
import 'forget_password_state.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ForgetPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {
                  MagicRouter.navigateTo(LoginPage());
                },
                icon: Icon(Icons.arrow_back, color: ColorsManager.strongBlue),
              ),
              SizedBox(height: 30),

              Text(
                textAlign: TextAlign.center,
                "Forget Password",
                style: TextStyles.font24StrongBlack600Weight,
              ),

              SizedBox(height: 25),
              Text(
                "Select which contact details should we use \nto reset your password",
                style: TextStyles.font13StrongBlack500Weight,
              ),
              SizedBox(height: 60),
              CustomContainer(
                smsText: "Via SMS",
                mailOrPhoneText: "+0201*******78",
                iconImage: "assets/svgs/sms.svg",
              ),
              SizedBox(height: 20),
              CustomContainer(
                smsText: "Via Email",
                mailOrPhoneText: "mo*******@yahoo,com",
                iconImage: "assets/svgs/mail.svg",
              ),
              SizedBox(height: 300),
              FractionallySizedBox(
                widthFactor: .75,
                child: CustomButton(
                  text: "Continue",
                  onPressed: () {
                    MagicRouter.navigateTo(OtpVerifyPage());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
