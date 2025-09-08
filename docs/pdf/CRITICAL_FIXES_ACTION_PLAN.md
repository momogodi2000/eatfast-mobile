# 🚨 Eat Fast Mobile - Critical Fixes Action Plan

## 🔥 IMMEDIATE FIXES (Do These First)

### 1. **Fix API Endpoint Constants** (CRITICAL)
**File:** `lib/core/constants/api_constants.dart`

**Problem:** Endpoints don't match backend routes
```dart
// CURRENT (BROKEN)
static const String restaurants = '/public/restaurants'; // Wrong!

// FIX (CORRECT)
static const String restaurants = '/public/restaurants';
static const String restaurantDetails = '/public/restaurants/{id}';
static const String restaurantMenu = '/public/restaurants/{id}/menu';
static const String guestOrders = '/public/guest/orders';
static const String wallet = '/client/wallet';
static const String loyalty = '/client/loyalty';
```

### 2. **Fix Restaurant Model Serialization** (CRITICAL)
**File:** `lib/features/restaurants/domain/models/restaurant.dart`

**Problem:** Model doesn't match backend schema
```dart
@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    // ... existing fields
    required String cuisineType, // FIX: Change from List<String> cuisineTypes
    Map<String, dynamic>? openingHours, // FIX: Change from List<OperatingHours>
    List<String>? images, // FIX: Change from single logo/coverImage
    String? city, // FIX: Add missing city field
    bool? isVerified, // FIX: Add verification status
  }) = _Restaurant;
}
```

### 3. **Add Missing Response Models** (CRITICAL)
**File:** `lib/core/models/api_responses.dart` (Create this file)

```dart
@freezed
class GuestOrderResponse with _$GuestOrderResponse {
  const factory GuestOrderResponse({
    required String orderId,
    required String trackingUrl,
    String? paymentUrl,
  }) = _GuestOrderResponse;
}

@freezed
class WalletResponse with _$WalletResponse {
  const factory WalletResponse({
    required double balance,
    required List<WalletTransaction> transactions,
  }) = _WalletResponse;
}

@freezed
class LoyaltyResponse with _$LoyaltyResponse {
  const factory LoyaltyResponse({
    required int points,
    required String tier,
    required List<LoyaltyReward> availableRewards,
  }) = _LoyaltyResponse;
}
```

### 4. **Fix Order Status Mapping** (CRITICAL)
**File:** `lib/features/orders/domain/models/order.dart`

**Problem:** Missing backend order statuses
```dart
enum OrderStatus {
  @JsonValue('created')
  created,           // ADD: Missing
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('accepted')
  accepted,          // ADD: Missing
  @JsonValue('rejected')
  rejected,          // ADD: Missing
  @JsonValue('preparing')
  preparing,
  @JsonValue('ready_for_pickup')
  readyForPickup,    // ADD: Missing
  @JsonValue('assigned_driver')
  assignedDriver,    // ADD: Missing
  @JsonValue('picked_up')
  pickedUp,
  @JsonValue('in_transit')
  inTransit,         // ADD: Missing
  @JsonValue('delivered')
  delivered,
  @JsonValue('completed')
  completed,         // ADD: Missing
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('refunded')
  refunded,
  @JsonValue('expired')
  expired,           // ADD: Missing
}
```

## 🛠️ SERVICE IMPLEMENTATION FIXES

### 5. **Add Guest Order Service** (HIGH PRIORITY)
**File:** `lib/core/services/guest/guest_service.dart`

```dart
class GuestService {
  final ApiClient _apiClient;

  Future<GuestOrderResponse> createGuestOrder(GuestOrderRequest request) async {
    final response = await _apiClient.post(
      ApiConstants.guestOrders,
      data: request.toJson(),
    );
    return GuestOrderResponse.fromJson(response.data);
  }

  Future<OrderTrackingResponse> trackGuestOrder(String orderId) async {
    final response = await _apiClient.get(
      '${ApiConstants.guestOrderTracking.replaceAll('{id}', orderId)}',
    );
    return OrderTrackingResponse.fromJson(response.data);
  }
}
```

### 6. **Add Wallet Service** (HIGH PRIORITY)
**File:** `lib/core/services/wallet/wallet_service.dart`

```dart
class WalletService {
  final ApiClient _apiClient;

  Future<WalletResponse> getWalletBalance() async {
    final response = await _apiClient.get(ApiConstants.wallet);
    return WalletResponse.fromJson(response.data);
  }

  Future<void> addFunds(double amount, PaymentMethod method) async {
    await _apiClient.post(
      '${ApiConstants.wallet}/topup',
      data: {'amount': amount, 'method': method.name},
    );
  }
}
```

### 7. **Add Loyalty Service** (HIGH PRIORITY)
**File:** `lib/core/services/loyalty/loyalty_service.dart`

```dart
class LoyaltyService {
  final ApiClient _apiClient;

  Future<LoyaltyResponse> getLoyaltyStatus() async {
    final response = await _apiClient.get(ApiConstants.loyalty);
    return LoyaltyResponse.fromJson(response.data);
  }

  Future<void> redeemPoints(int points, String rewardId) async {
    await _apiClient.post(
      '${ApiConstants.loyalty}/redeem',
      data: {'points': points, 'rewardId': rewardId},
    );
  }
}
```

## 🔧 ERROR HANDLING FIXES

### 8. **Fix API Error Handler** (MEDIUM PRIORITY)
**File:** `lib/core/services/api/error_handler.dart`

```dart
class ApiErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout. Check your internet.';
        case DioExceptionType.receiveTimeout:
          return 'Server taking too long to respond.';
        case DioExceptionType.badResponse:
          return _handleHttpError(error.response);
        default:
          return 'Network error occurred.';
      }
    }
    return error.toString();
  }

  static String _handleHttpError(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    switch (statusCode) {
      case 400:
        return data?['message'] ?? 'Invalid request data.';
      case 401:
        return 'Authentication required.';
      case 403:
        return 'Access denied.';
      case 404:
        return 'Resource not found.';
      case 429:
        return 'Too many requests. Try again later.';
      case 500:
        return 'Server error. Try again later.';
      default:
        return 'An error occurred.';
    }
  }
}
```

## 📱 UI FIXES

### 9. **Add Loading States** (MEDIUM PRIORITY)
**File:** `lib/core/widgets/loading_overlay.dart`

```dart
class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final String? message;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black54,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  if (message != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      message!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}
```

### 10. **Fix Missing Keys in Lists** (LOW PRIORITY)
**Problem:** ListView/GridView items missing keys

**Fix:** Add keys to all list items
```dart
ListView.builder(
  itemBuilder: (context, index) {
    return ListTile(
      key: ValueKey(items[index].id), // ADD THIS
      title: Text(items[index].name),
    );
  },
);
```

## 🧪 TESTING FIXES

### 11. **Add Basic Tests** (MEDIUM PRIORITY)
**File:** `test/api_client_test.dart`

```dart
void main() {
  group('ApiClient', () {
    test('should handle successful response', () async {
      // Test implementation
    });

    test('should handle error response', () async {
      // Test implementation
    });
  });
}
```

## 📋 QUICK CHECKLIST

### ✅ **Pre-Flight Checks**
- [ ] API endpoints match backend routes
- [ ] Models serialize correctly with backend
- [ ] Error handling implemented
- [ ] Loading states added
- [ ] Keys added to list items

### 🔄 **Test These Flows**
- [ ] User registration/login
- [ ] Restaurant browsing
- [ ] Menu viewing
- [ ] Order placement
- [ ] Order tracking
- [ ] Guest orders

### 📊 **Verify Backend Integration**
- [ ] All CRUD operations work
- [ ] Real-time updates function
- [ ] Payment processing works
- [ ] File uploads work

## 🎯 SUCCESS CRITERIA

**After implementing these fixes:**
- ✅ Flutter analyze shows < 50 issues
- ✅ All basic user flows work
- ✅ API communication is stable
- ✅ Error handling is comprehensive
- ✅ App is ready for feature development

## 🚀 NEXT STEPS

1. **Implement fixes 1-4** (Critical API fixes)
2. **Test basic functionality** (Login, restaurant browsing)
3. **Implement fixes 5-7** (Missing services)
4. **Add error handling** (Fix 8)
5. **Polish UI** (Fixes 9-10)
6. **Run Flutter analyze** and fix remaining issues

**Estimated Time:** 2-3 days for critical fixes, 1 week for full implementation.</content>
<parameter name="filePath">e:\Eat Fast App\eatfast-mobile\CRITICAL_FIXES_ACTION_PLAN.md
