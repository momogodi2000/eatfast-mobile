# 👥 **EatFast Backend - User Type Documentation**

**Version:** 1.0.0 (Production Ready)  
**Last Updated:** September 13, 2025  
**Status:** ✅ Production Deployment Ready

---

## 📋 **Table of Contents**
- [Overview](#overview)
- [Guest User Documentation](#guest-user-documentation)
- [Customer User Documentation](#customer-user-documentation)
- [Restaurant Owner Documentation](#restaurant-owner-documentation)
- [Delivery Driver Documentation](#delivery-driver-documentation)
- [Admin User Documentation](#admin-user-documentation)
- [Cross-User Integrations](#cross-user-integrations)
- [Security & Permissions](#security--permissions)

---

## 🎯 **Overview**

EatFast supports a comprehensive user ecosystem with role-based access control, ensuring each user type has appropriate capabilities and security measures. This documentation covers all user types with production-ready implementations.

### **User Type Summary**
| User Type | Primary Role | Access Level | Key Features |
|-----------|--------------|--------------|--------------|
| **Guest** | Anonymous Browsing | Limited | Browse, Order (session-based) |
| **Customer** | Food Ordering | Authenticated | Full ordering, history, loyalty |
| **Restaurant** | Food Provider | Business | Menu management, order processing |
| **Driver** | Delivery Service | Service | Route optimization, earnings tracking |
| **Admin** | System Management | Full Access | User management, analytics, configuration |

---

---

## Guest User Documentation

### Overview
Guest users can browse restaurants, place orders, and track deliveries without creating an account. This provides a frictionless experience for first-time users while collecting minimal information for order processing.

### Guest Capabilities
- ✅ Browse restaurants and menus
- ✅ Add items to cart
- ✅ Place orders with phone/email only
- ✅ Make payments via all supported methods
- ✅ Track orders via unique tracking links
- ✅ Receive SMS/Email notifications
- ✅ Convert to registered user (preserving order history)
- ❌ Cannot save payment methods
- ❌ Cannot access order history after session expires
- ❌ Cannot earn loyalty points (until conversion)

### Guest Session Management

#### Create Guest Session
```http
POST /api/v1/guest/session
Content-Type: application/json

{
  "device_id": "optional_device_identifier",
  "platform": "web|ios|android"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "guest_token": "guest_xxxxxxxxxxxxxxxx",
    "session_id": "session_uuid",
    "expires_at": "2025-09-11T14:30:00Z",
    "cart": {
      "id": "cart_uuid",
      "items": [],
      "total": 0
    }
  }
}
```

#### Get Guest Session
```http
GET /api/v1/guest/session/:token
```

### Guest Cart Management

#### Add Items to Cart
```http
POST /api/v1/guest/cart/items
Authorization: Bearer guest_xxxxxxxxxxxxxxxx
Content-Type: application/json

{
  "menu_item_id": "item_uuid",
  "quantity": 2,
  "customizations": [
    {
      "option_id": "option_uuid",
      "value": "Extra Spicy"
    }
  ],
  "special_instructions": "No onions please"
}
```

#### Update Cart Item
```http
PUT /api/v1/guest/cart/items/:item_id
Authorization: Bearer guest_xxxxxxxxxxxxxxxx

{
  "quantity": 3
}
```

#### Remove Cart Item
```http
DELETE /api/v1/guest/cart/items/:item_id
Authorization: Bearer guest_xxxxxxxxxxxxxxxx
```

#### Get Cart
```http
GET /api/v1/guest/cart
Authorization: Bearer guest_xxxxxxxxxxxxxxxx
```

### Guest Order Management

#### Place Order
```http
POST /api/v1/guest/orders
Authorization: Bearer guest_xxxxxxxxxxxxxxxx
Content-Type: application/json

{
  "contact_info": {
    "name": "John Doe",
    "phone": "+237670000000",
    "email": "john@example.com"
  },
  "delivery_address": {
    "address": "123 Main Street, Yaoundé",
    "latitude": 3.848,
    "longitude": 11.502,
    "instructions": "Blue gate, 2nd floor"
  },
  "payment_method": "campay",
  "payment_details": {
    "phone": "+237670000000"
  },
  "special_instructions": "Please call when you arrive"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "order": {
      "id": "order_uuid",
      "order_number": "ORD-123456",
      "status": "created",
      "total_amount": 8500.00,
      "currency": "XAF",
      "estimated_delivery_time": "45 minutes",
      "tracking_url": "https://eatfast.cm/track/ORD-123456-guesttoken123"
    },
    "payment": {
      "payment_id": "payment_uuid",
      "provider_url": "https://campay.com/pay/...",
      "qr_code": "data:image/png;base64,..."
    }
  }
}
```

#### Track Order
```http
GET /api/v1/guest/orders/:order_id/track?token=:guest_token
```

#### Order Status Updates (WebSocket)
```javascript
// Connect to WebSocket with guest token
const socket = io('wss://api.eatfast.cm', {
  auth: { token: 'guest_xxxxxxxxxxxxxxxx' }
});

// Listen for order updates
socket.on('order_status_update', (data) => {
  console.log('Order status:', data.status);
  console.log('ETA:', data.estimated_delivery_time);
});

// Listen for driver location updates
socket.on('driver_location_update', (data) => {
  console.log('Driver location:', data.latitude, data.longitude);
  console.log('Distance:', data.distance_to_destination);
});
```

### Guest to Customer Conversion

#### Convert Guest Account
```http
POST /api/v1/guest/convert
Authorization: Bearer guest_xxxxxxxxxxxxxxxx
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "securePassword123",
  "phone": "+237670000000",
  "name": "John Doe",
  "terms_accepted": true
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user_uuid",
      "email": "john@example.com",
      "name": "John Doe",
      "role": "customer"
    },
    "tokens": {
      "access_token": "eyJ0eXAiOiJKV1QiOiJhbGciOiJIUzI1NiJ9...",
      "refresh_token": "eyJ0eXAiOiJKV1QiOiJhbGciOiJIUzI1NiJ9...",
      "expires_in": 3600
    },
    "migrated_data": {
      "orders_count": 1,
      "cart_preserved": true
    }
  }
}
```

---

## Customer User Documentation

### Overview
Registered customers have full access to all platform features including order history, saved addresses, loyalty points, and personalized recommendations.

### Customer Capabilities
- ✅ All guest capabilities
- ✅ Persistent order history
- ✅ Save multiple addresses and payment methods
- ✅ Earn and redeem loyalty points
- ✅ Refer friends for bonuses
- ✅ Leave reviews and ratings
- ✅ Subscribe to premium features
- ✅ Receive personalized recommendations
- ✅ Access detailed analytics of their orders

### Authentication & Registration

#### Register New Customer
```http
POST /api/v1/auth/register
Content-Type: application/json

{
  "email": "customer@example.com",
  "password": "securePassword123",
  "phone": "+237670000000",
  "name": "Jane Customer",
  "language": "fr",
  "terms_accepted": true,
  "marketing_opt_in": false
}
```

#### Login
```http
POST /api/v1/auth/login
Content-Type: application/json

{
  "email": "customer@example.com",
  "password": "securePassword123",
  "remember_me": true
}
```

#### OAuth Login (Google)
```http
GET /api/v1/auth/google
```

#### Two-Factor Authentication Setup
```http
POST /api/v1/auth/2fa/setup
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "qr_code": "data:image/png;base64,...",
    "manual_key": "JBSWY3DPEHPK3PXP",
    "backup_codes": [
      "12345678",
      "87654321",
      "..."
    ]
  }
}
```

### Profile Management

#### Get Profile
```http
GET /api/v1/client/profile
Authorization: Bearer <access_token>
```

#### Update Profile
```http
PUT /api/v1/client/profile
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "name": "Jane Updated",
  "phone": "+237670000001",
  "language": "en",
  "notification_preferences": {
    "sms": true,
    "email": true,
    "push": true,
    "whatsapp": false
  },
  "dietary_preferences": ["vegetarian", "gluten_free"]
}
```

### Address Management

#### Get Saved Addresses
```http
GET /api/v1/client/addresses
Authorization: Bearer <access_token>
```

#### Add New Address
```http
POST /api/v1/client/addresses
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "label": "Home",
  "address": "123 Main Street, Yaoundé",
  "latitude": 3.848,
  "longitude": 11.502,
  "instructions": "Blue gate, 2nd floor",
  "is_default": true
}
```

#### Update Address
```http
PUT /api/v1/client/addresses/:address_id
Authorization: Bearer <access_token>

{
  "label": "Office",
  "instructions": "Reception will call up"
}
```

### Order Management

#### Place Order (Registered Customer)
```http
POST /api/v1/client/orders
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "restaurant_id": "restaurant_uuid",
  "items": [
    {
      "menu_item_id": "item_uuid",
      "quantity": 2,
      "customizations": [...]
    }
  ],
  "delivery_address_id": "address_uuid",
  "payment_method_id": "payment_method_uuid",
  "scheduled_delivery": "2025-09-10T18:30:00Z",
  "special_instructions": "Call when you arrive",
  "loyalty_points_to_redeem": 500
}
```

#### Get Order History
```http
GET /api/v1/client/orders?page=1&limit=20&status=delivered
Authorization: Bearer <access_token>
```

#### Get Order Details
```http
GET /api/v1/client/orders/:order_id
Authorization: Bearer <access_token>
```

#### Cancel Order
```http
PUT /api/v1/client/orders/:order_id/cancel
Authorization: Bearer <access_token>

{
  "reason": "Changed my mind",
  "refund_method": "original_payment_method"
}
```

#### Reorder Previous Order
```http
POST /api/v1/client/orders/:order_id/reorder
Authorization: Bearer <access_token>

{
  "delivery_address_id": "address_uuid",
  "scheduled_delivery": "2025-09-10T19:00:00Z"
}
```

### Payment Methods

#### Get Saved Payment Methods
```http
GET /api/v1/client/payment-methods
Authorization: Bearer <access_token>
```

#### Add Payment Method
```http
POST /api/v1/client/payment-methods
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "type": "stripe_card",
  "details": {
    "card_token": "tok_1234567890"
  },
  "is_default": true
}
```

### Wallet Management

#### Get Wallet Balance
```http
GET /api/v1/client/wallet
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "balance": 15000.00,
    "currency": "XAF",
    "pending_credits": 500.00,
    "last_transaction": {
      "type": "credit",
      "amount": 2000.00,
      "description": "Order refund",
      "created_at": "2025-09-10T14:30:00Z"
    }
  }
}
```

#### Top Up Wallet
```http
POST /api/v1/client/wallet/topup
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "amount": 10000.00,
  "payment_method": "campay",
  "payment_details": {
    "phone": "+237670000000"
  }
}
```

### Loyalty Program

#### Get Loyalty Points
```http
GET /api/v1/client/loyalty/points
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "current_points": 1250,
    "tier": "Silver",
    "next_tier": "Gold",
    "points_to_next_tier": 750,
    "lifetime_points": 5000,
    "available_rewards": [
      {
        "id": "reward_uuid",
        "name": "Free Delivery",
        "cost": 200,
        "description": "Free delivery on your next order"
      }
    ]
  }
}
```

#### Redeem Loyalty Points
```http
POST /api/v1/client/loyalty/redeem
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "reward_id": "reward_uuid",
  "points_to_use": 200
}
```

#### Get Points History
```http
GET /api/v1/client/loyalty/history?page=1&limit=20
Authorization: Bearer <access_token>
```

### Referral System

#### Get Referral Stats
```http
GET /api/v1/client/referrals/stats
Authorization: Bearer <access_token>
```

#### Send Referral
```http
POST /api/v1/client/referrals/send
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "method": "sms",
  "recipient": "+237670000001",
  "message": "Check out EatFast - great food delivery!"
}
```

### Reviews & Ratings

#### Leave Review
```http
POST /api/v1/client/orders/:order_id/review
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "restaurant_rating": 5,
  "driver_rating": 4,
  "food_quality": 5,
  "delivery_time": 4,
  "comment": "Great food, delivery was a bit slow",
  "photos": ["photo_url_1", "photo_url_2"]
}
```

#### Get My Reviews
```http
GET /api/v1/client/reviews?page=1&limit=10
Authorization: Bearer <access_token>
```

---

## Restaurant Owner Documentation

### Overview
Restaurant owners can manage their restaurant profile, menu, orders, and staff through the platform. They also have access to analytics and subscription features.

### Restaurant Capabilities
- ✅ Complete restaurant profile management
- ✅ Menu and pricing management
- ✅ Order processing and status updates
- ✅ Staff management and permissions
- ✅ Analytics and performance reports
- ✅ Subscription plans for reduced commission
- ✅ Promotion and discount management
- ✅ Customer review management
- ✅ Integration with POS systems (premium)

### Restaurant Profile Management

#### Get Restaurant Profile
```http
GET /api/v1/restaurant/profile
Authorization: Bearer <access_token>
```

#### Update Restaurant Profile
```http
PUT /api/v1/restaurant/profile
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "name": "Updated Restaurant Name",
  "description": "Best traditional Cameroonian cuisine",
  "address": "456 New Street, Douala",
  "latitude": 4.0511,
  "longitude": 9.7679,
  "phone": "+237680000000",
  "email": "restaurant@example.com",
  "operating_hours": {
    "monday": { "open": "08:00", "close": "22:00" },
    "tuesday": { "open": "08:00", "close": "22:00" },
    "wednesday": { "open": "08:00", "close": "22:00" },
    "thursday": { "open": "08:00", "close": "22:00" },
    "friday": { "open": "08:00", "close": "23:00" },
    "saturday": { "open": "09:00", "close": "23:00" },
    "sunday": { "closed": true }
  },
  "cuisine_types": ["cameroonian", "african", "traditional"],
  "features": ["delivery", "takeout", "halal", "vegetarian_options"],
  "minimum_order": 2000.00,
  "delivery_radius": 15.0,
  "average_preparation_time": 30
}
```

#### Upload Restaurant Documents (KYC)
```http
POST /api/v1/restaurant/documents
Authorization: Bearer <access_token>
Content-Type: multipart/form-data

{
  "business_license": file,
  "tax_certificate": file,
  "owner_id": file,
  "bank_details": file
}
```

### Menu Management

#### Get Full Menu
```http
GET /api/v1/restaurant/menu
Authorization: Bearer <access_token>
```

#### Create Menu Category
```http
POST /api/v1/restaurant/menu/categories
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "name": "Main Dishes",
  "description": "Traditional Cameroonian main courses",
  "display_order": 1,
  "is_active": true
}
```

#### Add Menu Item
```http
POST /api/v1/restaurant/menu/items
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "category_id": "category_uuid",
  "name": "Ndolé with Rice",
  "description": "Traditional Cameroonian dish with groundnuts and vegetables",
  "price": 3500.00,
  "preparation_time": 25,
  "is_available": true,
  "dietary_info": ["gluten_free", "contains_nuts"],
  "images": ["image_url_1", "image_url_2"],
  "customization_options": [
    {
      "name": "Spice Level",
      "type": "single_choice",
      "required": false,
      "options": [
        { "name": "Mild", "price_adjustment": 0 },
        { "name": "Medium", "price_adjustment": 0 },
        { "name": "Spicy", "price_adjustment": 0 }
      ]
    }
  ]
}
```

#### Update Menu Item
```http
PUT /api/v1/restaurant/menu/items/:item_id
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "price": 4000.00,
  "is_available": false,
  "out_of_stock_reason": "Seasonal ingredients not available"
}
```

#### Bulk Update Menu Availability
```http
PUT /api/v1/restaurant/menu/bulk-availability
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "items": [
    { "item_id": "item_uuid_1", "is_available": false },
    { "item_id": "item_uuid_2", "is_available": true }
  ]
}
```

### Order Management

#### Get Incoming Orders
```http
GET /api/v1/restaurant/orders?status=pending&page=1&limit=20
Authorization: Bearer <access_token>
```

#### Get Order Details
```http
GET /api/v1/restaurant/orders/:order_id
Authorization: Bearer <access_token>
```

#### Accept Order
```http
PUT /api/v1/restaurant/orders/:order_id/accept
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "estimated_preparation_time": 30,
  "special_instructions": "Extra sauce included"
}
```

#### Reject Order
```http
PUT /api/v1/restaurant/orders/:order_id/reject
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "reason": "out_of_ingredients",
  "custom_reason": "Sorry, we're out of the special sauce",
  "refund_processing": true
}
```

#### Update Order Status
```http
PUT /api/v1/restaurant/orders/:order_id/status
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "status": "preparing",
  "estimated_completion": "2025-09-10T15:45:00Z",
  "notes": "Order is being prepared with extra care"
}
```

#### Mark Order Ready
```http
PUT /api/v1/restaurant/orders/:order_id/ready
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "pickup_instructions": "Order is ready at the front counter",
  "special_handling": "Keep hot, contains dairy"
}
```

### Staff Management

#### Get Staff List
```http
GET /api/v1/restaurant/staff
Authorization: Bearer <access_token>
```

#### Add Staff Member
```http
POST /api/v1/restaurant/staff
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "email": "staff@restaurant.com",
  "name": "John Chef",
  "role": "chef",
  "permissions": ["manage_menu", "update_orders"],
  "phone": "+237670000002"
}
```

#### Update Staff Permissions
```http
PUT /api/v1/restaurant/staff/:staff_id
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "permissions": ["manage_menu", "update_orders", "view_analytics"],
  "is_active": true
}
```

### Analytics & Reports

#### Get Restaurant Analytics
```http
GET /api/v1/restaurant/analytics?period=last_30_days
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "period": "last_30_days",
    "summary": {
      "total_orders": 245,
      "total_revenue": 875000.00,
      "average_order_value": 3571.43,
      "commission_paid": 131250.00,
      "net_earnings": 743750.00
    },
    "trends": {
      "daily_orders": [...],
      "peak_hours": ["12:00", "13:00", "19:00", "20:00"],
      "popular_items": [...]
    },
    "performance": {
      "average_preparation_time": 28,
      "order_acceptance_rate": 0.95,
      "customer_rating": 4.6,
      "on_time_delivery_rate": 0.88
    }
  }
}
```

#### Get Financial Report
```http
GET /api/v1/restaurant/reports/financial?start_date=2025-09-01&end_date=2025-09-30
Authorization: Bearer <access_token>
```

#### Get Menu Performance
```http
GET /api/v1/restaurant/analytics/menu-performance?period=last_7_days
Authorization: Bearer <access_token>
```

### Subscription Management

#### Get Current Subscription
```http
GET /api/v1/restaurant/subscription
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "current_plan": {
      "id": "plan_uuid",
      "name": "Premium",
      "commission_rate": 0.12,
      "features": [
        "priority_listing",
        "advanced_analytics",
        "pos_integration",
        "marketing_tools"
      ],
      "monthly_fee": 25000.00,
      "currency": "XAF"
    },
    "next_billing_date": "2025-10-10T00:00:00Z",
    "usage": {
      "orders_this_month": 245,
      "plan_limit": 1000
    }
  }
}
```

#### Upgrade Subscription
```http
POST /api/v1/restaurant/subscription/upgrade
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "plan_id": "premium_plan_uuid",
  "payment_method": "campay",
  "billing_cycle": "monthly"
}
```

#### Get Available Plans
```http
GET /api/v1/restaurant/subscription/plans
Authorization: Bearer <access_token>
```

### Promotion Management

#### Create Promotion
```http
POST /api/v1/restaurant/promotions
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "name": "Weekend Special",
  "type": "percentage_discount",
  "value": 15.0,
  "minimum_order": 5000.00,
  "start_date": "2025-09-15T00:00:00Z",
  "end_date": "2025-09-17T23:59:59Z",
  "applicable_items": ["item_uuid_1", "item_uuid_2"],
  "max_uses": 100,
  "terms_conditions": "Valid for weekend orders only"
}
```

---

## Delivery Driver Documentation

### Overview
Delivery drivers manage their availability, accept orders, and track their earnings through the platform. The system provides route optimization and real-time communication features.

### Driver Capabilities
- ✅ Manage availability and working hours
- ✅ Receive and accept delivery assignments
- ✅ Real-time GPS tracking and route optimization
- ✅ Earnings tracking and payout management
- ✅ Customer communication tools
- ✅ Performance analytics
- ✅ Document management for compliance
- ✅ Support ticket system

### Driver Profile Management

#### Get Driver Profile
```http
GET /api/v1/driver/profile
Authorization: Bearer <access_token>
```

#### Update Driver Profile
```http
PUT /api/v1/driver/profile
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "name": "John Driver",
  "phone": "+237670000003",
  "vehicle_type": "motorcycle",
  "vehicle_details": {
    "make": "Yamaha",
    "model": "XTZ 125",
    "year": 2020,
    "plate_number": "LT-123-AB",
    "color": "Blue"
  },
  "emergency_contact": {
    "name": "Jane Driver",
    "phone": "+237670000004",
    "relationship": "spouse"
  },
  "preferred_zones": ["zone_uuid_1", "zone_uuid_2"]
}
```

#### Upload Driver Documents
```http
POST /api/v1/driver/documents
Authorization: Bearer <access_token>
Content-Type: multipart/form-data

{
  "drivers_license": file,
  "vehicle_registration": file,
  "insurance_certificate": file,
  "national_id": file,
  "profile_photo": file
}
```

### Availability Management

#### Update Online Status
```http
PUT /api/v1/driver/status
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "is_online": true,
  "current_location": {
    "latitude": 3.848,
    "longitude": 11.502,
    "accuracy": 10
  }
}
```

#### Set Working Hours
```http
PUT /api/v1/driver/working-hours
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "schedule": {
    "monday": { "start": "08:00", "end": "18:00" },
    "tuesday": { "start": "08:00", "end": "18:00" },
    "wednesday": { "start": "08:00", "end": "18:00" },
    "thursday": { "start": "08:00", "end": "18:00" },
    "friday": { "start": "08:00", "end": "20:00" },
    "saturday": { "start": "10:00", "end": "20:00" },
    "sunday": { "off": true }
  },
  "timezone": "Africa/Douala"
}
```

#### Take Break
```http
PUT /api/v1/driver/break
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "break_type": "lunch",
  "estimated_duration": 30,
  "current_location": {
    "latitude": 3.848,
    "longitude": 11.502
  }
}
```

### Order Management

#### Get Available Orders
```http
GET /api/v1/driver/orders/available?radius=5&max_distance=10
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "orders": [
      {
        "id": "order_uuid",
        "order_number": "ORD-123456",
        "restaurant": {
          "name": "Restaurant Name",
          "address": "123 Restaurant St",
          "latitude": 3.850,
          "longitude": 11.500
        },
        "customer": {
          "address": "456 Customer Ave",
          "latitude": 3.845,
          "longitude": 11.505
        },
        "estimated_distance": 3.2,
        "estimated_duration": 15,
        "delivery_fee": 1500.00,
        "order_value": 8500.00,
        "pickup_time": "2025-09-10T15:30:00Z",
        "special_instructions": "Fragile items, handle with care"
      }
    ]
  }
}
```

#### Accept Order
```http
POST /api/v1/driver/orders/:order_id/accept
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "estimated_arrival_time": "2025-09-10T15:25:00Z",
  "current_location": {
    "latitude": 3.848,
    "longitude": 11.502
  }
}
```

#### Decline Order
```http
POST /api/v1/driver/orders/:order_id/decline
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "reason": "too_far",
  "custom_reason": "Traffic is very heavy in that area"
}
```

#### Update Location
```http
PUT /api/v1/driver/location
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "latitude": 3.849,
  "longitude": 11.503,
  "accuracy": 5,
  "heading": 45,
  "speed": 25
}
```

#### Arrive at Restaurant
```http
PUT /api/v1/driver/orders/:order_id/arrive-restaurant
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "arrival_time": "2025-09-10T15:28:00Z",
  "location": {
    "latitude": 3.850,
    "longitude": 11.500
  }
}
```

#### Pickup Order
```http
PUT /api/v1/driver/orders/:order_id/pickup
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "pickup_time": "2025-09-10T15:35:00Z",
  "verification_code": "1234",
  "items_received": [
    {
      "item_id": "item_uuid",
      "quantity": 2,
      "notes": "Extra sauce included"
    }
  ],
  "photo_proof": "photo_url"
}
```

#### Start Delivery
```http
PUT /api/v1/driver/orders/:order_id/start-delivery
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "departure_time": "2025-09-10T15:36:00Z",
  "estimated_delivery_time": "2025-09-10T15:50:00Z",
  "route_optimization": true
}
```

#### Arrive at Customer
```http
PUT /api/v1/driver/orders/:order_id/arrive-customer
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "arrival_time": "2025-09-10T15:48:00Z",
  "location": {
    "latitude": 3.845,
    "longitude": 11.505
  }
}
```

#### Complete Delivery
```http
PUT /api/v1/driver/orders/:order_id/deliver
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "delivery_time": "2025-09-10T15:52:00Z",
  "delivery_method": "handed_to_customer",
  "recipient_name": "John Customer",
  "verification_code": "5678",
  "photo_proof": "photo_url",
  "payment_collected": {
    "method": "cash",
    "amount": 8500.00,
    "change_given": 1500.00
  },
  "customer_feedback": {
    "satisfied": true,
    "notes": "Customer was very happy"
  }
}
```

### Communication Features

#### Contact Customer
```http
POST /api/v1/driver/orders/:order_id/contact-customer
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "method": "call",
  "reason": "difficulty_finding_address",
  "message": "Having trouble finding your building, could you help?"
}
```

#### Contact Restaurant
```http
POST /api/v1/driver/orders/:order_id/contact-restaurant
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "method": "whatsapp",
  "reason": "order_not_ready",
  "message": "I'm here to pickup order ORD-123456"
}
```

### Earnings & Payouts

#### Get Earnings Summary
```http
GET /api/v1/driver/earnings?period=this_week
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "period": "this_week",
    "summary": {
      "total_earnings": 125000.00,
      "delivery_fees": 98000.00,
      "tips": 15000.00,
      "bonuses": 12000.00,
      "completed_deliveries": 42,
      "total_distance": 187.5,
      "online_hours": 35.5
    },
    "daily_breakdown": [
      {
        "date": "2025-09-04",
        "earnings": 18000.00,
        "deliveries": 6,
        "hours": 5.5
      }
    ]
  }
}
```

#### Get Detailed Earnings
```http
GET /api/v1/driver/earnings/detailed?start_date=2025-09-01&end_date=2025-09-30
Authorization: Bearer <access_token>
```

#### Request Payout
```http
POST /api/v1/driver/payouts/request
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "amount": 100000.00,
  "payout_method": "mobile_money",
  "account_details": {
    "phone": "+237670000003",
    "provider": "orange_money"
  }
}
```

#### Get Payout History
```http
GET /api/v1/driver/payouts?page=1&limit=20
Authorization: Bearer <access_token>
```

### Performance Analytics

#### Get Performance Metrics
```http
GET /api/v1/driver/analytics/performance?period=last_30_days
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "period": "last_30_days",
    "metrics": {
      "acceptance_rate": 0.85,
      "completion_rate": 0.98,
      "average_delivery_time": 22.5,
      "customer_rating": 4.7,
      "on_time_rate": 0.92,
      "earnings_per_hour": 3521.43
    },
    "rankings": {
      "city_rank": 15,
      "zone_rank": 3,
      "total_drivers": 250
    },
    "achievements": [
      {
        "name": "Speed Demon",
        "description": "Completed 10 deliveries under 20 minutes",
        "earned_date": "2025-09-05T00:00:00Z"
      }
    ]
  }
}
```

---

## Admin User Documentation

### Overview
Admin users have comprehensive access to manage the entire platform, including user management, restaurant approvals, system monitoring, and business analytics.

### Admin Capabilities
- ✅ Complete user management (all roles)
- ✅ Restaurant KYC and approval process
- ✅ Order management and dispute resolution
- ✅ Commission and payout management
- ✅ System analytics and business intelligence
- ✅ Content management and promotions
- ✅ Support ticket management
- ✅ Platform configuration and settings
- ✅ Financial reporting and reconciliation

### User Management

#### Get All Users
```http
GET /api/v1/admin/users?role=customer&status=active&page=1&limit=50
Authorization: Bearer <access_token>
```

#### Get User Details
```http
GET /api/v1/admin/users/:user_id
Authorization: Bearer <access_token>
```

#### Update User Status
```http
PUT /api/v1/admin/users/:user_id/status
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "status": "suspended",
  "reason": "violation_of_terms",
  "custom_reason": "Multiple fraudulent orders",
  "duration": "7_days",
  "notify_user": true
}
```

#### Create Admin User
```http
POST /api/v1/admin/users/create-admin
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "email": "newadmin@eatfast.cm",
  "name": "New Admin",
  "phone": "+237670000005",
  "permissions": ["user_management", "restaurant_approval", "analytics"],
  "temporary_password": true
}
```

### Restaurant Management

#### Get Restaurants
```http
GET /api/v1/admin/restaurants?status=pending&page=1&limit=20
Authorization: Bearer <access_token>
```

#### Get Restaurant Details
```http
GET /api/v1/admin/restaurants/:restaurant_id
Authorization: Bearer <access_token>
```

#### Review Restaurant Documents
```http
GET /api/v1/admin/restaurants/:restaurant_id/documents
Authorization: Bearer <access_token>
```

#### Approve Restaurant
```http
POST /api/v1/admin/restaurants/:restaurant_id/approve
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "commission_rate": 0.15,
  "notes": "All documents verified and approved",
  "welcome_package": true,
  "onboarding_support": true
}
```

#### Reject Restaurant
```http
POST /api/v1/admin/restaurants/:restaurant_id/reject
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "reason": "incomplete_documents",
  "feedback": "Business license is expired. Please upload a valid license.",
  "resubmission_allowed": true,
  "required_documents": ["business_license"]
}
```

#### Suspend Restaurant
```http
PUT /api/v1/admin/restaurants/:restaurant_id/suspend
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "reason": "quality_complaints",
  "duration": "30_days",
  "conditions_for_reinstatement": "Must complete food safety training",
  "notify_customers": true
}
```

### Order Management

#### Get All Orders
```http
GET /api/v1/admin/orders?status=disputed&date_from=2025-09-01&page=1&limit=50
Authorization: Bearer <access_token>
```

#### Get Order Details
```http
GET /api/v1/admin/orders/:order_id
Authorization: Bearer <access_token>
```

#### Process Refund
```http
POST /api/v1/admin/orders/:order_id/refund
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "amount": 8500.00,
  "reason": "restaurant_cancelled",
  "refund_method": "original_payment_method",
  "processing_fee": 0.00,
  "notify_customer": true,
  "internal_notes": "Full refund approved due to restaurant closure"
}
```

#### Resolve Dispute
```http
POST /api/v1/admin/orders/:order_id/resolve-dispute
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "resolution": "partial_refund",
  "refund_amount": 4250.00,
  "explanation": "50% refund approved for cold food complaint",
  "compensation": {
    "customer_credit": 1000.00,
    "restaurant_penalty": 500.00
  },
  "follow_up_required": true
}
```

### Commission Management

#### Get Commission Records
```http
GET /api/v1/admin/commissions?restaurant_id=uuid&status=pending&page=1&limit=50
Authorization: Bearer <access_token>
```

#### Process Commission Payout
```http
POST /api/v1/admin/commissions/:record_id/process-payout
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "payout_method": "bank_transfer",
  "account_details": {
    "bank_name": "Afriland First Bank",
    "account_number": "12345678901",
    "account_name": "Restaurant ABC"
  },
  "processing_fee": 500.00,
  "expected_date": "2025-09-15T00:00:00Z"
}
```

#### Generate Commission Report
```http
GET /api/v1/admin/reports/commissions?period=last_month&format=pdf
Authorization: Bearer <access_token>
```

### Analytics & Business Intelligence

#### Get Dashboard Analytics
```http
GET /api/v1/admin/analytics/dashboard?period=last_7_days
Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "period": "last_7_days",
    "overview": {
      "total_orders": 1250,
      "total_revenue": 4375000.00,
      "total_commission": 656250.00,
      "active_restaurants": 45,
      "active_drivers": 78,
      "new_customers": 125
    },
    "trends": {
      "order_growth": 0.12,
      "revenue_growth": 0.15,
      "customer_growth": 0.08
    },
    "top_performers": {
      "restaurants": [...],
      "drivers": [...],
      "locations": [...]
    }
  }
}
```

#### Get Revenue Analytics
```http
GET /api/v1/admin/analytics/revenue?period=this_month&breakdown=daily
Authorization: Bearer <access_token>
```

#### Get User Analytics
```http
GET /api/v1/admin/analytics/users?metrics=acquisition,retention,engagement
Authorization: Bearer <access_token>
```

#### Export Business Report
```http
POST /api/v1/admin/reports/export
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "report_type": "comprehensive",
  "period": {
    "start_date": "2025-09-01",
    "end_date": "2025-09-30"
  },
  "format": "excel",
  "sections": [
    "revenue_summary",
    "order_analytics",
    "restaurant_performance",
    "driver_metrics",
    "customer_behavior"
  ],
  "email_to": "admin@eatfast.cm"
}
```

### System Management

#### Get System Health
```http
GET /api/v1/admin/system/health
Authorization: Bearer <access_token>
```

#### Get System Metrics
```http
GET /api/v1/admin/system/metrics?period=last_hour
Authorization: Bearer <access_token>
```

#### Update System Settings
```http
PUT /api/v1/admin/system/settings
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "general": {
    "platform_name": "EatFast",
    "default_currency": "XAF",
    "default_language": "fr",
    "timezone": "Africa/Douala"
  },
  "business": {
    "default_commission_rate": 0.15,
    "minimum_order_value": 1000.00,
    "maximum_delivery_radius": 20.0,
    "default_delivery_fee": 1000.00
  },
  "notifications": {
    "sms_enabled": true,
    "email_enabled": true,
    "push_enabled": true,
    "whatsapp_enabled": true
  }
}
```

#### View System Logs
```http
GET /api/v1/admin/logs?level=error&service=payment&page=1&limit=100
Authorization: Bearer <access_token>
```

### Support Management

#### Get Support Tickets
```http
GET /api/v1/admin/support/tickets?status=open&priority=high&page=1&limit=20
Authorization: Bearer <access_token>
```

#### Assign Ticket
```http
PUT /api/v1/admin/support/tickets/:ticket_id/assign
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "assigned_to": "admin_user_id",
  "priority": "high",
  "estimated_resolution": "2025-09-11T10:00:00Z"
}
```

#### Resolve Ticket
```http
PUT /api/v1/admin/support/tickets/:ticket_id/resolve
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "resolution": "Issue resolved by updating payment gateway configuration",
  "resolution_time": "2025-09-10T16:30:00Z",
  "customer_satisfaction": 5,
  "follow_up_required": false
}
```

### Content Management

#### Create Platform Announcement
```http
POST /api/v1/admin/content/announcements
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "title": "New Payment Method Available",
  "content": "We're excited to announce support for Orange Money payments!",
  "target_audience": "all_users",
  "start_date": "2025-09-15T00:00:00Z",
  "end_date": "2025-09-30T23:59:59Z",
  "priority": "normal"
}
```

#### Manage Promotional Campaigns
```http
POST /api/v1/admin/content/campaigns
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "name": "September Food Festival",
  "type": "platform_wide_discount",
  "discount_percentage": 20,
  "start_date": "2025-09-20T00:00:00Z",
  "end_date": "2025-09-25T23:59:59Z",
  "participating_restaurants": ["restaurant_1", "restaurant_2"],
  "budget": 500000.00,
  "target_orders": 1000
}
```

---

## Common Features Across All User Types

### Error Handling
All API endpoints return standardized error responses:

```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable error message",
    "details": "Additional error details if available"
  },
  "timestamp": "2025-09-10T14:30:00Z",
  "request_id": "req_123456789"
}
```

### Pagination
List endpoints support pagination:

```http
GET /api/v1/endpoint?page=1&limit=20&sort=created_at&order=desc
```

### Filtering and Search
Most list endpoints support filtering:

```http
GET /api/v1/restaurants?cuisine=cameroonian&rating_min=4.0&distance_max=5
```

### Real-time Updates
All user types can subscribe to relevant WebSocket events for real-time updates.

### Multi-language Support
API responses can be localized by including the `Accept-Language` header:

```http
Accept-Language: fr-CM,fr;q=0.9,en;q=0.8
```

---

*This documentation covers the comprehensive functionality available to each user type in the EatFast platform. For specific implementation details, refer to the main API documentation.*