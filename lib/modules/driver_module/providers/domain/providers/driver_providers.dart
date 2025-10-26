import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/driver_profile.dart';
import 'package:eatfast_mobile/shared/models/driver_earnings.dart';
import 'package:eatfast_mobile/shared/models/delivery_order.dart';
import 'package:eatfast_mobile/modules/driver_module/services/data/driver_service.dart';

// Driver profile provider
final driverProfileProvider = StateNotifierProvider<DriverProfileNotifier, DriverProfile?>((ref) {
  return DriverProfileNotifier(ref);
});

class DriverProfileNotifier extends StateNotifier<DriverProfile?> {
  final Ref _ref;
  
  DriverProfileNotifier(this._ref) : super(null);
  
  Future<void> fetchDriverProfile(String driverId) async {
    try {
      final profile = await _ref.read(driverServiceProvider).getDriverProfile(driverId);
      state = profile;
    } catch (e) {
      throw Exception('Failed to fetch driver profile: ${e.toString()}');
    }
  }
}

// Driver earnings provider
final driverEarningsProvider = StateNotifierProvider<DriverEarningsNotifier, DriverEarnings?>((ref) {
  return DriverEarningsNotifier(ref);
});

class DriverEarningsNotifier extends StateNotifier<DriverEarnings?> {
  final Ref _ref;
  
  DriverEarningsNotifier(this._ref) : super(null);
  
  Future<void> fetchDriverEarnings(String driverId) async {
    try {
      final earnings = await _ref.read(driverServiceProvider).getDriverEarnings(driverId);
      state = earnings;
    } catch (e) {
      throw Exception('Failed to fetch driver earnings: ${e.toString()}');
    }
  }
}

// Available orders provider
final availableOrdersProvider = StateNotifierProvider<AvailableOrdersNotifier, List<DeliveryOrder>>((ref) {
  return AvailableOrdersNotifier(ref);
});

class AvailableOrdersNotifier extends StateNotifier<List<DeliveryOrder>> {
  final Ref _ref;
  
  AvailableOrdersNotifier(this._ref) : super([]);
  
  Future<void> fetchAvailableOrders() async {
    try {
      final orders = await _ref.read(driverServiceProvider).getAvailableOrders();
      state = orders;
    } catch (e) {
      throw Exception('Failed to fetch available orders: ${e.toString()}');
    }
  }
}

// Active delivery provider
final activeDeliveryProvider = StateNotifierProvider<ActiveDeliveryNotifier, DeliveryOrder?>((ref) {
  return ActiveDeliveryNotifier(ref);
});

class ActiveDeliveryNotifier extends StateNotifier<DeliveryOrder?> {
  final Ref _ref;
  
  ActiveDeliveryNotifier(this._ref) : super(null);
  
  Future<void> fetchActiveDelivery(String driverId) async {
    try {
      final delivery = await _ref.read(driverServiceProvider).getActiveDelivery(driverId);
      state = delivery;
    } catch (e) {
      throw Exception('Failed to fetch active delivery: ${e.toString()}');
    }
  }
}

// Provider for DriverService
final driverServiceProvider = Provider<DriverService>((ref) => DriverService());
