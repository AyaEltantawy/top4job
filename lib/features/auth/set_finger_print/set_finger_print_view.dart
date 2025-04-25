import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/auth/pin_number/pin_number_view.dart';

import 'set_finger_print_cubit.dart';
import 'set_finger_print_state.dart';

class SetFingerPrintPage extends StatelessWidget {
  SetFingerPrintPage({super.key});

  final LocalAuthentication localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SetFingerPrintCubit(localAuth),
      child: Scaffold(
        body: BlocConsumer<SetFingerPrintCubit, SetFingerPrintState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Authentication successful!')),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {MagicRouter.navigateTo(PinNumberPage());},
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),
                  SizedBox(height: 50),

                  Text(
                    textAlign: TextAlign.center,
                    "Set your Finger Print",
                    style: TextStyles.font24StrongBlack600Weight,
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "Approve with finger\nprint for more security",
                    style: TextStyles.font15MediumGrey500Weight,
                  ),
                  SizedBox(height: 30),
                  Icon(Icons.fingerprint, size: 150, color: Colors.blue),
                  SizedBox(height: 60),
                  state is AuthLoading
                      ? CircularProgressIndicator()
                      : FractionallySizedBox(
                    widthFactor: .75,
                        child: CustomButton(
                          text: "Use FingerPrint",
                          onPressed: () {
                            context
                                .read<SetFingerPrintCubit>()
                                .authenticateWithBiometrics();
                          },
                        ),
                      ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
