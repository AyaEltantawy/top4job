class SelectRegionState {
  final List<String> filteredRegions;
  final String selectedRegion;
  final String searchText;

  SelectRegionState({
    required this.filteredRegions,
    required this.selectedRegion,
    required this.searchText,
  });

  factory SelectRegionState.init() {
    final defaultRegions = ['Palatine', 'Egypt', 'Yemen', 'Syria'];
    return SelectRegionState(
      filteredRegions: defaultRegions,
      selectedRegion: '',
      searchText: '',
    );
  }

  SelectRegionState copyWith({
    List<String>? filteredRegions,
    String? selectedRegion,
    String? searchText,
  }) {
    return SelectRegionState(
      filteredRegions: filteredRegions ?? this.filteredRegions,
      selectedRegion: selectedRegion ?? this.selectedRegion,
      searchText: searchText ?? this.searchText,
    );
  }
}
