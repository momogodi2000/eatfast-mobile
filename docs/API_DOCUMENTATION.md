# EatFast Mobile App - API Documentation

## Table of Contents
1. [Overview](#overview)
2. [Authentication APIs](#authentication-apis)
3. [User Management APIs](#user-management-apis)
4. [Restaurant APIs](#restaurant-apis)
5. [Order Management APIs](#order-management-apis)
6. [Payment APIs](#payment-apis)
7. [Location APIs](#location-apis)
8. [Notification APIs](#notification-apis)
9. [Admin APIs](#admin-apis)
10. [Error Handling](#error-handling)
11. [Rate Limiting](#rate-limiting)
12. [SDK Integration](#sdk-integration)

---

## Overview

The EatFast API provides comprehensive endpoints for managing food delivery operations across multiple user types. The API follows RESTful principles and uses JSON for data exchange.

### Base URLs
- **Development**: `https://api-dev.eatfast.com`
- **Production**: `https://api.eatfast.com`
- **Staging**: `https://api-staging.eatfast.com`

### Authentication
All API requests require authentication using JWT tokens in the Authorization header:
```
Authorization: Bearer <jwt_token>
```

### Content Type
All requests and responses use JSON:
```
Content-Type: application/json
Accept: application/json
```

### API Versioning
The API uses URL-based versioning:
```
https://api.eatfast.com/v1/endpoint
```

---

## Authentication APIs

### 1. User Registration

#### POST /v1/auth/register
Register a new user account.

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "securePassword123",
  "firstName": "John",
  "lastName": "Doe",
  "phone": "+237123456789",
  "role": "customer",
  "city": "yaounde",
  "language": "fr"
}
```

**Response (201 Created):**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user_123",
      "email": "user@example.com",
      "firstName": "John",
      "lastName": "Doe",
      "role": "customer",
      "status": "pending_verification",
      "createdAt": "2024-01-15T10:30:00Z"
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "expiresIn": 900
    }
  }
}
```

### 2. User Login

#### POST /v1/auth/login
Authenticate user with email and password.

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "securePassword123"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user_123",
      "email": "user@example.com",
      "firstName": "John",
      "lastName": "Doe",
      "role": "customer",
      "status": "active",
      "lastLoginAt": "2024-01-15T10:30:00Z"
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "expiresIn": 900
    }
  }
}
```

### 3. Phone Number Login

#### POST /v1/auth/phone-login
Send OTP to phone number for authentication.

**Request Body:**
```json
{
  "phone": "+237123456789",
  "countryCode": "CM"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "message": "OTP sent to phone number",
    "otpId": "otp_123",
    "expiresIn": 300
  }
}
```

### 4. OTP Verification

#### POST /v1/auth/verify-otp
Verify OTP code for phone authentication.

**Request Body:**
```json
{
  "otpId": "otp_123",
  "otpCode": "123456",
  "phone": "+237123456789"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user_123",
      "phone": "+237123456789",
      "role": "customer",
      "status": "active"
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "expiresIn": 900
    }
  }
}
```

### 5. Google OAuth

#### POST /v1/auth/google
Authenticate using Google OAuth.

**Request Body:**
```json
{
  "idToken": "google_id_token",
  "accessToken": "google_access_token"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user_123",
      "email": "user@gmail.com",
      "firstName": "John",
      "lastName": "Doe",
      "role": "customer",
      "googleId": "google_123",
      "status": "active"
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "expiresIn": 900
    }
  }
}
```

### 6. Token Refresh

#### POST /v1/auth/refresh
Refresh access token using refresh token.

**Request Body:**
```json
{
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expiresIn": 900
  }
}
```

### 7. Logout

#### POST /v1/auth/logout
Logout user and invalidate tokens.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Successfully logged out"
}
```

---

## User Management APIs

### 1. Get User Profile

#### GET /v1/users/profile
Get current user's profile information.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": "user_123",
    "email": "user@example.com",
    "phone": "+237123456789",
    "firstName": "John",
    "lastName": "Doe",
    "role": "customer",
    "status": "active",
    "avatar": "https://api.eatfast.com/avatars/user_123.jpg",
    "location": {
      "city": "yaounde",
      "coordinates": {
        "latitude": 3.8480,
        "longitude": 11.5021
      }
    },
    "preferences": {
      "language": "fr",
      "notifications": true,
      "dietaryRestrictions": []
    },
    "loyaltyPoints": 150,
    "loyaltyTier": "bronze",
    "totalOrders": 25,
    "totalSpent": 125000,
    "createdAt": "2024-01-01T00:00:00Z",
    "updatedAt": "2024-01-15T10:30:00Z"
  }
}
```

### 2. Update User Profile

#### PUT /v1/users/profile
Update user profile information.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "firstName": "John",
  "lastName": "Doe",
  "phone": "+237123456789",
  "preferences": {
    "language": "fr",
    "notifications": true,
    "dietaryRestrictions": ["vegetarian"]
  }
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": "user_123",
    "firstName": "John",
    "lastName": "Doe",
    "phone": "+237123456789",
    "preferences": {
      "language": "fr",
      "notifications": true,
      "dietaryRestrictions": ["vegetarian"]
    },
    "updatedAt": "2024-01-15T10:30:00Z"
  }
}
```

### 3. Upload Avatar

#### POST /v1/users/avatar
Upload user avatar image.

**Headers:**
```
Authorization: Bearer <access_token>
Content-Type: multipart/form-data
```

**Request Body:**
```
file: <image_file>
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "avatarUrl": "https://api.eatfast.com/avatars/user_123.jpg",
    "updatedAt": "2024-01-15T10:30:00Z"
  }
}
```

### 4. Change Password

#### PUT /v1/users/password
Change user password.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "currentPassword": "oldPassword123",
  "newPassword": "newPassword123"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Password changed successfully"
}
```

### 5. Delete Account

#### DELETE /v1/users/account
Delete user account permanently.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "password": "currentPassword123",
  "confirmation": "DELETE"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Account deleted successfully"
}
```

---

## Restaurant APIs

### 1. Get Restaurants

#### GET /v1/restaurants
Get list of restaurants with filtering and pagination.

**Query Parameters:**
- `city` (string): Filter by city
- `cuisine` (string): Filter by cuisine type
- `priceRange` (string): Filter by price range (1-3)
- `rating` (number): Minimum rating (1-5)
- `deliveryTime` (number): Maximum delivery time in minutes
- `latitude` (number): User latitude for distance calculation
- `longitude` (number): User longitude for distance calculation
- `page` (number): Page number (default: 1)
- `limit` (number): Items per page (default: 20)
- `sort` (string): Sort by (distance, rating, delivery_time, price)

**Example Request:**
```
GET /v1/restaurants?city=yaounde&cuisine=cameroonian&rating=4&page=1&limit=10
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "restaurants": [
      {
        "id": "rest_123",
        "name": "Restaurant Chez Marie",
        "description": "Authentic Cameroonian cuisine",
        "cuisineType": "cameroonian",
        "rating": 4.5,
        "reviewCount": 150,
        "deliveryTime": 30,
        "deliveryFee": 500,
        "minimumOrder": 2000,
        "isOpen": true,
        "imageUrl": "https://api.eatfast.com/restaurants/rest_123.jpg",
        "location": {
          "address": "Avenue Kennedy, Yaoundé",
          "city": "yaounde",
          "coordinates": {
            "latitude": 3.8480,
            "longitude": 11.5021
          }
        },
        "operatingHours": {
          "monday": "08:00-22:00",
          "tuesday": "08:00-22:00",
          "wednesday": "08:00-22:00",
          "thursday": "08:00-22:00",
          "friday": "08:00-23:00",
          "saturday": "08:00-23:00",
          "sunday": "09:00-21:00"
        }
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 5,
      "totalItems": 50,
      "itemsPerPage": 10
    }
  }
}
```

### 2. Get Restaurant Details

#### GET /v1/restaurants/{restaurantId}
Get detailed information about a specific restaurant.

**Headers:**
```
Authorization: Bearer <access_token> (optional)
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": "rest_123",
    "name": "Restaurant Chez Marie",
    "description": "Authentic Cameroonian cuisine with traditional recipes",
    "cuisineType": "cameroonian",
    "rating": 4.5,
    "reviewCount": 150,
    "deliveryTime": 30,
    "deliveryFee": 500,
    "minimumOrder": 2000,
    "isOpen": true,
    "imageUrl": "https://api.eatfast.com/restaurants/rest_123.jpg",
    "gallery": [
      "https://api.eatfast.com/restaurants/rest_123_1.jpg",
      "https://api.eatfast.com/restaurants/rest_123_2.jpg"
    ],
    "location": {
      "address": "Avenue Kennedy, Yaoundé",
      "city": "yaounde",
      "coordinates": {
        "latitude": 3.8480,
        "longitude": 11.5021
      }
    },
    "operatingHours": {
      "monday": "08:00-22:00",
      "tuesday": "08:00-22:00",
      "wednesday": "08:00-22:00",
      "thursday": "08:00-22:00",
      "friday": "08:00-23:00",
      "saturday": "08:00-23:00",
      "sunday": "09:00-21:00"
    },
    "contact": {
      "phone": "+237123456789",
      "email": "contact@chezmarie.com"
    },
    "socialMedia": {
      "facebook": "https://facebook.com/chezmarie",
      "instagram": "https://instagram.com/chezmarie"
    }
  }
}
```

### 3. Get Restaurant Menu

#### GET /v1/restaurants/{restaurantId}/menu
Get restaurant menu with categories and items.

**Headers:**
```
Authorization: Bearer <access_token> (optional)
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "restaurantId": "rest_123",
    "categories": [
      {
        "id": "cat_123",
        "name": "Plats Principaux",
        "description": "Nos plats principaux traditionnels",
        "order": 1,
        "items": [
          {
            "id": "item_123",
            "name": "Poulet DG",
            "description": "Poulet sauté aux légumes et plantains",
            "price": 3500,
            "imageUrl": "https://api.eatfast.com/items/item_123.jpg",
            "isAvailable": true,
            "preparationTime": 25,
            "nutritionalInfo": {
              "calories": 450,
              "protein": 35,
              "carbs": 20,
              "fat": 25
            },
            "allergens": ["gluten"],
            "customizationOptions": [
              {
                "id": "opt_123",
                "name": "Niveau de piment",
                "type": "single_select",
                "required": false,
                "options": [
                  {
                    "id": "opt_val_123",
                    "name": "Doux",
                    "price": 0
                  },
                  {
                    "id": "opt_val_124",
                    "name": "Moyen",
                    "price": 0
                  },
                  {
                    "id": "opt_val_125",
                    "name": "Fort",
                    "price": 0
                  }
                ]
              }
            ]
          }
        ]
      }
    ]
  }
}
```

### 4. Search Restaurants

#### GET /v1/restaurants/search
Search restaurants by name, cuisine, or keywords.

**Query Parameters:**
- `q` (string): Search query
- `city` (string): Filter by city
- `latitude` (number): User latitude
- `longitude` (number): User longitude
- `page` (number): Page number
- `limit` (number): Items per page

**Example Request:**
```
GET /v1/restaurants/search?q=poulet&city=yaounde&latitude=3.8480&longitude=11.5021
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "restaurants": [
      {
        "id": "rest_123",
        "name": "Restaurant Chez Marie",
        "description": "Authentic Cameroonian cuisine",
        "cuisineType": "cameroonian",
        "rating": 4.5,
        "deliveryTime": 30,
        "distance": 1.2,
        "imageUrl": "https://api.eatfast.com/restaurants/rest_123.jpg"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 3,
      "totalItems": 25,
      "itemsPerPage": 10
    }
  }
}
```

---

## Order Management APIs

### 1. Create Order

#### POST /v1/orders
Create a new order.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "restaurantId": "rest_123",
  "items": [
    {
      "itemId": "item_123",
      "quantity": 2,
      "customizations": [
        {
          "optionId": "opt_123",
          "valueId": "opt_val_125"
        }
      ],
      "specialInstructions": "Sans oignons"
    }
  ],
  "deliveryAddress": {
    "street": "Avenue Kennedy",
    "city": "yaounde",
    "coordinates": {
      "latitude": 3.8480,
      "longitude": 11.5021
    },
    "instructions": "Porte bleue"
  },
  "paymentMethod": "card",
  "promoCode": "WELCOME10"
}
```

**Response (201 Created):**
```json
{
  "success": true,
  "data": {
    "orderId": "order_123",
    "status": "pending",
    "restaurant": {
      "id": "rest_123",
      "name": "Restaurant Chez Marie"
    },
    "items": [
      {
        "itemId": "item_123",
        "name": "Poulet DG",
        "quantity": 2,
        "unitPrice": 3500,
        "totalPrice": 7000,
        "customizations": [
          {
            "optionName": "Niveau de piment",
            "valueName": "Fort"
          }
        ],
        "specialInstructions": "Sans oignons"
      }
    ],
    "pricing": {
      "subtotal": 7000,
      "deliveryFee": 500,
      "serviceFee": 350,
      "tax": 785,
      "discount": 700,
      "total": 7935
    },
    "deliveryAddress": {
      "street": "Avenue Kennedy",
      "city": "yaounde",
      "coordinates": {
        "latitude": 3.8480,
        "longitude": 11.5021
      },
      "instructions": "Porte bleue"
    },
    "estimatedDeliveryTime": "2024-01-15T11:30:00Z",
    "createdAt": "2024-01-15T10:30:00Z"
  }
}
```

### 2. Get Order Details

#### GET /v1/orders/{orderId}
Get detailed information about a specific order.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "orderId": "order_123",
    "status": "confirmed",
    "restaurant": {
      "id": "rest_123",
      "name": "Restaurant Chez Marie",
      "phone": "+237123456789",
      "address": "Avenue Kennedy, Yaoundé"
    },
    "items": [
      {
        "itemId": "item_123",
        "name": "Poulet DG",
        "quantity": 2,
        "unitPrice": 3500,
        "totalPrice": 7000,
        "customizations": [
          {
            "optionName": "Niveau de piment",
            "valueName": "Fort"
          }
        ],
        "specialInstructions": "Sans oignons"
      }
    ],
    "pricing": {
      "subtotal": 7000,
      "deliveryFee": 500,
      "serviceFee": 350,
      "tax": 785,
      "discount": 700,
      "total": 7935
    },
    "deliveryAddress": {
      "street": "Avenue Kennedy",
      "city": "yaounde",
      "coordinates": {
        "latitude": 3.8480,
        "longitude": 11.5021
      },
      "instructions": "Porte bleue"
    },
    "delivery": {
      "driverId": "driver_123",
      "driverName": "Jean Pierre",
      "driverPhone": "+237987654321",
      "estimatedDeliveryTime": "2024-01-15T11:30:00Z",
      "currentLocation": {
        "latitude": 3.8500,
        "longitude": 11.5000
      }
    },
    "timeline": [
      {
        "status": "pending",
        "timestamp": "2024-01-15T10:30:00Z",
        "description": "Commande créée"
      },
      {
        "status": "confirmed",
        "timestamp": "2024-01-15T10:32:00Z",
        "description": "Restaurant a confirmé la commande"
      }
    ],
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:32:00Z"
  }
}
```

### 3. Get User Orders

#### GET /v1/orders
Get user's order history with pagination.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Query Parameters:**
- `status` (string): Filter by order status
- `page` (number): Page number
- `limit` (number): Items per page
- `fromDate` (string): Filter from date (ISO 8601)
- `toDate` (string): Filter to date (ISO 8601)

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "orders": [
      {
        "orderId": "order_123",
        "status": "delivered",
        "restaurant": {
          "id": "rest_123",
          "name": "Restaurant Chez Marie",
          "imageUrl": "https://api.eatfast.com/restaurants/rest_123.jpg"
        },
        "items": [
          {
            "name": "Poulet DG",
            "quantity": 2,
            "totalPrice": 7000
          }
        ],
        "total": 7935,
        "deliveryAddress": {
          "street": "Avenue Kennedy",
          "city": "yaounde"
        },
        "deliveredAt": "2024-01-15T11:25:00Z",
        "createdAt": "2024-01-15T10:30:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 5,
      "totalItems": 50,
      "itemsPerPage": 10
    }
  }
}
```

### 4. Cancel Order

#### PUT /v1/orders/{orderId}/cancel
Cancel an existing order.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "reason": "Changed mind",
  "comment": "I want to order from a different restaurant"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "orderId": "order_123",
    "status": "cancelled",
    "cancelledAt": "2024-01-15T10:35:00Z",
    "refundAmount": 7935,
    "refundStatus": "pending"
  }
}
```

### 5. Rate Order

#### POST /v1/orders/{orderId}/rating
Rate and review an order.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "rating": 5,
  "comment": "Excellent food and fast delivery!",
  "foodRating": 5,
  "deliveryRating": 4,
  "serviceRating": 5
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "orderId": "order_123",
    "rating": 5,
    "comment": "Excellent food and fast delivery!",
    "foodRating": 5,
    "deliveryRating": 4,
    "serviceRating": 5,
    "createdAt": "2024-01-15T11:30:00Z"
  }
}
```

---

## Payment APIs

### 1. Get Payment Methods

#### GET /v1/payments/methods
Get user's saved payment methods.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "paymentMethods": [
      {
        "id": "pm_123",
        "type": "card",
        "last4": "4242",
        "brand": "visa",
        "expiryMonth": 12,
        "expiryYear": 2025,
        "isDefault": true,
        "createdAt": "2024-01-01T00:00:00Z"
      },
      {
        "id": "pm_124",
        "type": "mobile_money",
        "provider": "mtn",
        "phoneNumber": "+237123456789",
        "isDefault": false,
        "createdAt": "2024-01-10T00:00:00Z"
      }
    ]
  }
}
```

### 2. Add Payment Method

#### POST /v1/payments/methods
Add a new payment method.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "type": "card",
  "cardToken": "tok_1234567890",
  "isDefault": false
}
```

**Response (201 Created):**
```json
{
  "success": true,
  "data": {
    "id": "pm_125",
    "type": "card",
    "last4": "4242",
    "brand": "visa",
    "expiryMonth": 12,
    "expiryYear": 2025,
    "isDefault": false,
    "createdAt": "2024-01-15T10:30:00Z"
  }
}
```

### 3. Process Payment

#### POST /v1/payments/process
Process payment for an order.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "orderId": "order_123",
  "paymentMethodId": "pm_123",
  "amount": 7935,
  "currency": "XAF"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "paymentId": "pay_123",
    "status": "succeeded",
    "amount": 7935,
    "currency": "XAF",
    "transactionId": "txn_1234567890",
    "processedAt": "2024-01-15T10:30:00Z"
  }
}
```

### 4. Get Payment History

#### GET /v1/payments/history
Get user's payment history.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Query Parameters:**
- `page` (number): Page number
- `limit` (number): Items per page
- `fromDate` (string): Filter from date
- `toDate` (string): Filter to date

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "payments": [
      {
        "paymentId": "pay_123",
        "orderId": "order_123",
        "amount": 7935,
        "currency": "XAF",
        "status": "succeeded",
        "method": "card",
        "processedAt": "2024-01-15T10:30:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 3,
      "totalItems": 25,
      "itemsPerPage": 10
    }
  }
}
```

---

## Location APIs

### 1. Get Delivery Areas

#### GET /v1/locations/delivery-areas
Get available delivery areas.

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "deliveryAreas": [
      {
        "id": "area_123",
        "name": "Yaoundé Centre",
        "city": "yaounde",
        "polygon": [
          {
            "latitude": 3.8480,
            "longitude": 11.5021
          },
          {
            "latitude": 3.8500,
            "longitude": 11.5040
          }
        ],
        "deliveryFee": 500,
        "minimumOrder": 2000,
        "estimatedDeliveryTime": 30
      }
    ]
  }
}
```

### 2. Validate Address

#### POST /v1/locations/validate
Validate and geocode an address.

**Request Body:**
```json
{
  "address": "Avenue Kennedy, Yaoundé",
  "city": "yaounde"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "isValid": true,
    "formattedAddress": "Avenue Kennedy, Yaoundé, Cameroun",
    "coordinates": {
      "latitude": 3.8480,
      "longitude": 11.5021
    },
    "deliveryArea": {
      "id": "area_123",
      "name": "Yaoundé Centre",
      "deliveryFee": 500,
      "minimumOrder": 2000,
      "estimatedDeliveryTime": 30
    }
  }
}
```

### 3. Get Nearby Restaurants

#### GET /v1/locations/restaurants/nearby
Get restaurants near a specific location.

**Query Parameters:**
- `latitude` (number): Latitude
- `longitude` (number): Longitude
- `radius` (number): Search radius in kilometers (default: 5)
- `cuisine` (string): Filter by cuisine type
- `limit` (number): Maximum number of results

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "restaurants": [
      {
        "id": "rest_123",
        "name": "Restaurant Chez Marie",
        "cuisineType": "cameroonian",
        "rating": 4.5,
        "deliveryTime": 30,
        "distance": 1.2,
        "coordinates": {
          "latitude": 3.8480,
          "longitude": 11.5021
        }
      }
    ]
  }
}
```

---

## Notification APIs

### 1. Get Notifications

#### GET /v1/notifications
Get user's notifications.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Query Parameters:**
- `page` (number): Page number
- `limit` (number): Items per page
- `type` (string): Filter by notification type
- `unread` (boolean): Filter unread notifications

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "notifications": [
      {
        "id": "notif_123",
        "type": "order_update",
        "title": "Commande confirmée",
        "message": "Votre commande #order_123 a été confirmée par le restaurant",
        "isRead": false,
        "data": {
          "orderId": "order_123",
          "status": "confirmed"
        },
        "createdAt": "2024-01-15T10:32:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 2,
      "totalItems": 15,
      "itemsPerPage": 10
    },
    "unreadCount": 3
  }
}
```

### 2. Mark Notification as Read

#### PUT /v1/notifications/{notificationId}/read
Mark a notification as read.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": "notif_123",
    "isRead": true,
    "readAt": "2024-01-15T10:35:00Z"
  }
}
```

### 3. Mark All Notifications as Read

#### PUT /v1/notifications/read-all
Mark all notifications as read.

**Headers:**
```
Authorization: Bearer <access_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "updatedCount": 3,
    "updatedAt": "2024-01-15T10:35:00Z"
  }
}
```

---

## Admin APIs

### 1. Get Platform Statistics

#### GET /v1/admin/statistics
Get platform-wide statistics.

**Headers:**
```
Authorization: Bearer <admin_access_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "users": {
      "total": 15000,
      "active": 12000,
      "newToday": 50,
      "newThisWeek": 300
    },
    "restaurants": {
      "total": 500,
      "active": 450,
      "pendingApproval": 25,
      "newToday": 3
    },
    "orders": {
      "total": 50000,
      "today": 1500,
      "thisWeek": 10000,
      "thisMonth": 40000
    },
    "revenue": {
      "today": 2500000,
      "thisWeek": 15000000,
      "thisMonth": 60000000,
      "total": 500000000
    }
  }
}
```

### 2. Get User Management

#### GET /v1/admin/users
Get users with filtering and pagination.

**Headers:**
```
Authorization: Bearer <admin_access_token>
```

**Query Parameters:**
- `role` (string): Filter by user role
- `status` (string): Filter by user status
- `page` (number): Page number
- `limit` (number): Items per page
- `search` (string): Search by name or email

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "users": [
      {
        "id": "user_123",
        "email": "user@example.com",
        "firstName": "John",
        "lastName": "Doe",
        "role": "customer",
        "status": "active",
        "totalOrders": 25,
        "totalSpent": 125000,
        "createdAt": "2024-01-01T00:00:00Z",
        "lastLoginAt": "2024-01-15T10:30:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 10,
      "totalItems": 100,
      "itemsPerPage": 10
    }
  }
}
```

### 3. Update User Status

#### PUT /v1/admin/users/{userId}/status
Update user status (suspend, activate, etc.).

**Headers:**
```
Authorization: Bearer <admin_access_token>
```

**Request Body:**
```json
{
  "status": "suspended",
  "reason": "Violation of terms of service",
  "duration": "7d"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "userId": "user_123",
    "status": "suspended",
    "reason": "Violation of terms of service",
    "suspendedAt": "2024-01-15T10:30:00Z",
    "suspendedUntil": "2024-01-22T10:30:00Z"
  }
}
```

---

## Error Handling

### Error Response Format
All API errors follow a consistent format:

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": {
      "field": "email",
      "reason": "Invalid email format"
    }
  },
  "timestamp": "2024-01-15T10:30:00Z",
  "requestId": "req_1234567890"
}
```

### Common Error Codes

#### 400 Bad Request
- `VALIDATION_ERROR`: Invalid input data
- `MISSING_REQUIRED_FIELD`: Required field is missing
- `INVALID_FORMAT`: Invalid data format

#### 401 Unauthorized
- `INVALID_TOKEN`: Invalid or expired token
- `MISSING_TOKEN`: Authorization token is missing
- `INSUFFICIENT_PERMISSIONS`: User lacks required permissions

#### 403 Forbidden
- `ACCESS_DENIED`: Access to resource is denied
- `ACCOUNT_SUSPENDED`: User account is suspended
- `RESTAURANT_CLOSED`: Restaurant is currently closed

#### 404 Not Found
- `USER_NOT_FOUND`: User does not exist
- `RESTAURANT_NOT_FOUND`: Restaurant does not exist
- `ORDER_NOT_FOUND`: Order does not exist

#### 409 Conflict
- `EMAIL_ALREADY_EXISTS`: Email is already registered
- `PHONE_ALREADY_EXISTS`: Phone number is already registered
- `ORDER_ALREADY_CANCELLED`: Order is already cancelled

#### 422 Unprocessable Entity
- `INSUFFICIENT_BALANCE`: Insufficient wallet balance
- `RESTAURANT_NOT_ACCEPTING_ORDERS`: Restaurant not accepting orders
- `DELIVERY_AREA_NOT_COVERED`: Address not in delivery area

#### 429 Too Many Requests
- `RATE_LIMIT_EXCEEDED`: Too many requests

#### 500 Internal Server Error
- `INTERNAL_ERROR`: Internal server error
- `SERVICE_UNAVAILABLE`: Service temporarily unavailable

---

## Rate Limiting

### Rate Limits
- **Authentication endpoints**: 5 requests per minute
- **General API endpoints**: 100 requests per minute
- **File upload endpoints**: 10 requests per minute
- **Admin endpoints**: 200 requests per minute

### Rate Limit Headers
```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1642248000
```

### Rate Limit Exceeded Response
```json
{
  "success": false,
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Too many requests. Please try again later.",
    "retryAfter": 60
  }
}
```

---

## SDK Integration

### Flutter SDK
The EatFast mobile app includes a comprehensive SDK for easy integration:

```dart
// Initialize SDK
await EatFastSDK.initialize(
  apiKey: 'your_api_key',
  environment: Environment.production,
);

// Authentication
final authResult = await EatFastSDK.auth.signInWithEmail(
  email: 'user@example.com',
  password: 'password123',
);

// Get restaurants
final restaurants = await EatFastSDK.restaurants.getNearby(
  latitude: 3.8480,
  longitude: 11.5021,
  radius: 5.0,
);

// Create order
final order = await EatFastSDK.orders.create(
  restaurantId: 'rest_123',
  items: [
    OrderItem(
      itemId: 'item_123',
      quantity: 2,
      customizations: [
        Customization(
          optionId: 'opt_123',
          valueId: 'opt_val_125',
        ),
      ],
    ),
  ],
  deliveryAddress: DeliveryAddress(
    street: 'Avenue Kennedy',
    city: 'yaounde',
    coordinates: Coordinates(
      latitude: 3.8480,
      longitude: 11.5021,
    ),
  ),
);
```

### Webhook Integration
For real-time updates, integrate with webhooks:

```dart
// Configure webhooks
EatFastSDK.webhooks.configure([
  WebhookEvent.orderStatusChanged,
  WebhookEvent.paymentProcessed,
  WebhookEvent.deliveryUpdated,
]);

// Handle webhook events
EatFastSDK.webhooks.onOrderStatusChanged((event) {
  print('Order ${event.orderId} status changed to ${event.status}');
});
```

---

This comprehensive API documentation provides detailed information about all available endpoints, request/response formats, error handling, and integration guidelines for the EatFast mobile application.
