import 'package:bloc/bloc.dart';

import 'messeges_state.dart';

class MessegesCubit extends Cubit<MessegesState> {
  MessegesCubit() : super(MessegesState().init());
}
