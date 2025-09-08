import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_client.dart';
import '../../constants/api_constants.dart';
import '../socket/socket_service.dart';

/// Driver service for delivery driver operations
class DriverService {
  static final DriverService _instance = DriverService._internal();
  factory DriverService() => _instance;
  
  final ApiClient _apiClient = ApiClient();
  final SocketService _socketService = SocketService();
  
  DriverService._internal();
  
  /// Get driver profile
  Future<DriverProfileResponse> getDriverProfile() async {
    try {
      final response = await _apiClient.get(ApiConstants.driverProfile);
      
      if (response.statusCode == 200) {
        final profile = DriverProfile.fromJson(response.data['profile']);
        return DriverProfileResponse(
          profile: profile,
          success: true,
        );
      } else {
        return DriverProfileResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to load profile',
        );
      }
    } catch (e) {
      return DriverProfileResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get available delivery orders
  Future<AvailableOrdersResponse> getAvailableOrders({
    double? lat,
    double? lng,
    double? radiusKm,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.driverOrders}/available-orders',
        queryParameters: {
          if (lat != null) 'lat': lat.toString(),
          if (lng != null) 'lng': lng.toString(),
          if (radiusKm != null) 'radius': radiusKm.toString(),
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        final orders = (data['orders'] as List)
            .map((json) => AvailableOrder.fromJson(json))
            .toList();
        
        return AvailableOrdersResponse(
          orders: orders,
          pagination: DriverPaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return AvailableOrdersResponse(
          orders: [],
          pagination: DriverPaginationInfo.empty(),
          success: false,
          error: response.data['message'] ?? 'Failed to load available orders',
        );
      }
    } catch (e) {
      return AvailableOrdersResponse(
        orders: [],
        pagination: DriverPaginationInfo.empty(),
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Accept a delivery order
  Future<bool> acceptOrder(String orderId) async {
    try {
      final response = await _apiClient.post('${ApiConstants.driverOrders}/$orderId/accept');
      
      if (response.statusCode == 200) {
        // Update driver status via socket
        _socketService.updateDriverStatus(
          status: 'assigned',
          orderId: orderId,
        );
        return true;
      }
      
      return false;
    } catch (e) {
      return false;
    }
  }
  
  /// Update driver location
  Future<bool> updateLocation({
    required double lat,
    required double lng,
    String? orderId,
  }) async {
    try {
      final response = await _apiClient.put(
        ApiConstants.driverLocation,
        data: {
          'lat': lat,
          'lng': lng,
          if (orderId != null) 'orderId': orderId,
        },
      );
      
      if (response.statusCode == 200 && orderId != null) {
        // Send real-time location update via socket
        _socketService.updateDriverLocation(
          orderId: orderId,
          lat: lat,
          lng: lng,
        );
      }
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Update order status (picked up, delivered, etc.)
  Future<bool> updateOrderStatus(String orderId, String status) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.driverOrders}/$orderId/status',
        data: {'status': status},
      );
      
      if (response.statusCode == 200) {
        // Update driver status via socket
        _socketService.updateDriverStatus(
          status: status,
          orderId: orderId,
        );
      }
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get current delivery assignments
  Future<DriverAssignmentsResponse> getCurrentAssignments() async {
    try {
      final response = await _apiClient.get('${ApiConstants.driverOrders}/current');
      
      if (response.statusCode == 200) {
        final data = response.data;
        final assignments = (data['assignments'] as List)
            .map((json) => DriverAssignment.fromJson(json))
            .toList();
        
        return DriverAssignmentsResponse(
          assignments: assignments,
          success: true,
        );
      } else {
        return DriverAssignmentsResponse(
          assignments: [],
          success: false,
          error: response.data['message'] ?? 'Failed to load assignments',
        );
      }
    } catch (e) {
      return DriverAssignmentsResponse(
        assignments: [],
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get driver earnings summary
  Future<DriverEarningsResponse> getEarnings({
    DateTime? fromDate,
    DateTime? toDate,
    String? period, // daily, weekly, monthly
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.driverEarnings,
        queryParameters: {
          if (fromDate != null) 'fromDate': fromDate.toIso8601String(),
          if (toDate != null) 'toDate': toDate.toIso8601String(),
          if (period != null) 'period': period,
        },
      );
      
      if (response.statusCode == 200) {
        final earnings = DriverEarnings.fromJson(response.data);
        return DriverEarningsResponse(
          earnings: earnings,
          success: true,
        );
      } else {
        return DriverEarningsResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to load earnings',
        );
      }
    } catch (e) {
      return DriverEarningsResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Set driver availability status
  Future<bool> setAvailabilityStatus(bool isAvailable) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.driverProfile}/availability',
        data: {'isAvailable': isAvailable},
      );
      
      if (response.statusCode == 200) {
        // Update status via socket
        _socketService.updateDriverStatus(
          status: isAvailable ? 'available' : 'offline',
        );
      }
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Upload delivery proof (photo, signature, etc.)
  Future<bool> uploadDeliveryProof({
    required String orderId,
    required String proofType, // 'photo', 'signature'
    required String filePath,
  }) async {
    try {
      // Implementation would depend on file upload mechanism
      // For now, returning a placeholder
      return true;
    } catch (e) {
      return false;
    }
  }
  
  /// Report delivery issue
  Future<bool> reportDeliveryIssue({
    required String orderId,
    required String issueType,
    required String description,
    String? photoPath,
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.driverOrders}/$orderId/report-issue',
        data: {
          'issueType': issueType,
          'description': description,
          if (photoPath != null) 'photoPath': photoPath,
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  String _handleError(dynamic error) {
    if (error.response != null) {
      final data = error.response.data;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return data['message'];
      }
      return 'Server error: ${error.response.statusCode}';
    }
    return 'Network error occurred';
  }
}

// Driver response models

class DriverProfileResponse {
  final DriverProfile? profile;
  final bool success;
  final String? error;
  
  DriverProfileResponse({
    this.profile,
    required this.success,
    this.error,
  });
}

class AvailableOrdersResponse {
  final List<AvailableOrder> orders;
  final DriverPaginationInfo pagination;
  final bool success;
  final String? error;
  
  AvailableOrdersResponse({
    required this.orders,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class DriverAssignmentsResponse {
  final List<DriverAssignment> assignments;
  final bool success;
  final String? error;
  
  DriverAssignmentsResponse({
    required this.assignments,
    required this.success,
    this.error,
  });
}

class DriverEarningsResponse {
  final DriverEarnings? earnings;
  final bool success;
  final String? error;
  
  DriverEarningsResponse({
    this.earnings,
    required this.success,
    this.error,
  });
}

// Driver data models

class DriverProfile {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final bool isAvailable;
  final String status;
  final double rating;
  final int totalDeliveries;
  final VehicleInfo vehicleInfo;
  final DriverLocation? currentLocation;
  
  DriverProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.isAvailable,
    required this.status,
    required this.rating,
    required this.totalDeliveries,
    required this.vehicleInfo,
    this.currentLocation,
  });
  
  String get fullName => '$firstName $lastName';
  
  factory DriverProfile.fromJson(Map<String, dynamic> json) {
    return DriverProfile(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      isAvailable: json['isAvailable'] as bool,
      status: json['status'] as String,
      rating: (json['rating'] ?? 0).toDouble(),
      totalDeliveries: json['totalDeliveries'] ?? 0,
      vehicleInfo: VehicleInfo.fromJson(json['vehicleInfo']),
      currentLocation: json['currentLocation'] != null 
        ? DriverLocation.fromJson(json['currentLocation'])
        : null,
    );
  }
}

class VehicleInfo {
  final String type; // motorcycle, car, bicycle
  final String? make;
  final String? model;
  final String? plateNumber;
  
  VehicleInfo({
    required this.type,
    this.make,
    this.model,
    this.plateNumber,
  });
  
  factory VehicleInfo.fromJson(Map<String, dynamic> json) {
    return VehicleInfo(
      type: json['type'] as String,
      make: json['make'] as String?,
      model: json['model'] as String?,
      plateNumber: json['plateNumber'] as String?,
    );
  }
}

class DriverLocation {
  final double lat;
  final double lng;
  final DateTime timestamp;
  
  DriverLocation({
    required this.lat,
    required this.lng,
    required this.timestamp,
  });
  
  factory DriverLocation.fromJson(Map<String, dynamic> json) {
    return DriverLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

class AvailableOrder {
  final String orderId;
  final String restaurantName;
  final String restaurantAddress;
  final String deliveryAddress;
  final double deliveryFee;
  final double distance;
  final int estimatedTime;
  final DateTime pickupTime;
  
  AvailableOrder({
    required this.orderId,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.deliveryAddress,
    required this.deliveryFee,
    required this.distance,
    required this.estimatedTime,
    required this.pickupTime,
  });
  
  factory AvailableOrder.fromJson(Map<String, dynamic> json) {
    return AvailableOrder(
      orderId: json['orderId'] as String,
      restaurantName: json['restaurantName'] as String,
      restaurantAddress: json['restaurantAddress'] as String,
      deliveryAddress: json['deliveryAddress'] as String,
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      estimatedTime: json['estimatedTime'] as int,
      pickupTime: DateTime.parse(json['pickupTime'] as String),
    );
  }
}

class DriverAssignment {
  final String orderId;
  final String status;
  final String restaurantName;
  final String restaurantAddress;
  final String deliveryAddress;
  final String customerName;
  final String customerPhone;
  final DateTime scheduledPickupTime;
  final DateTime? actualPickupTime;
  final DateTime? estimatedDeliveryTime;
  
  DriverAssignment({
    required this.orderId,
    required this.status,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.deliveryAddress,
    required this.customerName,
    required this.customerPhone,
    required this.scheduledPickupTime,
    this.actualPickupTime,
    this.estimatedDeliveryTime,
  });
  
  factory DriverAssignment.fromJson(Map<String, dynamic> json) {
    return DriverAssignment(
      orderId: json['orderId'] as String,
      status: json['status'] as String,
      restaurantName: json['restaurantName'] as String,
      restaurantAddress: json['restaurantAddress'] as String,
      deliveryAddress: json['deliveryAddress'] as String,
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      scheduledPickupTime: DateTime.parse(json['scheduledPickupTime'] as String),
      actualPickupTime: json['actualPickupTime'] != null 
        ? DateTime.parse(json['actualPickupTime'] as String)
        : null,
      estimatedDeliveryTime: json['estimatedDeliveryTime'] != null 
        ? DateTime.parse(json['estimatedDeliveryTime'] as String)
        : null,
    );
  }
}

class DriverEarnings {
  final double todayEarnings;
  final double weekEarnings;
  final double monthEarnings;
  final double totalEarnings;
  final int totalDeliveries;
  final double averageRating;
  final List<EarningsBreakdown> breakdown;
  
  DriverEarnings({
    required this.todayEarnings,
    required this.weekEarnings,
    required this.monthEarnings,
    required this.totalEarnings,
    required this.totalDeliveries,
    required this.averageRating,
    required this.breakdown,
  });
  
  factory DriverEarnings.fromJson(Map<String, dynamic> json) {
    return DriverEarnings(
      todayEarnings: (json['todayEarnings'] ?? 0).toDouble(),
      weekEarnings: (json['weekEarnings'] ?? 0).toDouble(),
      monthEarnings: (json['monthEarnings'] ?? 0).toDouble(),
      totalEarnings: (json['totalEarnings'] ?? 0).toDouble(),
      totalDeliveries: json['totalDeliveries'] ?? 0,
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      breakdown: (json['breakdown'] as List? ?? [])
          .map((json) => EarningsBreakdown.fromJson(json))
          .toList(),
    );
  }
}

class EarningsBreakdown {
  final DateTime date;
  final double amount;
  final int deliveries;
  
  EarningsBreakdown({
    required this.date,
    required this.amount,
    required this.deliveries,
  });
  
  factory EarningsBreakdown.fromJson(Map<String, dynamic> json) {
    return EarningsBreakdown(
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      deliveries: json['deliveries'] as int,
    );
  }
}

class DriverPaginationInfo {
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  
  DriverPaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
  
  factory DriverPaginationInfo.fromJson(Map<String, dynamic> json) {
    return DriverPaginationInfo(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
  
  factory DriverPaginationInfo.empty() {
    return DriverPaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

// Provider for driver service
final driverServiceProvider = Provider<DriverService>((ref) => DriverService());
