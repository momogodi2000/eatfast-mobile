# 📱🖥️ EatFast Mobile-Backend Synchronization Plan

## Executive Summary

This document provides a comprehensive technical implementation plan to synchronize the Flutter mobile app with the Express.js backend, ensuring complete feature parity, real payment flows, and zero analyze errors.

---

## 🔍 Current State Analysis

### ✅ Backend Capabilities (Well-Implemented)
- **Complete API ecosystem** with versioned routes (`/v1`, `/client`, `/admin`, `/driver`, `/restaurant`)
- **Robust authentication** (OAuth, 2FA, OTP, JWT refresh)
- **Payment processing** with CamPay → NouPay → Stripe failover logic
- **Guest session management** (`/guest/*` endpoints)
- **Order lifecycle management** with real-time tracking
- **Comprehensive webhook handlers** (Stripe, CamPay)
- **Role-based access control** (guest, customer, owner, driver, admin)

### ⚠️ Mobile App Gaps (Need Implementation)
- **Incomplete payment integration** (stubs instead of real flows)
- **Missing guest session persistence**
- **Partial order tracking implementation**
- **Incomplete checkout flows** (TODOs in code)
- **Missing backend API service calls**
- **Flutter analyze errors** (timeouts, missing imports)

---

## 🎯 Implementation Plan

### **Phase 1: Foundation & API Integration (Week 1-2)**

#### 1.1 Fix Flutter Analyze Errors
```bash
# Priority fixes needed:
- Remove unused imports and dead code
- Complete missing model classes (GuestOrderData, GuestOrderRequest, etc.)
- Fix import errors for non-existent files
- Resolve dependency conflicts
```

#### 1.2 Complete API Constants & Client Configuration
**File**: `lib/core/constants/api_constants.dart`
```dart
class ApiConstants {
  // Guest endpoints (align with backend /guest/*)
  static const String guestCreateSession = '/guest/session';
  static const String guestAddToCart = '/guest/cart/add';
  static const String guestCheckout = '/guest/checkout';

  // Payment endpoints (align with backend /payments/*)
  static const String createPaymentIntent = '/payments/process';
  static const String confirmPayment = '/payments/confirm';
  static const String paymentStatus = '/payments/status';

  // Order endpoints (align with backend /client/orders/*)
  static const String createOrder = '/client/orders';
  static const String trackOrder = '/client/orders/{id}/track';

  // Webhooks (for local testing)
  static const String stripeWebhook = '/webhooks/stripe';
  static const String campayWebhook = '/webhooks/campay';
}
```

#### 1.3 Guest Session Service Implementation
**File**: `lib/features/guest/data/guest_service.dart`
```dart
class GuestService {
  // Implement proper backend communication:
  // POST /guest/session → get sessionId
  // Store sessionId in FlutterSecureStorage
  // Include sessionId in X-Guest-Session header for all guest requests

  Future<String> initializeGuestSession() async {
    final response = await _apiClient.post('/guest/session');
    final sessionId = response.data['sessionId'];
    await _secureStorage.write(key: 'guest_session_id', value: sessionId);
    return sessionId;
  }
}
```

### **Phase 2: Payment Flow Implementation (Week 2-3)**

#### 2.1 Complete Payment Service Integration
**File**: `lib/core/services/payment/unified_payment_service.dart`
- ✅ **Already well-structured** - mirrors backend failover logic
- **Action needed**: Integrate with real Stripe SDK and CamPay/NouPay APIs

#### 2.2 Real Stripe Integration
```dart
// Add flutter_stripe package integration
class StripePaymentHandler {
  Future<PaymentResponse> processStripePayment({
    required String clientSecret,
    required double amount,
  }) async {
    // Real Stripe payment implementation
    final paymentMethod = await Stripe.instance.createPaymentMethod(...);
    final paymentIntent = await Stripe.instance.confirmPayment(...);
    return PaymentResponse.fromStripeResult(paymentIntent);
  }
}
```

#### 2.3 Mobile Money Integration (CamPay/NouPay)
```dart
class MobileMoneyHandler {
  Future<PaymentResponse> processMobileMoneyPayment({
    required String phoneNumber,
    required double amount,
    required PaymentProvider provider, // campay, noupay
  }) async {
    // Backend handles PSP communication
    // Mobile just initiates and polls for status
    final response = await _paymentService.processPayment(
      method: PaymentMethod.campay,
      phoneNumber: phoneNumber,
      amount: amount,
    );

    // Poll payment status until completion
    return _pollPaymentStatus(response.paymentId);
  }
}
```

### **Phase 3: Order Lifecycle & Tracking (Week 3-4)**

#### 3.1 Complete Order Tracking Implementation
**Current Issue**: `GuestOrderTrackingScreen` is placeholder
```dart
class GuestOrderTrackingScreen extends StatefulWidget {
  // Real-time order tracking with Socket.IO
  // Backend WebSocket: /socket.io with order events
  // Status updates: created → paid → preparing → out_for_delivery → delivered
}
```

#### 3.2 Real-time Updates via Socket.IO
```dart
class OrderTrackingService {
  late IO.Socket socket;

  void initializeSocket() {
    socket = IO.io(ApiConstants.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.on('order_status_update', (data) {
      // Update order status in real-time
      _notifyOrderStatusChange(data);
    });
  }
}
```

### **Phase 4: Complete Checkout Flows (Week 4)**

#### 4.1 Fix Guest Checkout Screen
**File**: `lib/features/guest/presentation/screens/guest_checkout_screen.dart`
- ✅ **Well-structured UI** but missing backend integration
- **Action needed**: Complete `_placeOrder()` method with real API calls

#### 4.2 Fix Authenticated User Checkout
**File**: `lib/features/cart/presentation/screens/checkout_screen.dart`
- **Current issue**: All TODOs for address/payment selection
- **Action needed**: Implement address picker and payment method selector

#### 4.3 Address Management Integration
```dart
class AddressService {
  Future<List<UserAddress>> getUserAddresses() async {
    final response = await _apiClient.get('/user/addresses');
    return (response.data as List)
        .map((addr) => UserAddress.fromJson(addr))
        .toList();
  }
}
```

### **Phase 5: Enhanced Features (Week 5)**

#### 5.1 Convert Guest to User Flow
```dart
class GuestConversionService {
  Future<bool> convertGuestToUser({
    required String guestSessionId,
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post('/guest/convert', data: {
      'sessionId': guestSessionId,
      'email': email,
      'password': password,
    });
    return response.statusCode == 200;
  }
}
```

#### 5.2 Complete Admin/Restaurant/Driver Flows
- **Admin Dashboard**: Connect to `/admin/dashboard` endpoint
- **Restaurant Management**: Connect to `/restaurant/*` endpoints
- **Driver Tracking**: Connect to `/driver/*` endpoints

---

## 🧪 Testing & Validation Plan

### **Payment Flow Testing**
1. **Stripe Integration**
   ```bash
   # Test with Stripe test keys
   # Verify webhook receipt at /webhooks/stripe
   # Test card payment end-to-end
   ```

2. **Mobile Money Testing**
   ```bash
   # Test CamPay/NouPay integration with backend
   # Verify PSP webhook handling
   # Test payment status polling
   ```

3. **Guest Flow Testing**
   ```bash
   # Guest session creation
   # Add items to cart
   # Complete checkout without registration
   # Convert guest to registered user
   ```

### **Flutter Analyze Resolution**
```bash
cd eatfast-mobile
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter analyze --no-fatal-infos
# Target: 0 errors, minimal warnings
```

---

## 📋 Acceptance Criteria Checklist

### ✅ **Core Functionality**
- [ ] Guest can browse restaurants and add items to cart
- [ ] Guest checkout works with real payments (Stripe + Mobile Money)
- [ ] Registered users can login and place orders
- [ ] Real-time order tracking works end-to-end
- [ ] Payment webhooks update order status correctly
- [ ] Guest orders can be converted to user accounts

### ✅ **Technical Requirements**
- [ ] Flutter analyze shows 0 errors
- [ ] All backend endpoints properly integrated
- [ ] Payment flows use real PSP integration (no mocks)
- [ ] WebSocket real-time updates functional
- [ ] Proper error handling for network/payment failures
- [ ] Idempotency and retry logic implemented

### ✅ **User Experience**
- [ ] Smooth guest-to-registered user conversion
- [ ] Clear payment status feedback
- [ ] Proper loading states during payments
- [ ] Offline capability for order viewing
- [ ] Push notifications for order updates

### ✅ **Multi-Role Support**
- [ ] Customer flow: browse → order → track → rate
- [ ] Restaurant owner: manage menu → accept orders → update status
- [ ] Driver: accept deliveries → update location → complete delivery
- [ ] Admin: platform overview → user management → financial reports

---

## 🚀 Implementation Priority

**🔥 Critical (Week 1)**: Flutter analyze fixes, API constants, Guest session management
**⚡ High (Week 2)**: Real payment integration (Stripe + Mobile Money)
**📈 Medium (Week 3)**: Order tracking, real-time updates
**✨ Enhancement (Week 4-5)**: Complete checkout flows, multi-role features

---

## 📋 Development Checklist

### **Before Starting**
- [ ] Backup current codebase
- [ ] Set up development environment with backend running locally
- [ ] Configure test payment providers (Stripe test mode, CamPay sandbox)
- [ ] Set up proper Git workflow with feature branches

### **Daily Progress Tracking**
- [ ] Run `flutter analyze` daily and fix emerging issues
- [ ] Test payment flows with real money (small amounts)
- [ ] Verify backend webhook reception
- [ ] Update progress in this document

### **Pre-Deployment**
- [ ] Full end-to-end testing
- [ ] Performance testing on low-end devices
- [ ] Security audit of payment flows
- [ ] User acceptance testing

---

**🎯 Goal**: Transform the current Flutter app into a production-ready mobile application that perfectly mirrors the sophisticated backend capabilities, with real payment processing and zero technical debt.**