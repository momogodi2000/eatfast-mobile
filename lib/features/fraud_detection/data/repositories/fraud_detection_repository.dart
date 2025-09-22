import '../../domain/models/fraud_alert.dart';
import '../../../../core/services/api/api_client.dart';

class FraudDetectionRepository {
  final ApiClient _apiClient = ApiClient();

  Future<List<FraudAlert>> getFraudAlerts({
    FraudAlertSeverity? severity,
    FraudAlertStatus? status,
    FraudAlertType? type,
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        if (severity != null) 'severity': severity.name,
        if (status != null) 'status': status.name,
        if (type != null) 'type': type.name,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };

      final response = await _apiClient.get(
        '/fraud-detection/alerts',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => FraudAlert.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load fraud alerts: $error');
    }
  }

  Future<FraudAlert> getFraudAlert(String alertId) async {
    try {
      final response = await _apiClient.get('/fraud-detection/alerts/$alertId');
      return FraudAlert.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to load fraud alert: $error');
    }
  }

  Future<List<FraudPattern>> getFraudPatterns() async {
    try {
      final response = await _apiClient.get('/fraud-detection/patterns');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => FraudPattern.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load fraud patterns: $error');
    }
  }

  Future<FraudPattern> createFraudPattern(FraudPattern pattern) async {
    try {
      final response = await _apiClient.post(
        '/fraud-detection/patterns',
        data: pattern.toJson(),
      );
      return FraudPattern.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to create fraud pattern: $error');
    }
  }

  Future<FraudPattern> updateFraudPattern(String patternId, FraudPattern pattern) async {
    try {
      final response = await _apiClient.put(
        '/fraud-detection/patterns/$patternId',
        data: pattern.toJson(),
      );
      return FraudPattern.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to update fraud pattern: $error');
    }
  }

  Future<void> deleteFraudPattern(String patternId) async {
    try {
      await _apiClient.delete('/fraud-detection/patterns/$patternId');
    } catch (error) {
      throw Exception('Failed to delete fraud pattern: $error');
    }
  }

  Future<RiskAssessment> assessRisk(String entityId, RiskEntityType entityType) async {
    try {
      final response = await _apiClient.post(
        '/fraud-detection/assess-risk',
        data: {
          'entityId': entityId,
          'entityType': entityType.name,
        },
      );
      return RiskAssessment.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to assess risk: $error');
    }
  }

  Future<void> updateAlertStatus(String alertId, FraudAlertStatus status) async {
    try {
      await _apiClient.patch(
        '/fraud-detection/alerts/$alertId/status',
        data: {'status': status.name},
      );
    } catch (error) {
      throw Exception('Failed to update alert status: $error');
    }
  }

  Future<void> reportFalsePositive(String alertId, String reason) async {
    try {
      await _apiClient.post(
        '/fraud-detection/alerts/$alertId/false-positive',
        data: {'reason': reason},
      );
    } catch (error) {
      throw Exception('Failed to report false positive: $error');
    }
  }

  Future<Map<String, dynamic>> getFraudStatistics({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        if (startDate != null) 'startDate': startDate.toIso8601String(),
        if (endDate != null) 'endDate': endDate.toIso8601String(),
      };

      final response = await _apiClient.get(
        '/fraud-detection/statistics',
        queryParameters: queryParams,
      );

      return response.data['data'];
    } catch (error) {
      throw Exception('Failed to load fraud statistics: $error');
    }
  }

  Future<void> trainModel() async {
    try {
      await _apiClient.post('/fraud-detection/train-model');
    } catch (error) {
      throw Exception('Failed to train fraud detection model: $error');
    }
  }
}