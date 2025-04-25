import 'package:bloc/bloc.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:top4job/core/routing/page_router.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileStateInit());

  // final DateTime? result =  await showAdaptiveDateTimePicker(
  // context:MagicRouter.currentContext ,
  // mode: DateTimeFieldPickerMode.dateAndTime,
  //);
  DateTime? selectedDate;
  String phoneCode = 'KWT';
  String gender = '';
  List<String> dropDownItems = ["Male", "Female"];
  String? _selectedItem;

  bool isChecked =false;

  selectDropDownItem() {
    emit(SelectDropDownItem());
  }
}
