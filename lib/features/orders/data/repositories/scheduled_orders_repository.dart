import '../../domain/models/scheduled_order.dart';
import '../../../../core/services/api/api_client.dart';

class ScheduledOrdersRepository {
  final ApiClient _apiClient = ApiClient();

  Future<List<ScheduledOrder>> getScheduledOrders() async {
    try {
      final response = await _apiClient.get('/scheduled-orders');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => ScheduledOrder.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load scheduled orders: $error');
    }
  }

  Future<ScheduledOrder> getScheduledOrder(String orderId) async {
    try {
      final response = await _apiClient.get('/scheduled-orders/$orderId');
      return ScheduledOrder.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to load scheduled order: $error');
    }
  }

  Future<ScheduledOrder> createScheduledOrder(CreateScheduledOrderRequest request) async {
    try {
      final response = await _apiClient.post(
        '/scheduled-orders',
        data: request.toJson(),
      );
      return ScheduledOrder.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to create scheduled order: $error');
    }
  }

  Future<ScheduledOrder> updateScheduledOrder(String orderId, CreateScheduledOrderRequest request) async {
    try {
      final response = await _apiClient.put(
        '/scheduled-orders/$orderId',
        data: request.toJson(),
      );
      return ScheduledOrder.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to update scheduled order: $error');
    }
  }

  Future<void> cancelScheduledOrder(String orderId) async {
    try {
      await _apiClient.post('/scheduled-orders/$orderId/cancel');
    } catch (error) {
      throw Exception('Failed to cancel scheduled order: $error');
    }
  }

  Future<void> toggleRecurringOrder(String orderId) async {
    try {
      await _apiClient.post('/scheduled-orders/$orderId/toggle-recurring');
    } catch (error) {
      throw Exception('Failed to toggle recurring order: $error');
    }
  }

  Future<void> pauseScheduledOrder(String orderId) async {
    try {
      await _apiClient.post('/scheduled-orders/$orderId/pause');
    } catch (error) {
      throw Exception('Failed to pause scheduled order: $error');
    }
  }

  Future<void> resumeScheduledOrder(String orderId) async {
    try {
      await _apiClient.post('/scheduled-orders/$orderId/resume');
    } catch (error) {
      throw Exception('Failed to resume scheduled order: $error');
    }
  }
}