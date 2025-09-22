import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/analytics_data.dart';
import '../../domain/models/analytics_request.dart';
import '../../data/repositories/analytics_repository.dart';

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  return AnalyticsRepository();
});

final analyticsProvider = FutureProvider.family<AnalyticsData, AnalyticsRequest>((ref, request) async {
  final repository = ref.watch(analyticsRepositoryProvider);
  return await repository.getAnalytics(request);
});

final analyticsFilterProvider = StateNotifierProvider<AnalyticsFilterNotifier, AnalyticsFilter>((ref) {
  return AnalyticsFilterNotifier();
});

class AnalyticsNotifier extends StateNotifier<AsyncValue<AnalyticsData>> {
  final AnalyticsRepository _repository;

  AnalyticsNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadAnalytics();
  }

  Future<void> loadAnalytics({
    AnalyticsTimeRange? timeRange,
    AnalyticsUserType? userType,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      state = const AsyncValue.loading();
      final request = AnalyticsRequest(
        timeRange: timeRange ?? AnalyticsTimeRange.month,
        userType: userType ?? AnalyticsUserType.all,
        startDate: startDate,
        endDate: endDate,
      );
      final analytics = await _repository.getAnalytics(request);
      state = AsyncValue.data(analytics);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refreshAnalytics() async {
    await loadAnalytics();
  }

  Future<void> exportAnalytics(String format) async {
    try {
      await _repository.exportAnalytics(format);
    } catch (error) {
      rethrow;
    }
  }
}

class AnalyticsFilterNotifier extends StateNotifier<AnalyticsFilter> {
  AnalyticsFilterNotifier() : super(const AnalyticsFilter());

  void updateTimeRange(AnalyticsTimeRange timeRange) {
    state = state.copyWith(timeRange: timeRange);
  }

  void updateUserType(AnalyticsUserType userType) {
    state = state.copyWith(userType: userType);
  }

  void updateDateRange(DateTime? startDate, DateTime? endDate) {
    state = state.copyWith(
      startDate: startDate,
      endDate: endDate,
    );
  }

  void reset() {
    state = const AnalyticsFilter();
  }
}

class AnalyticsFilter {
  final AnalyticsTimeRange timeRange;
  final AnalyticsUserType userType;
  final DateTime? startDate;
  final DateTime? endDate;

  const AnalyticsFilter({
    this.timeRange = AnalyticsTimeRange.month,
    this.userType = AnalyticsUserType.all,
    this.startDate,
    this.endDate,
  });

  AnalyticsFilter copyWith({
    AnalyticsTimeRange? timeRange,
    AnalyticsUserType? userType,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return AnalyticsFilter(
      timeRange: timeRange ?? this.timeRange,
      userType: userType ?? this.userType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}