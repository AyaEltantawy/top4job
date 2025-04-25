import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'on_boarding_screens_state.dart';

class OnBoardingScreensCubit extends Cubit<OnBoardingScreensState> {
  OnBoardingScreensCubit() : super(OnBoardingScreensState().init());

  final PageController pageController = PageController();

}
