import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/fraud_alert.dart';
import '../../data/repositories/fraud_detection_repository.dart';

final fraudDetectionRepositoryProvider = Provider<FraudDetectionRepository>((ref) {
  return FraudDetectionRepository();
});

final fraudAlertsProvider = FutureProvider<List<FraudAlert>>((ref) async {
  final repository = ref.watch(fraudDetectionRepositoryProvider);
  return repository.getFraudAlerts();
});

final fraudPatternsProvider = FutureProvider<List<FraudPattern>>((ref) async {
  final repository = ref.watch(fraudDetectionRepositoryProvider);
  return repository.getFraudPatterns();
});

final fraudDetectionProvider = StateNotifierProvider<FraudDetectionNotifier, FraudDetectionState>((ref) {
  final repository = ref.watch(fraudDetectionRepositoryProvider);
  return FraudDetectionNotifier(repository);
});

class FraudDetectionNotifier extends StateNotifier<FraudDetectionState> {
  final FraudDetectionRepository _repository;

  FraudDetectionNotifier(this._repository) : super(const FraudDetectionState()) {
    loadFraudAlerts();
  }

  Future<void> loadFraudAlerts({
    FraudAlertSeverity? severity,
    FraudAlertStatus? status,
    FraudAlertType? type,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      final alerts = await _repository.getFraudAlerts(
        severity: severity,
        status: status,
        type: type,
      );
      state = state.copyWith(
        alerts: alerts,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<void> loadFraudPatterns() async {
    try {
      state = state.copyWith(isLoading: true);
      final patterns = await _repository.getFraudPatterns();
      state = state.copyWith(
        patterns: patterns,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<RiskAssessment> assessRisk(String entityId, RiskEntityType entityType) async {
    try {
      state = state.copyWith(isLoading: true);
      final assessment = await _repository.assessRisk(entityId, entityType);
      state = state.copyWith(
        currentAssessment: assessment,
        isLoading: false,
      );
      return assessment;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> updateAlertStatus(String alertId, FraudAlertStatus status) async {
    try {
      await _repository.updateAlertStatus(alertId, status);
      await loadFraudAlerts();
    } catch (error) {
      state = state.copyWith(error: error.toString());
      rethrow;
    }
  }

  Future<void> createFraudPattern(FraudPattern pattern) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.createFraudPattern(pattern);
      await loadFraudPatterns();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> updateFraudPattern(String patternId, FraudPattern pattern) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.updateFraudPattern(patternId, pattern);
      await loadFraudPatterns();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> deleteFraudPattern(String patternId) async {
    try {
      await _repository.deleteFraudPattern(patternId);
      await loadFraudPatterns();
    } catch (error) {
      state = state.copyWith(error: error.toString());
      rethrow;
    }
  }

  Future<void> reportFalsePositive(String alertId, String reason) async {
    try {
      await _repository.reportFalsePositive(alertId, reason);
      await loadFraudAlerts();
    } catch (error) {
      state = state.copyWith(error: error.toString());
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> dismissAlert(String alertId) async {
    try {
      await _repository.updateAlertStatus(alertId, FraudAlertStatus.falsePositive);
      await loadFraudAlerts();
    } catch (error) {
      state = state.copyWith(error: error.toString());
      rethrow;
    }
  }

  Future<void> escalateAlert(String alertId) async {
    try {
      await _repository.updateAlertStatus(alertId, FraudAlertStatus.escalated);
      await loadFraudAlerts();
    } catch (error) {
      state = state.copyWith(error: error.toString());
      rethrow;
    }
  }

  Future<void> dismissAllAlerts() async {
    try {
      state = state.copyWith(isLoading: true);
      for (final alert in state.alerts) {
        await _repository.updateAlertStatus(alert.id, FraudAlertStatus.falsePositive);
      }
      await loadFraudAlerts();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  void setFilter({
    FraudAlertSeverity? severity,
    FraudAlertStatus? status,
    FraudAlertType? type,
  }) {
    state = state.copyWith(
      filterSeverity: severity,
      filterStatus: status,
      filterType: type,
    );
    loadFraudAlerts(severity: severity, status: status, type: type);
  }
}

class FraudDetectionState {
  final List<FraudAlert> alerts;
  final List<FraudPattern> patterns;
  final RiskAssessment? currentAssessment;
  final bool isLoading;
  final String? error;
  final FraudAlertSeverity? filterSeverity;
  final FraudAlertStatus? filterStatus;
  final FraudAlertType? filterType;

  const FraudDetectionState({
    this.alerts = const [],
    this.patterns = const [],
    this.currentAssessment,
    this.isLoading = false,
    this.error,
    this.filterSeverity,
    this.filterStatus,
    this.filterType,
  });

  FraudDetectionState copyWith({
    List<FraudAlert>? alerts,
    List<FraudPattern>? patterns,
    RiskAssessment? currentAssessment,
    bool? isLoading,
    String? error,
    FraudAlertSeverity? filterSeverity,
    FraudAlertStatus? filterStatus,
    FraudAlertType? filterType,
  }) {
    return FraudDetectionState(
      alerts: alerts ?? this.alerts,
      patterns: patterns ?? this.patterns,
      currentAssessment: currentAssessment ?? this.currentAssessment,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      filterSeverity: filterSeverity ?? this.filterSeverity,
      filterStatus: filterStatus ?? this.filterStatus,
      filterType: filterType ?? this.filterType,
    );
  }
}