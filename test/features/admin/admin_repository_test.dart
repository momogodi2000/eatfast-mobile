/// Admin Repository Tests
/// Tests for the admin repository implementation
/// Covers user management, restaurant management, and order operations
library;

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:eatfast_mobile/shared/services/admin/data/repositories/admin_repository_impl.dart';
import 'package:eatfast_mobile/shared/services/admin/data/services/admin_api_service.dart';

class MockAdminApiService extends Mock implements AdminApiService {}

void main() {
  late AdminRepositoryImpl repository;
  late MockAdminApiService mockApiService;

  setUp(() {
    mockApiService = MockAdminApiService();
    repository = AdminRepositoryImpl(apiService: mockApiService);
  });

  group('Dashboard Operations', () {
    test('getDashboardStats returns stats on success', () async {
      // Arrange
      final mockStats = {
        'success': true,
        'overview': {
          'totalUsers': 1000,
          'activeUsers': 500,
          'totalRestaurants': 50,
          'activeRestaurants': 40,
          'totalOrders': 5000,
          'activeDeliveries': 20,
          'revenue': 1000000,
          'avgDeliveryTime': 25
        },
        'charts': {
          'hourlyOrders': [],
          'hourlyRevenue': [],
          'ordersByStatus': []
        }
      };

      when(() => mockApiService.getDashboardStats(timeframe: any(named: 'timeframe')))
          .thenAnswer((_) async => mockStats);

      // Act
      final result = await repository.getDashboardStats(timeframe: '24h');

      // Assert
      expect(result.isSuccess, true);
      final stats = result.getOrNull();
      expect(stats, isNotNull);
      expect(stats!['overview']['totalUsers'], 1000);
      verify(() => mockApiService.getDashboardStats(timeframe: '24h')).called(1);
    });

    test('getDashboardStats returns failure on error', () async {
      // Arrange
      when(() => mockApiService.getDashboardStats(timeframe: any(named: 'timeframe')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: '/admin/dashboard/stats'),
        message: 'Network error',
      ));

      // Act
      final result = await repository.getDashboardStats(timeframe: '24h');

      // Assert
      expect(result.isFailure, true);
    });

    test('getLiveDeliveries returns deliveries list on success', () async {
      // Arrange
      final mockDeliveries = [
        {
          'id': '1',
          'orderId': '12345',
          'status': 'in_progress',
          'driver': {
            'id': 'driver1',
            'firstName': 'John',
            'lastName': 'Doe'
          }
        }
      ];

      when(() => mockApiService.getLiveDeliveries())
          .thenAnswer((_) async => mockDeliveries);

      // Act
      final result = await repository.getLiveDeliveries();

      // Assert
      expect(result.isSuccess, true);
      final data = result.getOrNull();
      expect(data!.length, 1);
      expect(data[0]['id'], '1');
    });
  });

  group('User Management', () {
    test('getUsers returns paginated user list on success', () async {
      // Arrange
      final mockUsers = [
        {
          'id': '1',
          'email': 'user1@test.com',
          'firstName': 'User',
          'lastName': 'One',
          'role': 'customer',
          'status': 'active'
        }
      ];

      when(() => mockApiService.getUsers(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            role: any(named: 'role'),
            status: any(named: 'status'),
            city: any(named: 'city'),
            search: any(named: 'search'),
            sortBy: any(named: 'sortBy'),
            sortOrder: any(named: 'sortOrder'),
          )).thenAnswer((_) async => mockUsers);

      // Act
      final result = await repository.getUsers(page: 1, limit: 20);

      // Assert
      expect(result.isSuccess, true);
      final data = result.getOrNull();
      expect(data!.length, 1);
      expect(data[0]['email'], 'user1@test.com');
    });

    test('createUser creates new user successfully', () async {
      // Arrange
      final mockResponse = {
        'success': true,
        'message': 'Utilisateur créé avec succès',
        'user': {
          'id': 'new-user-id',
          'email': 'newuser@test.com',
          'role': 'customer'
        }
      };

      when(() => mockApiService.createUser(
            email: any(named: 'email'),
            password: any(named: 'password'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            phone: any(named: 'phone'),
            role: any(named: 'role'),
          )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.createUser(
        email: 'newuser@test.com',
        password: 'Password123!',
        firstName: 'New',
        lastName: 'User',
        phone: '+237677123456',
        role: 'customer',
      );

      // Assert
      expect(result.isSuccess, true);
      final response = result.getOrNull();
      expect(response, isNotNull);
      expect(response!['user']['email'], 'newuser@test.com');
    });

    test('updateUserStatus suspends user successfully', () async {
      // Arrange
      when(() => mockApiService.updateUserStatus(any(), any()))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.updateUserStatus(
        'user-id',
        'suspended',
      );

      // Assert
      expect(result.isSuccess, true);
      verify(() => mockApiService.updateUserStatus('user-id', 'suspended')).called(1);
    });

    test('deleteUser soft deletes user successfully', () async {
      // Arrange
      when(() => mockApiService.deleteUser(any()))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.deleteUser('user-id');

      // Assert
      expect(result.isSuccess, true);
      verify(() => mockApiService.deleteUser('user-id')).called(1);
    });

    test('resetUserPassword resets password successfully', () async {
      // Arrange
      when(() => mockApiService.resetUserPassword(any()))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.resetUserPassword('user-id');

      // Assert
      expect(result.isSuccess, true);
      verify(() => mockApiService.resetUserPassword('user-id')).called(1);
    });
  });

  group('Restaurant Management', () {
    test('getRestaurants returns restaurant list on success', () async {
      // Arrange
      final mockRestaurants = [
        {
          'id': '1',
          'name': 'Test Restaurant',
          'validationStatus': 'pending',
          'commissionRate': 5
        }
      ];

      when(() => mockApiService.getRestaurants())
          .thenAnswer((_) async => mockRestaurants);

      // Act
      final result = await repository.getRestaurants();

      // Assert
      expect(result.isSuccess, true);
      final data = result.getOrNull();
      expect(data!.length, 1);
      expect(data[0]['name'], 'Test Restaurant');
    });

    test('validateRestaurant approves restaurant successfully', () async {
      // Arrange
      when(() => mockApiService.validateRestaurant(any()))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.validateRestaurant('restaurant-id');

      // Assert
      expect(result.isSuccess, true);
      verify(() => mockApiService.validateRestaurant('restaurant-id')).called(1);
    });

    test('setCommissionRate updates commission rate successfully', () async {
      // Arrange
      when(() => mockApiService.setCommissionRate(any(), any()))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.setCommissionRate('restaurant-id', 15.0);

      // Assert
      expect(result.isSuccess, true);
      verify(() => mockApiService.setCommissionRate('restaurant-id', 15.0)).called(1);
    });
  });

  group('Order Management', () {
    test('getOrders returns order list on success', () async {
      // Arrange
      final mockOrders = [
        {
          'id': '1',
          'customerId': 'customer1',
          'status': 'completed',
          'totalAmount': 10000
        }
      ];

      when(() => mockApiService.getOrders())
          .thenAnswer((_) async => mockOrders);

      // Act
      final result = await repository.getOrders();

      // Assert
      expect(result.isSuccess, true);
      final data = result.getOrNull();
      expect(data!.length, 1);
      expect(data[0]['status'], 'completed');
    });

    test('cancelOrder cancels order with refund successfully', () async {
      // Arrange
      when(() => mockApiService.cancelOrder(any()))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.cancelOrder('order-id');

      // Assert
      expect(result.isSuccess, true);
      verify(() => mockApiService.cancelOrder('order-id')).called(1);
    });

    test('refundOrder processes refund successfully', () async {
      // Arrange
      when(() => mockApiService.refundOrder(any()))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.refundOrder('order-id');

      // Assert
      expect(result.isSuccess, true);
      verify(() => mockApiService.refundOrder('order-id')).called(1);
    });
  });

  group('Financial Reports', () {
    test('getFinancialReport generates report successfully', () async {
      // Arrange
      final mockReport = {
        'success': true,
        'report': {
          'period': {
            'startDate': '2025-09-01',
            'endDate': '2025-10-01'
          },
          'summary': {
            'totalRevenue': 1000000,
            'totalCommissions': 50000,
            'netRevenue': 950000
          },
          'paymentMethods': [],
          'restaurantBreakdown': [],
          'dailyRevenue': []
        }
      };

      when(() => mockApiService.getFinancialReport(timeframe: any(named: 'timeframe')))
          .thenAnswer((_) async => mockReport);

      // Act
      final result = await repository.getFinancialReport(timeframe: '30d');

      // Assert
      expect(result.isSuccess, true);
      final report = result.getOrNull();
      expect(report!['report']['summary']['totalRevenue'], 1000000);
    });
  });

  group('Error Handling', () {
    test('handles network errors gracefully', () async {
      // Arrange
      when(() => mockApiService.getDashboardStats(timeframe: any(named: 'timeframe')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: '/admin/dashboard/stats'),
        type: DioExceptionType.connectionTimeout,
        message: 'Connection timeout',
      ));

      // Act
      final result = await repository.getDashboardStats(timeframe: '24h');

      // Assert
      expect(result.isFailure, true);
    });

    test('handles server errors gracefully', () async {
      // Arrange
      when(() => mockApiService.getUsers(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            role: any(named: 'role'),
            status: any(named: 'status'),
            city: any(named: 'city'),
            search: any(named: 'search'),
            sortBy: any(named: 'sortBy'),
            sortOrder: any(named: 'sortOrder'),
          )).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/admin/users'),
        response: Response(
          requestOptions: RequestOptions(path: '/admin/users'),
          statusCode: 500,
          data: {'success': false, 'error': 'Internal server error'},
        ),
      ));

      // Act
      final result = await repository.getUsers();

      // Assert
      expect(result.isFailure, true);
    });
  });
}
