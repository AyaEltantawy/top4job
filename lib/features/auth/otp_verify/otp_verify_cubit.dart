import 'package:bloc/bloc.dart';

import 'otp_verify_state.dart';

class OtpVerifyCubit extends Cubit<OtpVerifyState> {
  OtpVerifyCubit() : super(OtpVerifyState().init());
  String otpCode = "";
}
