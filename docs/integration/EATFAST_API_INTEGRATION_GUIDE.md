# EatFast API Integration Guide
## Complete Backend-to-Mobile Integration Documentation

**Version**: 1.0  
**Last Updated**: October 26, 2025  
**Base URL**: `https://api.eatfast.com/api/v1` (Production)  
**Development URL**: `http://localhost:3001/api/v1`

---

## Table of Contents

1. [Authentication API](#1-authentication-api)
2. [Guest User API](#2-guest-user-api)
3. [Client/Customer API](#3-clientcustomer-api)
4. [Restaurant Owner API](#4-restaurant-owner-api)
5. [Driver/Delivery Agent API](#5-driverdelivery-agent-api)
6. [Admin API](#6-admin-api)
7. [Payment API](#7-payment-api)
8. [WebSocket Events](#8-websocket-events)
9. [Error Codes Reference](#9-error-codes-reference)
10. [Flutter Integration Examples](#10-flutter-integration-examples)

---

## 1. Authentication API

### Base Path: `/api/v1/auth`

### 1.1 User Registration

**Endpoint**: `POST /auth/register`  
**Authentication**: ❌ None  
**Rate Limit**: 10 requests/hour per IP

**Request Body**:
```json
{
  "email": "user@example.com",
  "password": "SecurePassword123!",
  "firstName": "John",
  "lastName": "Doe",
  "phone": "+237670000001",
  "role": "customer",
  "city": "Yaoundé"
}
```

**Success Response (201)**:
```json
{
  "success": true,
  "message": "Utilisateur créé avec succès",
  "data": {
    "id": "uuid-v4",
    "email": "user@example.com",
    "firstName": "John",
    "lastName": "Doe",
    "role": "customer"
  }
}
```

**Flutter Implementation**:
```dart
Future<AuthResult> register({
  required String name,
  required String email,
  required String password,
  required String phone,
  required UserRole role,
}) async {
  final response = await _apiClient.post(
    ApiConstants.register,
    data: {
      'firstName': name.split(' ').first,
      'lastName': name.split(' ').skip(1).join(' '),
      'email': email,
      'password': password,
      'phone': phone,
      'role': role.value,
    },
  );
  
  if (response.statusCode == 201) {
    final registerResponse = RegisterResponse.fromJson(response.data);
    // Save tokens and user data
    return AuthResult.success(user: registerResponse.user);
  }
  
  return AuthResult.failure(message: response.data['message']);
}
```

---

### 1.2 User Login

**Endpoint**: `POST /auth/login`  
**Authentication**: ❌ None  
**Rate Limit**: 5 requests/15min per IP+Email

**Request Body**:
```json
{
  "email": "user@example.com",
  "password": "SecurePassword123!"
}
```

**Success Response (200)** - No 2FA:
```json
{
  "success": true,
  "message": "Connexion réussie",
  "data": {
    "user": {
      "id": "uuid",
      "email": "user@example.com",
      "firstName": "John",
      "lastName": "Doe",
      "role": "customer",
      "loyaltyPoints": 1500,
      "loyaltyTier": "silver"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expiresIn": 21600
  }
}
```

**Success Response (200)** - 2FA Required:
```json
{
  "success": true,
  "data": {
    "requiresTwoFactor": true,
    "userId": "uuid",
    "method": "totp",
    "twoFactorMethods": ["totp", "sms", "email"]
  }
}
```

**Error Response (401)** - Invalid Credentials:
```json
{
  "success": false,
  "error": "Identifiants invalides. 3 tentative(s) restante(s)",
  "code": "INVALID_CREDENTIALS",
  "details": {
    "remainingAttempts": 3
  }
}
```

**Error Response (403)** - Account Locked:
```json
{
  "success": false,
  "error": "Compte verrouillé après 5 tentatives échouées. Réessayez dans 15 minutes",
  "code": "ACCOUNT_LOCKED",
  "details": {
    "lockedUntil": "2025-10-26T15:30:00Z",
    "minutesRemaining": 15
  }
}
```

---

### 1.3 Refresh Token

**Endpoint**: `POST /auth/refresh`  
**Authentication**: ❌ None  
**Rate Limit**: 20 requests/hour per token

**Request Body**:
```json
{
  "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "accessToken": "new_jwt_token",
    "expiresIn": 21600
  }
}
```

**Flutter Implementation**:
```dart
Future<String?> refreshAccessToken() async {
  final refreshToken = await _storage.getRefreshToken();
  if (refreshToken == null) return null;
  
  final response = await _apiClient.post(
    ApiConstants.refresh,
    data: {'refresh_token': refreshToken},
  );
  
  if (response.statusCode == 200) {
    final newToken = response.data['data']['accessToken'];
    await _storage.saveAuthToken(newToken);
    return newToken;
  }
  
  return null;
}
```

---

### 1.4 Logout

**Endpoint**: `POST /auth/logout`  
**Authentication**: ✅ Required (Bearer Token)

**Success Response (200)**:
```json
{
  "success": true,
  "message": "Déconnexion réussie"
}
```

---

### 1.5 Password Reset Request

**Endpoint**: `POST /auth/password/reset-request`  
**Authentication**: ❌ None

**Request Body**:
```json
{
  "email": "user@example.com"
}
```

**Success Response (200)**:
```json
{
  "success": true,
  "message": "Code de réinitialisation envoyé à votre email"
}
```

---

### 1.6 Verify Reset Code

**Endpoint**: `POST /auth/password/verify-code`  
**Authentication**: ❌ None

**Request Body**:
```json
{
  "email": "user@example.com",
  "code": "123456"
}
```

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "resetToken": "secure_reset_token"
  }
}
```

---

### 1.7 Reset Password

**Endpoint**: `POST /auth/password/reset`  
**Authentication**: ❌ None

**Request Body**:
```json
{
  "resetToken": "secure_reset_token",
  "newPassword": "NewSecurePassword123!"
}
```

**Success Response (200)**:
```json
{
  "success": true,
  "message": "Mot de passe réinitialisé avec succès"
}
```

---

### 1.8 Google OAuth

**Endpoint**: `GET /oauth/google`  
**Authentication**: ❌ None

**Description**: Redirects to Google OAuth consent screen

**Callback**: `GET /oauth/google/callback`

**Mobile Deep Link**: `eatfast://auth/success?token=...&refreshToken=...`

---

### 1.9 Apple OAuth

**Endpoint**: `GET /oauth/apple`  
**Authentication**: ❌ None

**Callback**: `POST /oauth/apple/callback`

---

### 1.10 Two-Factor Authentication

#### Setup TOTP

**Endpoint**: `POST /auth/2fa/setup/totp`  
**Authentication**: ✅ Required

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "secret": "BASE32_SECRET_KEY",
    "qrCode": "data:image/png;base64,..."
  }
}
```

#### Verify TOTP

**Endpoint**: `POST /auth/2fa/verify/totp`  
**Authentication**: ✅ Required

**Request Body**:
```json
{
  "token": "123456"
}
```

---

## 2. Guest User API

### Base Path: `/api/v1/guest`

### 2.1 Create Guest Session

**Endpoint**: `POST /guest/session`  
**Authentication**: ❌ None

**Success Response (201)**:
```json
{
  "success": true,
  "sessionId": "uuid-v4",
  "message": "Session visiteur créée",
  "cart": {
    "items": [],
    "total": 0,
    "restaurantId": null
  }
}
```

**Flutter Implementation**:
```dart
Future<String> createGuestSession() async {
  final response = await _apiClient.post('/guest/session');
  
  if (response.statusCode == 201) {
    final sessionId = response.data['sessionId'];
    await _storage.saveGuestSessionId(sessionId);
    return sessionId;
  }
  
  throw Exception('Failed to create guest session');
}
```

---

### 2.2 Browse Restaurants (Guest)

**Endpoint**: `GET /guest/restaurants`  
**Authentication**: ❌ None

**Query Parameters**:
- `city`: string (optional)
- `cuisine`: string (optional)
- `minRating`: number (optional)
- `page`: number (default: 1)
- `limit`: number (default: 20)

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "restaurants": [
      {
        "id": "uuid",
        "name": "Pizza Palace",
        "cuisineType": "Italian",
        "rating": 4.5,
        "totalReviews": 150,
        "deliveryFee": 500,
        "estimatedDeliveryTime": 30,
        "image": "https://..."
      }
    ],
    "total": 50,
    "page": 1,
    "limit": 20
  }
}
```

---

### 2.3 Get Guest Cart

**Endpoint**: `GET /guest/cart`  
**Authentication**: ❌ None  
**Headers**: `X-Session-ID: <guest-session-id>`

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "cart": {
      "items": [
        {
          "id": "uuid",
          "menuItem": {
            "id": "uuid",
            "name": "Margherita Pizza",
            "price": 3500,
            "image": "https://..."
          },
          "quantity": 2,
          "subtotal": 7000
        }
      ],
      "totalPrice": 7000,
      "itemCount": 2,
      "restaurantId": "uuid"
    }
  }
}
```

---

### 2.4 Add to Guest Cart

**Endpoint**: `POST /guest/cart/add`  
**Authentication**: ❌ None  
**Headers**: `X-Session-ID: <guest-session-id>`

**Request Body**:
```json
{
  "menuId": "uuid",
  "quantity": 2,
  "options": {}
}
```

**Success Response (200)**:
```json
{
  "success": true,
  "message": "Item added to cart",
  "data": {
    "cart": { /* cart details */ }
  }
}
```

---

### 2.5 Create Guest Order

**Endpoint**: `POST /guest/orders`  
**Authentication**: ❌ None  
**Headers**: `X-Session-ID: <guest-session-id>`

**Request Body**:
```json
{
  "guestName": "John Doe",
  "guestPhone": "+237670000001",
  "guestEmail": "john@example.com",
  "deliveryAddress": {
    "street": "123 Main St",
    "city": "Yaoundé",
    "neighborhood": "Bastos",
    "coordinates": {
      "lat": 3.8480,
      "lng": 11.5021
    }
  },
  "paymentMethod": "cash",
  "deliveryInstructions": "Ring doorbell twice"
}
```

**Success Response (201)**:
```json
{
  "success": true,
  "message": "Order created successfully",
  "data": {
    "order": {
      "id": "uuid",
      "orderNumber": "GUEST-20251026-0001",
      "totalAmount": 7500,
      "status": "created",
      "trackingUrl": "https://eatfast.cm/track/uuid"
    }
  }
}
```

---

### 2.6 Track Guest Order

**Endpoint**: `POST /guest/order-tracking`  
**Authentication**: ❌ None

**Request Body**:
```json
{
  "orderId": "uuid",
  "phone": "+237670000001"
}
```

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "order": {
      "id": "uuid",
      "status": "in_transit",
      "estimatedDeliveryTime": "2025-10-26T18:30:00Z",
      "timeline": [
        {
          "status": "created",
          "timestamp": "2025-10-26T17:00:00Z",
          "message": "Order placed"
        },
        {
          "status": "confirmed",
          "timestamp": "2025-10-26T17:05:00Z",
          "message": "Restaurant confirmed order"
        }
      ]
    }
  }
}
```

---

### 2.7 Convert Guest to User

**Endpoint**: `POST /guest/convert`  
**Authentication**: ❌ None

**Request Body**:
```json
{
  "sessionId": "uuid",
  "password": "SecurePassword123!"
}
```

**Success Response (200)**:
```json
{
  "success": true,
  "message": "Account created successfully",
  "data": {
    "user": { /* user details */ },
    "token": "jwt_token",
    "refreshToken": "refresh_token"
  }
}
```

---

## 3. Client/Customer API

### Base Path: `/api/v1/client`

### 3.1 Search Restaurants

**Endpoint**: `GET /client/restaurants/search`  
**Authentication**: ✅ Required

**Query Parameters**:
- `query`: string (search term)
- `city`: string
- `cuisine`: string
- `minRating`: number
- `maxDeliveryFee`: number
- `openNow`: boolean
- `page`: number
- `limit`: number

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "restaurants": [
      {
        "id": "uuid",
        "name": "Pizza Palace",
        "description": "Best pizza in town",
        "cuisineType": "Italian",
        "address": "123 Main St, Yaoundé",
        "phone": "+237670000001",
        "deliveryFee": 500,
        "minimumOrder": 2000,
        "estimatedDeliveryTime": 30,
        "rating": 4.5,
        "totalReviews": 150,
        "status": "open",
        "image": "https://..."
      }
    ],
    "total": 15,
    "page": 1,
    "limit": 10
  }
}
```

---

### 3.2 Get Restaurant Details

**Endpoint**: `GET /client/restaurants/:restaurantId`  
**Authentication**: ✅ Required

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "restaurant": {
      "id": "uuid",
      "name": "Pizza Palace",
      "description": "Best pizza in town",
      "cuisineType": "Italian",
      "address": "123 Main St, Yaoundé",
      "deliveryFee": 500,
      "minimumOrder": 2000,
      "rating": 4.5,
      "totalReviews": 150,
      "status": "open",
      "openingHours": {
        "monday": "09:00-22:00",
        "tuesday": "09:00-22:00"
      },
      "menu": [
        {
          "id": "uuid",
          "name": "Margherita Pizza",
          "description": "Classic pizza",
          "price": 3500,
          "category": "Pizza",
          "image": "https://...",
          "preparationTime": 20,
          "isAvailable": true
        }
      ]
    }
  }
}
```

---

### 3.3 Create Order

**Endpoint**: `POST /client/orders`  
**Authentication**: ✅ Required

**Request Body**:
```json
{
  "restaurant_id": "uuid",
  "items": [
    {
      "menuItemId": "uuid",
      "quantity": 2,
      "customizations": "Extra cheese, no onions"
    }
  ],
  "deliveryAddress": {
    "street": "123 Main St",
    "city": "Yaoundé",
    "neighborhood": "Bastos",
    "coordinates": {
      "lat": 3.8480,
      "lng": 11.5021
    }
  },
  "paymentMethod": "noupay",
  "specialInstructions": "Ring doorbell twice",
  "usePoints": true,
  "scheduledDeliveryTime": "2025-10-26T18:00:00Z"
}
```

**Success Response (201)**:
```json
{
  "success": true,
  "message": "Order created successfully",
  "data": {
    "order": {
      "id": "uuid",
      "orderNumber": "EF-20251026-0001",
      "status": "created",
      "restaurant": { /* restaurant details */ },
      "items": [ /* order items */ ],
      "subtotal": 7000,
      "deliveryFee": 500,
      "serviceCharge": 350,
      "loyaltyPointsUsed": 500,
      "discount": 500,
      "totalAmount": 7350,
      "estimatedDeliveryTime": "30-40 mins",
      "paymentStatus": "pending"
    }
  }
}
```

---

### 3.4 Get Order History

**Endpoint**: `GET /client/orders/history`  
**Authentication**: ✅ Required

**Query Parameters**:
- `status`: string (optional)
- `from`: date (optional)
- `to`: date (optional)
- `page`: number
- `limit`: number

---

### 3.5 Track Order

**Endpoint**: `GET /client/orders/:orderId/track`  
**Authentication**: ✅ Required

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "order": {
      "id": "uuid",
      "status": "in_transit",
      "estimatedDeliveryTime": "2025-10-26T18:30:00Z",
      "driver": {
        "id": "uuid",
        "name": "Driver Name",
        "phone": "+237670000001",
        "rating": 4.8,
        "currentLocation": {
          "lat": 3.8480,
          "lng": 11.5021
        }
      },
      "timeline": [
        {
          "status": "created",
          "timestamp": "2025-10-26T17:00:00Z",
          "message": "Order created"
        },
        {
          "status": "confirmed",
          "timestamp": "2025-10-26T17:05:00Z",
          "message": "Restaurant confirmed order"
        }
      ]
    }
  }
}
```

---

### 3.6 Get Loyalty Status

**Endpoint**: `GET /client/loyalty/status`  
**Authentication**: ✅ Required

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "points": 1500,
    "tier": "silver",
    "tierBenefits": [
      "5% discount on all orders",
      "Priority support",
      "Free delivery on orders over 10,000 XAF"
    ],
    "nextTier": "gold",
    "pointsToNextTier": 500,
    "expiringPoints": {
      "amount": 200,
      "expiresAt": "2025-11-01T00:00:00Z"
    }
  }
}
```

---

### 3.7 Get Wallet Balance

**Endpoint**: `GET /client/wallet`  
**Authentication**: ✅ Required

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "wallet": {
      "balance": 25000,
      "currency": "XAF",
      "totalCredited": 50000,
      "totalDebited": 25000
    }
  }
}
```

---

### 3.8 Top Up Wallet

**Endpoint**: `POST /client/wallet/topup`  
**Authentication**: ✅ Required

**Request Body**:
```json
{
  "amount": 10000,
  "paymentMethod": "noupay",
  "phone": "+237670000001"
}
```

**Success Response (200)**:
```json
{
  "success": true,
  "message": "Top-up initiated",
  "data": {
    "transaction": {
      "id": "uuid",
      "amount": 10000,
      "status": "pending",
      "paymentUrl": "https://payment.gateway/pay/..."
    }
  }
}
```

---

## 4. Restaurant Owner API

### Base Path: `/api/v1/restaurant`

### 4.1 Get My Restaurants

**Endpoint**: `GET /restaurant/my-restaurants`  
**Authentication**: ✅ Required (restaurant_owner role)

---

### 4.2 Create Menu Item

**Endpoint**: `POST /restaurant/menus`  
**Authentication**: ✅ Required

**Request Body** (multipart/form-data):
```
restaurantId: uuid
name: "Margherita Pizza"
description: "Classic pizza with tomato and mozzarella"
price: 3500
category: "Pizza"
preparationTime: 20
ingredients: ["tomato", "mozzarella", "basil"]
allergens: ["gluten", "dairy"]
stockQuantity: 50
isVegetarian: true
image: [file]
```

---

### 4.3 Get Restaurant Orders

**Endpoint**: `GET /restaurant/orders`  
**Authentication**: ✅ Required

**Query Parameters**:
- `status`: string
- `page`: number
- `limit`: number

---

### 4.4 Update Order Status

**Endpoint**: `PUT /restaurant/orders/:orderId/status`  
**Authentication**: ✅ Required

**Request Body**:
```json
{
  "status": "ready_for_pickup",
  "estimatedTime": 30
}
```

---

## 5. Driver/Delivery Agent API

### Base Path: `/api/v1/driver`

### 5.1 Toggle Availability

**Endpoint**: `PUT /driver/availability`  
**Authentication**: ✅ Required (delivery_agent role)

**Request Body**:
```json
{
  "isAvailable": true
}
```

---

### 5.2 Update Location

**Endpoint**: `PUT /driver/location`  
**Authentication**: ✅ Required

**Request Body**:
```json
{
  "latitude": 3.8480,
  "longitude": 11.5021,
  "heading": 45,
  "speed": 30,
  "accuracy": 10
}
```

---

### 5.3 Get Available Orders

**Endpoint**: `GET /driver/orders/available`  
**Authentication**: ✅ Required

**Query Parameters**:
- `city`: string

---

### 5.4 Accept Order

**Endpoint**: `POST /driver/orders/:orderId/accept`  
**Authentication**: ✅ Required

---

### 5.5 Complete Delivery

**Endpoint**: `POST /driver/deliveries/:deliveryId/complete`  
**Authentication**: ✅ Required

**Request Body**:
```json
{
  "verificationCode": "1234",
  "notes": "Delivered successfully"
}
```

---

### 5.6 Get Earnings Summary

**Endpoint**: `GET /driver/earnings`  
**Authentication**: ✅ Required

**Query Parameters**:
- `period`: string (today, week, month, year)

**Success Response (200)**:
```json
{
  "success": true,
  "data": {
    "earnings": {
      "total": 45000,
      "deliveries": 30,
      "averagePerDelivery": 1500,
      "breakdown": {
        "deliveryFees": 40000,
        "tips": 5000
      },
      "pending": 5000,
      "paid": 40000
    }
  }
}
```

---

## 6. Admin API

### Base Path: `/api/v1/admin`

### 6.1 Get Dashboard Statistics

**Endpoint**: `GET /admin/dashboard/stats`  
**Authentication**: ✅ Required (admin role)

**Query Parameters**:
- `period`: string (7d, 30d, 90d, 1y)

---

### 6.2 Get All Users

**Endpoint**: `GET /admin/users`  
**Authentication**: ✅ Required (admin role)

**Query Parameters**:
- `role`: string
- `status`: string
- `search`: string
- `page`: number
- `limit`: number

---

### 6.3 Validate Restaurant

**Endpoint**: `PUT /admin/restaurants/:restaurantId/validate`  
**Authentication**: ✅ Required (admin role)

**Request Body**:
```json
{
  "status": "approved",
  "notes": "All documents verified"
}
```

---

## 7. Payment API

### Base Path: `/api/v1/payments`

### 7.1 Initialize Payment

**Endpoint**: `POST /payments/initialize`  
**Authentication**: ✅ Required

**Request Body**:
```json
{
  "orderId": "uuid",
  "amount": 7500,
  "paymentMethod": "noupay",
  "phone": "+237670000001"
}
```

---

### 7.2 Verify Payment

**Endpoint**: `GET /payments/verify/:transactionId`  
**Authentication**: ✅ Required

---

## 8. WebSocket Events

### Connection

**URL**: `wss://api.eatfast.com/socket.io`

**Authentication**: Send JWT token in `auth` parameter

```dart
final socket = io('wss://api.eatfast.com', <String, dynamic>{
  'transports': ['websocket'],
  'auth': {'token': jwtToken},
});
```

---

### Order Tracking Events

**Subscribe to Order Updates**:
```dart
socket.on('order:status_changed', (data) {
  final orderId = data['orderId'];
  final newStatus = data['status'];
  final timestamp = data['timestamp'];
  // Update UI
});
```

**Event Types**:
- `order:status_changed`
- `order:assigned`
- `order:picked_up`
- `order:in_transit`
- `order:delivered`

---

### Driver Location Events

**Subscribe to Driver Location**:
```dart
socket.on('driver:location_update', (data) {
  final driverId = data['driverId'];
  final lat = data['latitude'];
  final lng = data['longitude'];
  // Update map marker
});
```

---

## 9. Error Codes Reference

| Code | Description | HTTP Status |
|------|-------------|-------------|
| `AUTH_REQUIRED` | Authentication required | 401 |
| `AUTH_INVALID_TOKEN` | Invalid or expired token | 401 |
| `AUTH_INSUFFICIENT_PERMISSIONS` | Insufficient permissions | 403 |
| `VALIDATION_ERROR` | Input validation failed | 400 |
| `RESOURCE_NOT_FOUND` | Resource not found | 404 |
| `DUPLICATE_RESOURCE` | Resource already exists | 409 |
| `RATE_LIMIT_EXCEEDED` | Too many requests | 429 |
| `PAYMENT_FAILED` | Payment processing failed | 402 |
| `ORDER_CANCELLED` | Order already cancelled | 400 |
| `RESTAURANT_CLOSED` | Restaurant is closed | 400 |
| `INSUFFICIENT_BALANCE` | Insufficient wallet balance | 400 |
| `INTERNAL_ERROR` | Internal server error | 500 |

---

## 10. Flutter Integration Examples

### 10.1 Complete Login Flow

```dart
// Login with email/password
Future<void> loginUser(String email, String password) async {
  try {
    final result = await _authService.login(
      email: email,
      password: password,
      rememberMe: true,
    );
    
    if (result.isSuccess && result.user != null) {
      // Navigate to dashboard
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else if (result.requiresTwoFactor) {
      // Navigate to 2FA screen
      Navigator.pushNamed(
        context,
        '/2fa',
        arguments: {
          'userId': result.userId,
          'methods': result.twoFactorMethods,
        },
      );
    } else {
      // Show error
      showErrorSnackbar(result.message ?? 'Login failed');
    }
  } catch (e) {
    showErrorSnackbar('An error occurred: $e');
  }
}
```

---

### 10.2 Order Creation Flow

```dart
// Create order
Future<void> createOrder() async {
  try {
    final cartItems = await _cartService.getCartItems();
    
    final order = await _orderService.createOrder(
      restaurantId: selectedRestaurant.id,
      items: cartItems.map((item) => OrderItem(
        menuItemId: item.menuItemId,
        quantity: item.quantity,
        customizations: item.customizations,
      )).toList(),
      deliveryAddress: selectedAddress,
      paymentMethod: selectedPaymentMethod,
      usePoints: useLoyaltyPoints,
    );
    
    if (order != null) {
      // Clear cart
      await _cartService.clearCart();
      
      // Navigate to order tracking
      Navigator.pushNamed(
        context,
        '/order-tracking',
        arguments: {'orderId': order.id},
      );
    }
  } catch (e) {
    showErrorSnackbar('Failed to create order: $e');
  }
}
```

---

### 10.3 Real-time Order Tracking

```dart
// Subscribe to order updates
void subscribeToOrderUpdates(String orderId) {
  _socketService.on('order:status_changed', (data) {
    if (data['orderId'] == orderId) {
      setState(() {
        orderStatus = data['status'];
        estimatedDeliveryTime = DateTime.parse(data['estimatedDeliveryTime']);
      });
    }
  });
  
  _socketService.on('driver:location_update', (data) {
    if (data['orderId'] == orderId) {
      setState(() {
        driverLocation = LatLng(
          data['latitude'],
          data['longitude'],
        );
      });
    }
  });
}

@override
void dispose() {
  _socketService.off('order:status_changed');
  _socketService.off('driver:location_update');
  super.dispose();
}
```

---

### 10.4 Error Handling Pattern

```dart
// Centralized error handling
String handleApiError(dynamic error) {
  if (error is DioException) {
    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map && data.containsKey('error')) {
        return data['error'] as String;
      }
      if (data is Map && data.containsKey('message')) {
        return data['message'] as String;
      }
    }
    
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
  
  return error.toString();
}
```

---

## Conclusion

This guide provides a comprehensive overview of the EatFast API and how to integrate it with the Flutter mobile application. For more detailed information, refer to the Swagger documentation at `/api-docs`.

**Last Updated**: October 26, 2025  
**Support**: api-support@eatfast.cm

---

