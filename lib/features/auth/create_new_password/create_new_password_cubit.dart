import 'package:bloc/bloc.dart';

import 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  CreateNewPasswordCubit() : super(CreateNewPasswordStateInit());
  bool isChecked=false;
  void toggleCheckbox() {
    isChecked = !isChecked;
    emit(CheckBoxUpdate());
  }
}
