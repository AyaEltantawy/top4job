import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top4job/core/job_model.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final List<JobModel> allJobs = [
    JobModel(title: "UI/UX Designer", company: "Google LLC", location: "California", salary: "\$10k - \$30k", type: "Part time"),
    JobModel(title: "Marketing Lead", company: "Meta", location: "NY", salary: "\$8k - \$20k", type: "Full time"),
    JobModel(title: "Finance Analyst", company: "Amazon", location: "Seattle", salary: "\$9k - \$25k", type: "Remote"),
  ];


  void search(String query) {
    emit(SearchLoading());
    final results =
        allJobs
            .where(
              (job) => job.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    if (results.isEmpty) {
      emit(SearchEmpty());
    } else {
      emit(SearchSuccess(results));
    }
  }
}
