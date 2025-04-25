import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/features/auth/profile/profile_view.dart';
import 'package:top4job/features/bottom_navigation_bar/saved/saved_view.dart';

import 'bottom_navigation_bar_state.dart';
import 'home/home_view.dart';
import 'messeges/messeges_view.dart' show MessegesPage;

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarStateInit());
  int index = 0;

  final GlobalKey navigationKey = GlobalKey();

  BottomNavigationBarItem _navItem({
    required Widget icon,
    required String label,
  }) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }

  List<BottomNavigationBarItem> get items => [
    _navItem(
      icon: Icon(

             Icons.home_outlined
         ,color:index ==0? ColorsManager.brimayColor:ColorsManager.tertiary,
      ),
      label: 'Home',
    ),
    _navItem(
      icon: Icon(

             Icons.bookmark

       ,color:index ==1? ColorsManager.brimayColor:ColorsManager.tertiary,
      ),
      label: 'Saved',
    ),
    _navItem(
      icon:Icon(Icons.message
      ,color:index ==2? ColorsManager.brimayColor:ColorsManager.tertiary,),
      label: 'Messages',
    ),
    _navItem(
      icon: Icon(Icons.person,

        color:index ==3? ColorsManager.brimayColor:ColorsManager.tertiary,),
      label: 'Profile',
    ),
  ];

  final List screens = [HomePage(), SavedPage(), MessegesPage(), ProfilePage()];

  updateIndex(newIndex) {
    index = newIndex;
    emit(UpdateIndex());
  }
}
