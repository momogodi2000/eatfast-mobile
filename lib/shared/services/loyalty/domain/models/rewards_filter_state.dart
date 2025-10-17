class RewardsFilterState {
  final String? category;
  final int? minPoints;
  final int? maxPoints;
  final bool availableOnly;
  final String? sortBy;

  const RewardsFilterState({
    this.category,
    this.minPoints,
    this.maxPoints,
    this.availableOnly = false,
    this.sortBy,
  });

  RewardsFilterState copyWith({
    String? category,
    int? minPoints,
    int? maxPoints,
    bool? availableOnly,
    String? sortBy,
  }) {
    return RewardsFilterState(
      category: category ?? this.category,
      minPoints: minPoints ?? this.minPoints,
      maxPoints: maxPoints ?? this.maxPoints,
      availableOnly: availableOnly ?? this.availableOnly,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  bool get hasActiveFilters {
    return category != null ||
        minPoints != null ||
        maxPoints != null ||
        availableOnly ||
        sortBy != null;
  }

  RewardsFilterState clear() {
    return const RewardsFilterState();
  }
}
