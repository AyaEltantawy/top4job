import 'package:top4job/core/job_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class SearchLoading extends HomeState {}

class SearchSuccess extends HomeState {
  final List<JobModel> results;

  SearchSuccess(this.results);
}
class SearchEmpty extends HomeState {}
