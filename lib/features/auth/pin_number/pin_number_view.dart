import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/auth/profile/profile_view.dart';
import 'package:top4job/features/auth/set_finger_print/set_finger_print_view.dart';

import 'pin_number_cubit.dart';
import 'pin_number_state.dart';

class PinNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PinNumberCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PinNumberCubit, PinNumberState>(
            builder: (context, state) {
              final controller = BlocProvider.of<PinNumberCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      MagicRouter.navigateTo(ProfilePage());
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),
                  SizedBox(height: 50),

                  Text(
                    textAlign: TextAlign.center,
                    "Create New PIN",
                    style: TextStyles.font24StrongBlack600Weight,
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "Add PIN Number to secure\nyour account",
                    style: TextStyles.font15MediumGrey500Weight,
                  ),
                  SizedBox(height: 30),
                  PinCodeTextField(
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
                  SizedBox(height: 60),
                  FractionallySizedBox(
                    widthFactor: .75,

                    child: CustomButton(
                      text: "Continue",
                      onPressed: () {
                        MagicRouter.navigateTo(SetFingerPrintPage());
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
