import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/order.dart';

part 'api_responses.freezed.dart';
part 'api_responses.g.dart';

/// Base API response structure
@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    String? message,
    T? data,
    String? error,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    // Manual implementation since _$ApiResponseFromJson isn't defined
    return ApiResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      error: json['error'] as String?,
    );
  }
}

// Helper methods removed as they were unused

/// Pagination info for API responses
@freezed
class PaginationInfo with _$PaginationInfo {
  const factory PaginationInfo({
    required int currentPage,
    required int totalPages,
    required int totalItems,
    required int itemsPerPage,
    required bool hasNextPage,
    required bool hasPreviousPage,
  }) = _PaginationInfo;

  factory PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoFromJson(json);

  factory PaginationInfo.empty() => const PaginationInfo(
        currentPage: 1,
        totalPages: 1,
        totalItems: 0,
        itemsPerPage: 20,
        hasNextPage: false,
        hasPreviousPage: false,
      );
}

/// Guest order response
@freezed
class GuestOrderResponse with _$GuestOrderResponse {
  const factory GuestOrderResponse({
    required String orderId,
    required String trackingUrl,
    String? paymentUrl,
    String? estimatedDeliveryTime,
    required bool success,
    String? error,
  }) = _GuestOrderResponse;

  factory GuestOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderResponseFromJson(json);
}

/// Guest order request
@freezed
class GuestOrderRequest with _$GuestOrderRequest {
  const factory GuestOrderRequest({
    required String restaurantId,
    required List<GuestOrderItem> items,
    required String deliveryAddress,
    required GuestOrderCoordinates deliveryCoordinates,
    required String guestName,
    required String guestPhone,
    String? guestEmail,
    @Default('cash') String paymentMethod,
    String? specialInstructions,
    DateTime? scheduledDeliveryTime,
  }) = _GuestOrderRequest;

  factory GuestOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderRequestFromJson(json);
}

/// Guest order item
@freezed
class GuestOrderItem with _$GuestOrderItem {
  const factory GuestOrderItem({
    required String menuId,
    required int quantity,
    String? customizations,
  }) = _GuestOrderItem;

  factory GuestOrderItem.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderItemFromJson(json);
}

/// Guest order coordinates
@freezed
class GuestOrderCoordinates with _$GuestOrderCoordinates {
  const factory GuestOrderCoordinates({
    required double lat,
    required double lng,
  }) = _GuestOrderCoordinates;

  factory GuestOrderCoordinates.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderCoordinatesFromJson(json);
}

/// Wallet response
@freezed
class WalletResponse with _$WalletResponse {
  const factory WalletResponse({
    required double balance,
    required String currency,
    required List<WalletTransaction> recentTransactions,
    required bool success,
    String? error,
  }) = _WalletResponse;

  factory WalletResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletResponseFromJson(json);
}

/// Wallet transaction
@freezed
class WalletTransaction with _$WalletTransaction {
  const factory WalletTransaction({
    required String id,
    required String type, // 'credit', 'debit'
    required double amount,
    required String currency,
    required String description,
    required DateTime createdAt,
    String? reference,
    String? status,
  }) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionFromJson(json);
}

/// Loyalty response
@freezed
class LoyaltyResponse with _$LoyaltyResponse {
  const factory LoyaltyResponse({
    required int points,
    required String tier,
    required List<LoyaltyReward> availableRewards,
    required int totalEarned,
    required int totalRedeemed,
    required bool success,
    String? error,
  }) = _LoyaltyResponse;

  factory LoyaltyResponse.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyResponseFromJson(json);
}

/// Loyalty reward
@freezed
class LoyaltyReward with _$LoyaltyReward {
  const factory LoyaltyReward({
    required String id,
    required String title,
    required String description,
    required int pointsCost,
    required String type, // 'discount', 'freeItem', 'delivery'
    String? imageUrl,
    DateTime? expiresAt,
    required bool isAvailable,
  }) = _LoyaltyReward;

  factory LoyaltyReward.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyRewardFromJson(json);
}

/// Order tracking response
@freezed
class OrderTrackingResponse with _$OrderTrackingResponse {
  const factory OrderTrackingResponse({
    required Order order,
    DriverLocation? driverLocation,
    required List<OrderStatusHistory> statusHistory,
    String? estimatedArrival,
    required bool success,
    String? error,
  }) = _OrderTrackingResponse;

  factory OrderTrackingResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderTrackingResponseFromJson(json);
}

/// Driver location for real-time tracking
@freezed
class DriverLocation with _$DriverLocation {
  const factory DriverLocation({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
    double? accuracy,
    double? bearing,
    double? speed,
  }) = _DriverLocation;

  factory DriverLocation.fromJson(Map<String, dynamic> json) =>
      _$DriverLocationFromJson(json);
}

/// Order status history
@freezed
class OrderStatusHistory with _$OrderStatusHistory {
  const factory OrderStatusHistory({
    required OrderStatus status,
    required DateTime timestamp,
    String? note,
    String? updatedBy,
  }) = _OrderStatusHistory;

  factory OrderStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusHistoryFromJson(json);
}

/// Restaurant review response
@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    required String id,
    required String message,
    required bool success,
    String? error,
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
}

/// Review request
@freezed
class ReviewRequest with _$ReviewRequest {
  const factory ReviewRequest({
    required String orderId,
    required int rating,
    required String comment,
    List<String>? tags,
  }) = _ReviewRequest;

  factory ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestFromJson(json);
}

/// Order status update for WebSocket
@freezed
class OrderStatusUpdate with _$OrderStatusUpdate {
  const factory OrderStatusUpdate({
    required String orderId,
    required OrderStatus status,
    required DateTime timestamp,
    String? message,
    String? updatedBy,
    DriverLocation? driverLocation,
  }) = _OrderStatusUpdate;

  factory OrderStatusUpdate.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusUpdateFromJson(json);
}
