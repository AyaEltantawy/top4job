import 'package:bloc/bloc.dart';

import 'recent_jobs_state.dart';

class RecentJobsCubit extends Cubit<RecentJobsState> {
  RecentJobsCubit() : super(RecentJobsState().init());
}
