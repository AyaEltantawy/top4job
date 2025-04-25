import 'package:bloc/bloc.dart';

import 'recommendtions_state.dart';

class RecommendtionsCubit extends Cubit<RecommendtionsState> {
  RecommendtionsCubit() : super(RecommendtionsState().init());
}
