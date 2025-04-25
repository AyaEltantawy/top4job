import 'package:animated_snack_bar/animated_snack_bar.dart'
    show AnimatedSnackBar, AnimatedSnackBarType;
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, UserCredential;
import 'package:flutter/cupertino.dart';

import '../../../core/routing/page_router.dart';
import '../../bottom_navigation_bar/bottom_navigation_bar_view.dart';
import '../select_region/select_region_view.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterStateInit());
  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    emit(CheckBoxUpdate());
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      MagicRouter.navigateTo(SelectRegionPage());

      AnimatedSnackBar.material(
        'Account created!',
        type: AnimatedSnackBarType.success,
      ).show(MagicRouter.currentContext);
    } on FirebaseAuthException catch (e) {
      AnimatedSnackBar.material(
        e.message ?? 'Registration failed',
        type: AnimatedSnackBarType.error,
      ).show(MagicRouter.currentContext);
    } catch (_) {
      AnimatedSnackBar.material(
        'Unexpected error',
        type: AnimatedSnackBarType.error,
      ).show(MagicRouter.currentContext);
    }
  }
}
