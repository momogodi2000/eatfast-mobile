/// Admin Repository Tests
/// Tests for the admin repository implementation
/// Covers user management, restaurant management, and order operations
library;

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:eatfast_mobile/shared/services/admin/data/repositories/admin_repository_impl.dart';
import 'package:eatfast_mobile/shared/services/admin/data/services/admin_api_service.dart';
import 'package:eatfast_mobile/shared/utils/result.dart';

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
      final mockDeliveries = {
        'success': true,
        'totalActive': 5,
        'deliveries': [
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
        ]
      };

      when(() => mockApiService.getLiveDeliveries())
          .thenAnswer((_) async => mockDeliveries);

      // Act
      final result = await repository.getLiveDeliveries();

      // Assert
      expect(result.isSuccess, true);
      final data = result.getOrNull();
      expect(data!['totalActive'], 5);
      expect(data['deliveries'].length, 1);
    });
  });

  group('User Management', () {
    test('getUsers returns paginated user list on success', () async {
      // Arrange
      final mockUsers = {
        'success': true,
        'users': [
          {
            'id': '1',
            'email': 'user1@test.com',
            'firstName': 'User',
            'lastName': 'One',
            'role': 'customer',
            'status': 'active'
          }
        ],
        'pagination': {
          'total': 1,
          'page': 1,
          'pages': 1,
          'limit': 20
        }
      };

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
      expect(data!['users'].length, 1);
      expect(data['pagination']['total'], 1);
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
            city: any(named: 'city'),
            address: any(named: 'address'),
            status: any(named: 'status'),
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
      final user = result.getOrNull();
      expect(user!['email'], 'newuser@test.com');
    });

    test('updateUserStatus suspends user successfully', () async {
      // Arrange
      final mockResponse = {
        'success': true,
        'message': 'Utilisateur suspendu avec succès',
        'user': {
          'id': 'user-id',
          'status': 'suspended'
        }
      };

      when(() => mockApiService.updateUserStatus(
            any(),
            status: any(named: 'status'),
            reason: any(named: 'reason'),
          )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.updateUserStatus(
        'user-id',
        status: 'suspended',
        reason: 'Policy violation',
      );

      // Assert
      expect(result.isSuccess, true);
      final user = result.getOrNull();
      expect(user!['status'], 'suspended');
    });

    test('deleteUser soft deletes user successfully', () async {
      // Arrange
      final mockResponse = {
        'success': true,
        'message': 'Utilisateur supprimé avec succès'
      };

      when(() => mockApiService.deleteUser(
            any(),
            reason: any(named: 'reason'),
          )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.deleteUser(
        'user-id',
        reason: 'User requested deletion',
      );

      // Assert
      expect(result.isSuccess, true);
    });

    test('resetUserPassword resets password successfully', () async {
      // Arrange
      final mockResponse = {
        'success': true,
        'message': 'Mot de passe réinitialisé avec succès'
      };

      when(() => mockApiService.resetUserPassword(
            any(),
            newPassword: any(named: 'newPassword'),
            sendEmail: any(named: 'sendEmail'),
          )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.resetUserPassword(
        'user-id',
        newPassword: 'NewPassword123!',
        sendEmail: true,
      );

      // Assert
      expect(result.isSuccess, true);
    });
  });

  group('Restaurant Management', () {
    test('getRestaurants returns restaurant list on success', () async {
      // Arrange
      final mockRestaurants = {
        'success': true,
        'restaurants': [
          {
            'id': '1',
            'name': 'Test Restaurant',
            'validationStatus': 'pending',
            'commissionRate': 5
          }
        ]
      };

      when(() => mockApiService.getRestaurants(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            status: any(named: 'status'),
            search: any(named: 'search'),
            city: any(named: 'city'),
          )).thenAnswer((_) async => mockRestaurants);

      // Act
      final result = await repository.getRestaurants(page: 1, limit: 20);

      // Assert
      expect(result.isSuccess, true);
      final data = result.getOrNull();
      expect(data!['restaurants'].length, 1);
    });

    test('validateRestaurant approves restaurant successfully', () async {
      // Arrange
      final mockResponse = {
        'success': true,
        'message': 'Restaurant approuvé avec succès',
        'restaurant': {
          'id': 'restaurant-id',
          'validationStatus': 'approved'
        }
      };

      when(() => mockApiService.validateRestaurant(
            any(),
            status: any(named: 'status'),
            reason: any(named: 'reason'),
            commissionRate: any(named: 'commissionRate'),
          )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.validateRestaurant(
        'restaurant-id',
        status: 'approved',
        reason: 'All requirements met',
        commissionRate: 10.0,
      );

      // Assert
      expect(result.isSuccess, true);
      final restaurant = result.getOrNull();
      expect(restaurant!['validationStatus'], 'approved');
    });

    test('setCommissionRate updates commission rate successfully', () async {
      // Arrange
      final mockResponse = {
        'success': true,
        'message': 'Taux de commission mis à jour',
        'restaurant': {
          'id': 'restaurant-id',
          'commissionRate': 15
        }
      };

      when(() => mockApiService.setCommissionRate(
            any(),
            commissionRate: any(named: 'commissionRate'),
            effectiveDate: any(named: 'effectiveDate'),
            reason: any(named: 'reason'),
          )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.setCommissionRate(
        'restaurant-id',
        commissionRate: 15.0,
        reason: 'High performance restaurant',
      );

      // Assert
      expect(result.isSuccess, true);
      final restaurant = result.getOrNull();
      expect(restaurant!['commissionRate'], 15);
    });
  });

  group('Order Management', () {
    test('getOrders returns order list on success', () async {
      // Arrange
      final mockOrders = {
        'success': true,
        'orders': [
          {
            'id': '1',
            'customerId': 'customer1',
            'status': 'completed',
            'totalAmount': 10000
          }
        ]
      };

      when(() => mockApiService.getOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            status: any(named: 'status'),
            search: any(named: 'search'),
            fromDate: any(named: 'fromDate'),
            toDate: any(named: 'toDate'),
          )).thenAnswer((_) async => mockOrders);

      // Act
      final result = await repository.getOrders(page: 1, limit: 20);

      // Assert
      expect(result.isSuccess, true);
      final data = result.getOrNull();
      expect(data!['orders'].length, 1);
    });

    test('cancelOrder cancels order with refund successfully', () async {
      // Arrange
      final mockResponse = {
        'success': true,
        'message': 'Commande annulée avec succès',
        'order': {
          'id': 'order-id',
          'status': 'cancelled',
          'refunded': true
        }
      };

      when(() => mockApiService.cancelOrder(
            orderId: any(named: 'orderId'),
            reason: any(named: 'reason'),
            notifyCustomer: any(named: 'notifyCustomer'),
          )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.cancelOrder(
        orderId: 'order-id',
        reason: 'Restaurant unable to fulfill',
        notifyCustomer: true,
      );

      // Assert
      expect(result.isSuccess, true);
      final order = result.getOrNull();
      expect(order!['status'], 'cancelled');
      expect(order['refunded'], true);
    });

    test('refundOrder processes refund successfully', () async {
      // Arrange
      final mockResponse = {
        'success': true,
        'message': 'Remboursement effectué avec succès',
        'refund': {
          'orderId': 'order-id',
          'amount': 10000,
          'method': 'wallet'
        }
      };

      when(() => mockApiService.refundOrder(
            orderId: any(named: 'orderId'),
            amount: any(named: 'amount'),
            reason: any(named: 'reason'),
            refundMethod: any(named: 'refundMethod'),
          )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.refundOrder(
        orderId: 'order-id',
        amount: 10000,
        reason: 'Customer complaint',
        refundMethod: 'wallet',
      );

      // Assert
      expect(result.isSuccess, true);
      final refund = result.getOrNull();
      expect(refund!['amount'], 10000);
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

      when(() => mockApiService.getFinancialReport(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            restaurantId: any(named: 'restaurantId'),
          )).thenAnswer((_) async => mockReport);

      // Act
      final result = await repository.getFinancialReport(
        startDate: DateTime(2025, 9, 1),
        endDate: DateTime(2025, 10, 1),
      );

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
      final result = await repository.getDashboardStats();

      // Assert
      expect(result.isFailure, true);
      expect(result.exceptionOrNull(), isA<DioException>());
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
