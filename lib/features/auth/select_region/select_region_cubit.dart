import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'select_region_state.dart';

class SelectRegionCubit extends Cubit<SelectRegionState> {
  SelectRegionCubit()
      : super(SelectRegionState.init());

  final List<String> regions = ['Palatine', 'Egypt', 'Yemen', 'Syria'];
  final scrollController = ScrollController();
  void updateSearchText(String text) {
    final filtered = text.isEmpty
        ? regions
        : regions
        .where((region) =>
        region.toLowerCase().contains(text.toLowerCase()))
        .toList();

    emit(state.copyWith(
      searchText: text,
      filteredRegions: filtered,
    ));
  }

  void selectRegion(String region) {
    emit(state.copyWith(selectedRegion: region));
  }
}
