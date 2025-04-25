import 'package:bloc/bloc.dart';

import 'pin_number_state.dart';

class PinNumberCubit extends Cubit<PinNumberState> {
  PinNumberCubit() : super(PinNumberStateInit());
  String otpCode = "";
}
