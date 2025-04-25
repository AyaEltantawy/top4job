import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
      : super(FilterUpdated(
    location: 'Egypt',
    minSalary: 5,
    maxSalary: 10,
    frequency: 'Per Month',
    selectedIndex: 2,
    tabs: ['Work Type', 'Job Level', 'Location & Salary'],
  ));

  void updateLocation(String location) {
    emit((state as FilterUpdated).copyWith(location: location));
  }

  void updateSalary(double min, double max) {
    emit((state as FilterUpdated).copyWith(minSalary: min, maxSalary: max));
  }

  void updateFrequency(String freq) {
    emit((state as FilterUpdated).copyWith(frequency: freq));
  }

  void changeSelectedIndex(int index) {
    emit((state as FilterUpdated).copyWith(selectedIndex: index));
  }

}
