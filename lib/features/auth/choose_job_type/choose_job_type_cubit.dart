import 'package:bloc/bloc.dart';

import 'choose_job_type_state.dart';

class ChooseJobTypeCubit extends Cubit<ChooseJobTypeState> {
  ChooseJobTypeCubit() : super(ChooseJobTypeState().init());
}
