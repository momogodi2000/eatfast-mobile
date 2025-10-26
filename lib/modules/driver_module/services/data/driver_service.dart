import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/driver_profile.dart';
import 'package:eatfast_mobile/shared/models/driver_earnings.dart';
import 'package:eatfast_mobile/shared/models/delivery_order.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';

class DriverService {
  final ApiClient _apiClient = ApiClient();
  
  // Fetch driver profile from API
  Future<DriverProfile> getDriverProfile(String driverId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.driverProfile}/$driverId');
      
      if (response.statusCode == 200) {
        return DriverProfile.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to load driver profile');
      }
    } catch (e) {
      throw Exception('Error fetching driver profile: ${e.toString()}');
    }
  }
  
  // Fetch driver earnings from API
  Future<DriverEarnings> getDriverEarnings(String driverId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.driverEarnings}/$driverId');
      
      if (response.statusCode == 200) {
        return DriverEarnings.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to load driver earnings');
      }
    } catch (e) {
      throw Exception('Error fetching driver earnings: ${e.toString()}');
    }
  }
  
  // Fetch available orders from API
  Future<List<DeliveryOrder>> getAvailableOrders() async {
    try {
      final response = await _apiClient.get(ApiConstants.availableOrders);
      
      if (response.statusCode == 200) {
        return (response.data['orders'] as List)
          .map((order) => DeliveryOrder.fromJson(order))
          .toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to load available orders');
      }
    } catch (e) {
      throw Exception('Error fetching available orders: ${e.toString()}');
    }
  }
  
  // Fetch active delivery for driver
  Future<DeliveryOrder?> getActiveDelivery(String driverId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.activeDelivery}/$driverId');
      
      if (response.statusCode == 200) {
        if (response.data['hasActiveDelivery'] == true) {
          return DeliveryOrder.fromJson(response.data['order']);
        } else {
          return null;
        }
      } else {
        throw Exception(response.data['message'] ?? 'Failed to load active delivery');
      }
    } catch (e) {
      throw Exception('Error fetching active delivery: ${e.toString()}');
    }
  }
  
  // Update driver status (online/offline)
  Future<void> updateDriverStatus({
    required String driverId,
    required bool isOnline,
  }) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.driverStatus}/$driverId',
        data: {
          'isOnline': isOnline,
        },
      );
      
      if (response.statusCode != 200) {
        throw Exception(response.data['message'] ?? 'Failed to update driver status');
      }
    } catch (e) {
      throw Exception('Error updating driver status: ${e.toString()}');
    }
  }
  
  // Accept order
  Future<void> acceptOrder({
    required String driverId,
    required String orderId,
  }) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.acceptOrder,
        {'id': orderId},
      );

      final response = await _apiClient.post(
        endpoint,
        data: {
          'driverId': driverId,
          'orderId': orderId,
          'acceptedAt': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(response.data['message'] ?? 'Failed to accept order');
      }
    } catch (e) {
      throw Exception('Error accepting order: ${e.toString()}');
    }
  }

  // Reject order
  Future<void> rejectOrder({
    required String driverId,
    required String orderId,
    required String reason,
  }) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.rejectOrder,
        {'id': orderId},
      );

      final response = await _apiClient.post(
        endpoint,
        data: {
          'driverId': driverId,
          'orderId': orderId,
          'reason': reason,
          'rejectedAt': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(response.data['message'] ?? 'Failed to reject order');
      }
    } catch (e) {
      throw Exception('Error rejecting order: ${e.toString()}');
    }
  }
  
  // Update order status
  Future<void> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.orders}/$orderId/status',
        data: {
          'status': status,
        },
      );
      
      if (response.statusCode != 200) {
        throw Exception(response.data['message'] ?? 'Failed to update order status');
      }
    } catch (e) {
      throw Exception('Error updating order status: ${e.toString()}');
    }
  }
  
  // Get driver statistics
  Future<Map<String, dynamic>> getDriverStatistics(String driverId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.driverStatistics}/$driverId');
      
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to load driver statistics');
      }
    } catch (e) {
      throw Exception('Error fetching driver statistics: ${e.toString()}');
    }
  }
}

// Provider for driver service
final driverServiceProvider = Provider<DriverService>((ref) {
  return DriverService();
});
