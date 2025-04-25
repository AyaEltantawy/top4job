import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:top4job/core/shared_widgets/success_dialog.dart';
import 'package:top4job/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';


import '../../../core/routing/page_router.dart' show MagicRouter;
import '../../bottom_navigation_bar/home/home_view.dart' show HomePage;
import 'set_finger_print_state.dart';

class SetFingerPrintCubit extends Cubit<SetFingerPrintState> {
  final LocalAuthentication auth;

  SetFingerPrintCubit(this.auth) : super(AuthInitial()) {}

  Future<void> authenticateWithBiometrics() async {
    emit(AuthLoading());

    try {
      bool canCheck = await auth.canCheckBiometrics;
      bool isAuthenticated = false;

      if (canCheck) {
        isAuthenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
      }

      if (isAuthenticated) {

        MagicRouter.navigateTo(BottomNavigationBarPage());
        showDialog(
          context: MagicRouter.currentContext,

          builder: (context) => const SuccessDialog(text:"Your account is ready you will be redirected to home page"),
        );
      } else {
        emit(AuthFailure("Authentication failed"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
