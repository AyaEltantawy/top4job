abstract class FilterState {}

class FilterUpdated extends FilterState {
  final String location;
  final double minSalary;
  final double maxSalary;
  final String frequency;
  final int selectedIndex;
  final List<String> tabs;

  FilterUpdated({
    required this.location,
    required this.minSalary,
    required this.maxSalary,
    required this.frequency,
    required this.selectedIndex,
    required this.tabs,
  });

  FilterUpdated copyWith({
    String? location,
    double? minSalary,
    double? maxSalary,
    String? frequency,
    int? selectedIndex,
    List<String>? tabs,
  }) {
    return FilterUpdated(
      location: location ?? this.location,
      minSalary: minSalary ?? this.minSalary,
      maxSalary: maxSalary ?? this.maxSalary,
      frequency: frequency ?? this.frequency,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      tabs: tabs ?? this.tabs,
    );
  }
}
