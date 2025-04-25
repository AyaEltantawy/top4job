import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart'
    show AnimationType, PinCodeFieldShape, PinCodeTextField, PinTheme;
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/features/auth/create_new_password/create_new_password_view.dart';
import 'package:top4job/features/auth/forget_password/forget_password_view.dart';

import '../../../core/shared_widgets/custom_button.dart' show CustomButton;
import '../../../core/theming/colors.dart' show ColorsManager;
import '../../../core/theming/styles.dart' show TextStyles;
import '../set_finger_print/set_finger_print_view.dart' show SetFingerPrintPage;
import 'otp_verify_cubit.dart';
import 'otp_verify_state.dart';

class OtpVerifyPage extends StatelessWidget {
  const OtpVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OtpVerifyCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OtpVerifyCubit, OtpVerifyState>(
            builder: (context, state) {
              final controller = BlocProvider.of<OtpVerifyCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      MagicRouter.navigateTo(ForgetPasswordPage());
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),
                  SizedBox(height: 50),

                  Text(
                    textAlign: TextAlign.center,
                    "OTP Code verifcation",
                    style: TextStyles.font24StrongBlack600Weight,
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "Enter code sent to\n+201******71",
                    style: TextStyles.font15MediumGrey500Weight,
                  ),
                  SizedBox(height: 40),
                  FractionallySizedBox(
                    widthFactor: .75,
                    child: PinCodeTextField(
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 300),
                      // Pass it here
                      onChanged: (value) {
                        controller.otpCode = value;
                      },

                      appContext: context,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,

                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        inactiveColor: ColorsManager.blueTint,

                        activeColor: ColorsManager.thirdBlack,

                        selectedColor: ColorsManager.thirdBlack,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      text: "Resend code in",
                      style: TextStyles.font12Black600Weight,
                      children: [
                        TextSpan(
                          text: '  55',
                          style: TextStyles.font12SecondBlue600Weight,
                        ),
                        TextSpan(
                          text: "  s",
                          style: TextStyles.font12Black600Weight,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 80),
                  FractionallySizedBox(
                    widthFactor: .75,

                    child: CustomButton(
                      text: "Continue",
                      onPressed: () {
                        MagicRouter.navigateTo(CreateNewPasswordPage());
                      },
                    ),
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
