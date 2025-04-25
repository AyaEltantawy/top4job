class SelectExperienceState {
  final List<String> filteredTypes;
  final String selectedType;
  final String searchText;

  SelectExperienceState({
    required this.filteredTypes,
    required this.selectedType,
    required this.searchText,
  });

  factory SelectExperienceState.init() {
    final defaultJobTypes = ['Developer',
      'FrontEnd',
      'Accountant',
      'Product manager',];
    return SelectExperienceState(
      filteredTypes: defaultJobTypes,
      selectedType: '',
      searchText: '',
    );
  }

  SelectExperienceState copyWith({
    List<String>? filteredTypes,
    String? searchText, required String selectedType,
  }) {
    return SelectExperienceState(
      filteredTypes: filteredTypes ?? this.filteredTypes,
      selectedType: selectedType?? this.selectedType,
      searchText: searchText ?? this.searchText,
    );
  }
}
