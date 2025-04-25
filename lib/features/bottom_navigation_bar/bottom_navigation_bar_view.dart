import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_bar_cubit.dart';
import 'bottom_navigation_bar_state.dart';

class BottomNavigationBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomNavigationBarCubit(),

      child:
      BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          final controller = BlocProvider.of<BottomNavigationBarCubit>(context);
          return
      Scaffold(
        body: controller.screens[controller.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index,
          items: controller.items,
          onTap: controller.updateIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
        ),);
  },
  ));
}
  }



