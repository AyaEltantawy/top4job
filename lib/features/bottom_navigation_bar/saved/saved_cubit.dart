import 'package:bloc/bloc.dart';

import 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedState().init());
}
