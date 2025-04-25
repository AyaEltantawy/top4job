import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateInit());
  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    emit(CheckBoxUpdate());
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;

  Future<void> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString(),
          );
      MagicRouter.navigateTo(BottomNavigationBarPage());
      AnimatedSnackBar.material(
        'success',
        type: AnimatedSnackBarType.success,
      ).show(MagicRouter.currentContext);
    } catch (e) {
      AnimatedSnackBar.material(
        'error',
        type: AnimatedSnackBarType.error,
      ).show(MagicRouter.currentContext);
    }

  }
}
