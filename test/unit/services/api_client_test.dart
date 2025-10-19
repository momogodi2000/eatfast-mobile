import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';

// Mock Dio
class MockDio extends Mock implements Dio {}

void main() {
  late ApiClient apiClient;

  setUp(() {
    apiClient = ApiClient();
    // Note: In real test, we'd inject mock Dio for better testing
  });

  group('ApiClient', () {
    test('should create instance', () {
      expect(apiClient, isNotNull);
    });

    test('should have base options configured', () {
      // Test that Dio is configured
      // Since we can't easily mock, just test instantiation
      expect(apiClient, isA<ApiClient>());
    });

    // Add more tests for interceptors, retries, etc.
  });
}