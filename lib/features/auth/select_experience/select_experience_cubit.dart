import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'select_experience_state.dart';

class SelectExperienceCubit extends Cubit<SelectExperienceState> {
  SelectExperienceCubit()
    : super(
        SelectExperienceState(
          selectedType: '',
          searchText: '',
          filteredTypes: [],
        ),
      ) {
    updateSearchText('');
  }

  final scrollController = ScrollController();

  final List<String> jobTypes = [
    'Developer',
    'FrontEnd',
    'Accountant',
    'Product manager',
  ];

  void updateSearchText(String text) {
    final filtered =
        text.isEmpty
            ? jobTypes
            : jobTypes
                .where(
                  (region) => region.toLowerCase().contains(text.toLowerCase()),
                )
                .toList();

    emit(state.copyWith(searchText: text, filteredTypes: filtered, selectedType: ''));
  }

  void selectExperience(String region) {
    emit(state.copyWith(selectedType: region));
  }
}
