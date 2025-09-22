# 🚀 **EatFast Backend API - Complete Documentation**

**Version:** 1.0.0 (Production Ready)  
**Last Updated:** September 22, 2025
**Status:** ✅ Production Deployment Ready - Enhanced with Google Services & Advanced Features
**Deployment:** [https://eatfast-backend-api.onrender.com](https://eatfast-backend-api.onrender.com)

---

## 📋 **Table of Contents**
- [Overview](#overview)
- [Production Status](#production-status)
- [Authentication](#authentication)
- [User Types & Roles](#user-types--roles)
- [API Endpoints by User Type](#api-endpoints-by-user-type)
- [Core Features](#core-features)
- [Payment Integration](#payment-integration)
- [Real-time Features](#real-time-features)
- [Notification System](#notification-system)
- [Security Implementation](#security-implementation)
- [Database Models](#database-models)
- [Error Handling](#error-handling)
- [Rate Limiting](#rate-limiting)
- [Performance & Monitoring](#performance--monitoring)
- [Deployment](#deployment)

---

## 🎯 **Overview**

EatFast is a **production-ready** comprehensive food delivery platform backend designed specifically for the Cameroon market. It supports multiple user types (Guest, Customer, Restaurant, Driver, Admin) with enterprise-grade security, real-time capabilities, and robust business logic.

### 🏆 **Key Features**
- ✅ **Multi-role Authentication** with JWT and OAuth support
- ✅ **Google Maps Integration** with Cameroon-specific fallbacks and traffic-aware routing
- ✅ **Google Analytics 4** server-side tracking with comprehensive metrics
- ✅ **Infobip SMS Service** with Cameroon phone number validation
- ✅ **WhatsApp Business API** with template messaging support
- ✅ **Payment Processing** with local (CamPay, NouPay) and international (Stripe) providers
- ✅ **Real-time Order Tracking** with WebSocket integration
- ✅ **SMS/Email Notifications** with graceful fallback support
- ✅ **Commission Management** for platform revenue optimization
- ✅ **Enhanced Loyalty & Referral System** with dynamic rewards
- ✅ **Multi-language Support** (French/English) for Cameroon market
- ✅ **Guest-to-User Conversion** with comprehensive incentives
- ✅ **Advanced Fraud Detection** with machine learning patterns
- ✅ **Dynamic Pricing** for Cameroon market conditions
- ✅ **Mobile-optimized APIs** with caching and compression
- ✅ **Enterprise Security** with comprehensive middleware stack
- ✅ **Production Monitoring** with health checks and performance metrics
- ✅ **Pure Express.js Implementation** (Firebase and Yandex Maps removed)

---

## 🔒 **Production Status**

### **Deployment Information**
- **Environment:** Production (Render.com)
- **Server Status:** ✅ Active and Stable
- **Database:** PostgreSQL (Production) + SQLite (Development)
- **Last Deployment:** September 13, 2025
- **Health Check:** `/health` endpoint available

### **Production Readiness Checklist**
- ✅ Email service stability (graceful fallback implemented)
- ✅ All dependencies installed and validated
- ✅ Security middleware configured
- ✅ Environment variables configured
- ✅ Database migrations completed
- ✅ Error handling implemented
- ✅ Performance optimization completed
- ✅ Documentation comprehensive and up-to-date

---

## Authentication

### Authentication Methods
1. **Email/Password** with Argon2id hashing
2. **OAuth** (Google, Apple)
3. **Two-Factor Authentication** (TOTP)
4. **Guest Sessions** for anonymous users

### JWT Token Structure
```json
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "refresh_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "expires_in": 3600,
  "token_type": "Bearer"
}
```

### Headers Required
```http
Authorization: Bearer <access_token>
Content-Type: application/json
Accept: application/json
```

## User Types & Roles

### 1. Guest Users
**Access Level**: Public + Limited ordering
**Capabilities**:
- Browse restaurants and menus
- Place orders without registration
- Track orders via unique links
- Receive SMS/Email notifications
- Convert to registered user

### 2. Customer Users
**Access Level**: Full customer features
**Capabilities**:
- All guest capabilities
- Persistent order history
- Saved addresses and payment methods
- Loyalty points and referrals
- Reviews and ratings
- Subscription management

### 3. Restaurant Owners
**Access Level**: Restaurant management
**Capabilities**:
- Restaurant profile management
- Menu and pricing management
- Order processing and status updates
- Analytics and reports
- Staff management
- Subscription plans

### 4. Delivery Drivers
**Access Level**: Delivery operations
**Capabilities**:
- Order assignment and acceptance
- Real-time location tracking
- Earnings tracking
- Delivery status updates
- Route optimization

### 5. Admin Users
**Access Level**: Platform administration
**Capabilities**:
- User management (all types)
- Restaurant approval and KYC
- Commission and payout management
- System analytics and reports
- Content management
- Support ticket resolution

## API Endpoints by User Type

### Base URL
```
Production: https://api.eatfast.cm/api/v1
Development: http://localhost:4000/api/v1
```

### Guest User Endpoints

#### Browse Restaurants
```http
GET /public/restaurants
GET /public/restaurants/:id
GET /public/restaurants/:id/menu
```

#### Guest Orders
```http
POST /guest/orders
GET /guest/orders/:id/track?token=<guest_token>
POST /guest/orders/:id/feedback
```

#### Guest Session
```http
POST /guest/session
GET /guest/session/:token
```

### Customer Endpoints

#### Authentication
```http
POST /auth/register
POST /auth/login
POST /auth/logout
POST /auth/refresh
POST /auth/forgot-password
POST /auth/reset-password
POST /auth/verify-email
```

#### Two-Factor Authentication
```http
POST /auth/2fa/setup
POST /auth/2fa/verify
POST /auth/2fa/disable
GET /auth/2fa/backup-codes
```

#### OAuth
```http
GET /auth/google
GET /auth/google/callback
GET /auth/apple
POST /auth/apple/callback
```

#### Profile Management
```http
GET /client/profile
PUT /client/profile
DELETE /client/profile
GET /client/addresses
POST /client/addresses
PUT /client/addresses/:id
DELETE /client/addresses/:id
```

#### Orders
```http
POST /client/orders
GET /client/orders
GET /client/orders/:id
PUT /client/orders/:id/cancel
POST /client/orders/:id/review
GET /client/orders/:id/track
```

#### Payment & Wallet
```http
GET /client/wallet
POST /client/wallet/topup
GET /client/payment-methods
POST /client/payment-methods
DELETE /client/payment-methods/:id
```

#### Loyalty & Referrals
```http
GET /client/loyalty/points
GET /client/loyalty/history
POST /client/referrals/send
GET /client/referrals/stats
```

### Restaurant Endpoints

#### Restaurant Management
```http
GET /restaurant/profile
PUT /restaurant/profile
POST /restaurant/documents
GET /restaurant/analytics
```

#### Menu Management
```http
GET /restaurant/menu
POST /restaurant/menu/items
PUT /restaurant/menu/items/:id
DELETE /restaurant/menu/items/:id
POST /restaurant/menu/categories
```

#### Order Processing
```http
GET /restaurant/orders
PUT /restaurant/orders/:id/accept
PUT /restaurant/orders/:id/reject
PUT /restaurant/orders/:id/ready
GET /restaurant/orders/:id
```

#### Staff Management
```http
GET /restaurant/staff
POST /restaurant/staff
PUT /restaurant/staff/:id
DELETE /restaurant/staff/:id
```

#### Subscriptions
```http
GET /restaurant/subscription
POST /restaurant/subscription/upgrade
GET /restaurant/subscription/plans
```

### Driver Endpoints

#### Driver Profile
```http
GET /driver/profile
PUT /driver/profile
POST /driver/documents
PUT /driver/location
```

#### Order Management
```http
GET /driver/orders/available
POST /driver/orders/:id/accept
PUT /driver/orders/:id/pickup
PUT /driver/orders/:id/deliver
GET /driver/orders/current
GET /driver/orders/history
```

#### Earnings
```http
GET /driver/earnings
GET /driver/earnings/summary
POST /driver/payouts/request
GET /driver/payouts
```

### Admin Endpoints

#### User Management
```http
GET /admin/users
GET /admin/users/:id
PUT /admin/users/:id/status
DELETE /admin/users/:id
```

#### Restaurant Management
```http
GET /admin/restaurants
POST /admin/restaurants/:id/approve
POST /admin/restaurants/:id/reject
GET /admin/restaurants/:id/documents
```

#### Order Management
```http
GET /admin/orders
GET /admin/orders/:id
POST /admin/orders/:id/refund
PUT /admin/orders/:id/status
```

#### Analytics & Reports
```http
GET /admin/analytics/dashboard
GET /admin/analytics/revenue
GET /admin/analytics/users
GET /admin/reports/commissions
GET /admin/reports/payouts
```

#### System Management
```http
GET /admin/system/health
GET /admin/system/metrics
PUT /admin/system/settings
GET /admin/logs
```

## Core Features

### Order Management System

#### Order Lifecycle
1. **Created** - Order placed by customer
2. **Confirmed** - Payment processed successfully
3. **Accepted** - Restaurant confirms order
4. **Preparing** - Food is being prepared
5. **Ready** - Order ready for pickup
6. **Assigned** - Driver assigned to order
7. **Picked Up** - Driver collected the order
8. **In Transit** - Order being delivered
9. **Delivered** - Order completed
10. **Cancelled** - Order cancelled (various stages)

#### State Machine Rules
```javascript
const allowedTransitions = {
  'created': ['confirmed', 'cancelled'],
  'confirmed': ['accepted', 'cancelled'],
  'accepted': ['preparing', 'cancelled'],
  'preparing': ['ready'],
  'ready': ['assigned'],
  'assigned': ['picked_up', 'reassigned'],
  'picked_up': ['in_transit'],
  'in_transit': ['delivered'],
  'delivered': ['completed']
};
```

### Commission System

#### Commission Structure
- **Default Rate**: 15% of order total
- **Subscription Discounts**: 8-12% for premium restaurants
- **Payment Processing**: 7 days default payout cycle
- **Dispute Resolution**: Admin-managed dispute process

#### Commission Record Structure
```json
{
  "id": "uuid",
  "orderId": "order_uuid",
  "restaurantId": "restaurant_uuid",
  "orderTotal": 25000.00,
  "commissionRate": 0.15,
  "platformFee": 3750.00,
  "restaurantShare": 21250.00,
  "status": "calculated",
  "currency": "XAF",
  "dueDate": "2025-09-17T00:00:00Z"
}
```

### Loyalty System

#### Point Structure
- **Order Completion**: 10 points per 1000 XAF
- **Referral Bonus**: 500 points per successful referral
- **Review Bonus**: 50 points per review
- **Birthday Bonus**: 1000 points annually

#### Redemption Options
- **Discount**: 100 points = 100 XAF discount
- **Free Delivery**: 200 points
- **Special Offers**: Variable point cost

## Payment Integration

### Supported Payment Methods

#### 1. CamPay (Primary Mobile Money)
```http
POST /payments/campay/initiate
{
  "amount": 5000,
  "currency": "XAF",
  "phone": "+237670000000",
  "description": "Order #ORD-123"
}
```

#### 2. NouPay (Backup Mobile Money)
```http
POST /payments/noupay/initiate
{
  "amount": 5000,
  "currency": "XAF",
  "phone": "+237680000000",
  "description": "Order #ORD-123"
}
```

#### 3. Stripe (Card Payments)
```http
POST /payments/stripe/create-intent
{
  "amount": 5000,
  "currency": "xaf",
  "payment_method_types": ["card"]
}
```

#### 4. Cash on Delivery
- No API calls required
- Handled during delivery confirmation

#### 5. Wallet Credit
```http
POST /payments/wallet/charge
{
  "amount": 5000,
  "description": "Order #ORD-123"
}
```

### Payment Webhooks

#### Generic Webhook Endpoint
```http
POST /payments/webhook/:provider
```

#### Webhook Security
- **Signature Verification**: All webhooks verify signatures
- **Idempotency**: Duplicate webhooks are ignored
- **Retry Logic**: Failed webhooks are retried automatically

### Payment Flow Example
```javascript
// 1. Create order
const order = await createOrder({
  items: [...],
  total: 25000,
  paymentMethod: 'campay'
});

// 2. Initiate payment
const payment = await initiatePayment({
  orderId: order.id,
  amount: order.total,
  method: 'campay',
  phone: '+237670000000'
});

// 3. Handle webhook confirmation
const confirmation = await handleWebhook({
  provider: 'campay',
  transactionId: payment.providerTransactionId,
  status: 'success'
});

// 4. Update order status
await updateOrderStatus(order.id, 'confirmed');
```

## Real-time Features

### WebSocket Integration

#### Connection Setup
```javascript
const socket = io('wss://api.eatfast.cm', {
  auth: {
    token: 'your_jwt_token'
  }
});
```

#### Event Subscriptions

#### For Customers
```javascript
// Order status updates
socket.on('order_status_update', (data) => {
  console.log('Order status:', data.status);
  console.log('ETA:', data.estimatedDeliveryTime);
});

// Driver location updates
socket.on('driver_location_update', (data) => {
  console.log('Driver location:', data.lat, data.lng);
});
```

#### For Restaurants
```javascript
// New order alerts
socket.on('new_order', (order) => {
  console.log('New order received:', order);
});

// Driver assignment
socket.on('driver_assigned', (data) => {
  console.log('Driver assigned:', data.driver);
});
```

#### For Drivers
```javascript
// Order assignments
socket.on('order_assigned', (order) => {
  console.log('New order assigned:', order);
});

// Route updates
socket.on('route_update', (route) => {
  console.log('Updated route:', route);
});
```

### Push Notifications

#### Web Push API
```http
POST /notifications/push/subscribe
{
  "endpoint": "https://fcm.googleapis.com/fcm/send/...",
  "keys": {
    "p256dh": "...",
    "auth": "..."
  }
}
```

## Notification System

### SMS Notifications

#### Providers with Failover
1. **Primary**: Twilio
2. **Fallback**: Infobip
3. **Circuit Breaker**: Automatic failover on failures

#### SMS Categories
- **OTP Verification**: Login and registration codes
- **Order Updates**: Status change notifications
- **Marketing**: Promotional messages (opt-in)
- **Alerts**: Critical system notifications

#### Sample SMS Templates
```javascript
const templates = {
  otp_fr: "Votre code EatFast: {otp}. Expire dans 5 minutes.",
  otp_en: "Your EatFast code: {otp}. Expires in 5 minutes.",
  order_confirmed_fr: "Commande #{orderNumber} confirmée. Temps estimé: {eta} minutes.",
  order_confirmed_en: "Order #{orderNumber} confirmed. Estimated time: {eta} minutes."
};
```

### Email Notifications

#### Provider: Gmail SMTP
- **Authentication**: OAuth2 with refresh tokens
- **Templates**: HTML/Text dual format
- **Attachments**: Receipt PDFs, invoices

#### Email Categories
- **Transactional**: Order confirmations, receipts
- **Marketing**: Newsletters, promotions (opt-in)
- **System**: Account notifications, security alerts

### WhatsApp Business Integration

#### Features
- **Order Updates**: Status notifications via WhatsApp
- **Customer Support**: Automated responses
- **Marketing**: Promotional messages (opt-in)

#### Template Messages
```http
POST /notifications/whatsapp/send-template
{
  "to": "+237670000000",
  "template": "order_confirmation",
  "language": "fr",
  "components": [
    {
      "type": "body",
      "parameters": [
        { "type": "text", "text": "ORD-123" },
        { "type": "text", "text": "30 minutes" }
      ]
    }
  ]
}
```

### Notification Logging

#### Log Structure
```json
{
  "id": "uuid",
  "type": "sms",
  "provider": "twilio",
  "recipient": "+237670000000",
  "content": "Your order is ready for pickup",
  "status": "delivered",
  "cost": 25.50,
  "currency": "XAF",
  "sentAt": "2025-09-10T14:30:00Z",
  "deliveredAt": "2025-09-10T14:30:15Z"
}
```

## Database Models

### Core Models

#### Users
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email VARCHAR UNIQUE NOT NULL,
  phone VARCHAR UNIQUE,
  password_hash VARCHAR,
  role ENUM('customer', 'restaurant_owner', 'delivery_agent', 'admin', 'guest'),
  status ENUM('active', 'suspended', 'banned'),
  emailVerified BOOLEAN DEFAULT false,
  phone_verified BOOLEAN DEFAULT false,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

#### Restaurants
```sql
CREATE TABLE restaurants (
  id UUID PRIMARY KEY,
  owner_id UUID REFERENCES users(id),
  name VARCHAR NOT NULL,
  description TEXT,
  address TEXT NOT NULL,
  latitude DECIMAL(10, 8),
  longitude DECIMAL(11, 8),
  phone VARCHAR,
  email VARCHAR,
  commission_rate DECIMAL(5,4) DEFAULT 0.15,
  status ENUM('pending', 'approved', 'suspended', 'rejected'),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

#### Orders
```sql
CREATE TABLE orders (
  id UUID PRIMARY KEY,
  customer_id UUID REFERENCES users(id),
  restaurant_id UUID REFERENCES restaurants(id),
  driver_id UUID REFERENCES users(id),
  order_number VARCHAR UNIQUE,
  status ENUM('created', 'confirmed', 'accepted', 'preparing', 'ready', 'assigned', 'picked_up', 'in_transit', 'delivered', 'cancelled'),
  subtotal DECIMAL(15,2),
  tax_amount DECIMAL(15,2),
  delivery_fee DECIMAL(15,2),
  service_fee DECIMAL(15,2),
  total_amount DECIMAL(15,2),
  payment_method ENUM('campay', 'noupay', 'stripe', 'cash', 'wallet'),
  payment_status ENUM('pending', 'completed', 'failed', 'refunded'),
  currency VARCHAR(3) DEFAULT 'XAF',
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

#### Commission Records
```sql
CREATE TABLE commission_records (
  id UUID PRIMARY KEY,
  order_id UUID REFERENCES orders(id),
  restaurant_id UUID REFERENCES restaurants(id),
  order_total DECIMAL(15,2),
  commission_rate DECIMAL(5,4),
  platform_fee DECIMAL(15,2),
  restaurant_share DECIMAL(15,2),
  status ENUM('pending', 'calculated', 'processed', 'paid'),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

#### Notification Logs
```sql
CREATE TABLE notification_logs (
  id UUID PRIMARY KEY,
  type ENUM('sms', 'email', 'push', 'whatsapp'),
  provider VARCHAR(50),
  recipient VARCHAR,
  content TEXT,
  status ENUM('queued', 'sent', 'delivered', 'failed'),
  cost DECIMAL(10,6),
  sent_at TIMESTAMP,
  delivered_at TIMESTAMP,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

### Model Relationships

#### User Associations
- User **hasMany** Orders (as customer)
- User **hasMany** Orders (as driver)  
- User **hasOne** Restaurant (as owner)
- User **hasMany** Reviews
- User **hasOne** Wallet

#### Order Associations
- Order **belongsTo** User (customer)
- Order **belongsTo** User (driver)
- Order **belongsTo** Restaurant
- Order **hasMany** OrderItems
- Order **hasOne** Payment
- Order **hasOne** Delivery
- Order **hasOne** CommissionRecord

#### Restaurant Associations
- Restaurant **belongsTo** User (owner)
- Restaurant **hasMany** Orders
- Restaurant **hasMany** MenuItems
- Restaurant **hasMany** Reviews
- Restaurant **hasMany** CommissionRecords

## Error Handling

### Standard Error Response Format
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": [
      {
        "field": "email",
        "message": "Valid email is required"
      }
    ]
  },
  "timestamp": "2025-09-10T14:30:00Z",
  "requestId": "req_123456789"
}
```

### HTTP Status Codes
- **200**: Success
- **201**: Created
- **400**: Bad Request (validation errors)
- **401**: Unauthorized (authentication required)
- **403**: Forbidden (insufficient permissions)
- **404**: Not Found
- **409**: Conflict (duplicate resource)
- **422**: Unprocessable Entity (business logic error)
- **429**: Too Many Requests (rate limited)
- **500**: Internal Server Error

### Error Categories

#### Authentication Errors
```json
{
  "code": "AUTH_REQUIRED",
  "message": "Authentication token required"
}
```

#### Validation Errors
```json
{
  "code": "VALIDATION_ERROR",
  "message": "Input validation failed",
  "details": [...]
}
```

#### Business Logic Errors
```json
{
  "code": "INSUFFICIENT_BALANCE",
  "message": "Wallet balance insufficient for this transaction"
}
```

#### System Errors
```json
{
  "code": "PAYMENT_GATEWAY_ERROR",
  "message": "Payment processing temporarily unavailable"
}
```

## Rate Limiting

### Rate Limit Rules

#### Authentication Endpoints
- **Login**: 5 requests per minute per IP
- **Register**: 3 requests per minute per IP  
- **OTP**: 3 requests per minute per phone number

#### Order Endpoints
- **Create Order**: 10 requests per minute per user
- **Update Status**: 30 requests per minute per restaurant

#### General API
- **Default**: 100 requests per minute per user
- **Guest**: 50 requests per minute per IP

### Rate Limit Headers
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1694360400
```

### Rate Limit Response
```http
HTTP/1.1 429 Too Many Requests
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Too many requests. Try again in 60 seconds.",
    "retryAfter": 60
  }
}
```

## Deployment

### Environment Variables

#### Database Configuration
```bash
DB_TYPE=postgresql
DATABASE_URL=postgresql://username:password@host:5432/database
DB_POOL_MAX=25
DB_POOL_MIN=10
```

#### Payment Configuration
```bash
# CamPay
CAMPAY_API_KEY=your_campay_key
CAMPAY_SECRET=your_campay_secret
CAMPAY_ENVIRONMENT=production

# NouPay  
NOUPAY_API_KEY=your_noupay_key
NOUPAY_SECRET=your_noupay_secret

# Stripe
STRIPE_SECRET_KEY=sk_live_...
STRIPE_WEBHOOK_SECRET=whsec_...
```

#### SMS Configuration
```bash
# Twilio (Primary)
TWILIO_ACCOUNT_SID=your_twilio_sid
TWILIO_AUTH_TOKEN=your_twilio_token
TWILIO_FROM_NUMBER=+1234567890

# Infobip (Fallback)
INFOBIP_API_KEY=your_infobip_key
INFOBIP_API_BASE_URL=xxxxx.api.infobip.com
```

#### Security Configuration
```bash
JWT_ACCESS_SECRET=your_jwt_access_secret
JWT_REFRESH_SECRET=your_jwt_refresh_secret  
JWT_ACCESS_EXPIRES_IN=1h
JWT_REFRESH_EXPIRES_IN=7d
```

### Health Checks

#### System Health Endpoint
```http
GET /health
```

#### Response
```json
{
  "status": "healthy",
  "timestamp": "2025-09-10T14:30:00Z",
  "uptime": 86400,
  "version": "1.0.0",
  "services": {
    "database": {
      "status": "connected",
      "responseTime": "12ms"
    },
    "redis": {
      "status": "connected",
      "responseTime": "5ms"  
    },
    "sms": {
      "twilio": "healthy",
      "infobip": "healthy"
    },
    "payments": {
      "campay": "healthy",
      "noupay": "healthy", 
      "stripe": "healthy"
    }
  }
}
```

### Monitoring

#### Metrics Endpoint
```http  
GET /metrics
```

#### Available Metrics
- Request rate and response times
- Database query performance
- Payment success/failure rates
- SMS delivery rates
- Error rates by endpoint
- Active user sessions
- Order processing times

### Performance Benchmarks

#### Target Performance Metrics
- **API Response Time**: < 200ms (95th percentile)
- **Database Query Time**: < 50ms (average)
- **Order Processing**: < 30 seconds (creation to confirmation)
- **SMS Delivery**: < 10 seconds
- **Uptime**: > 99.9%

### Scaling Recommendations

#### Horizontal Scaling
- **API Servers**: Load balanced behind nginx
- **Database**: Read replicas for analytics queries
- **Queue Workers**: Separate instances for background jobs
- **File Storage**: CDN for static assets

#### Caching Strategy
- **Redis**: Session storage, API response caching
- **Application Cache**: Menu items, restaurant data
- **Database Cache**: Query result caching

### Security Considerations

#### Data Protection
- **Encryption**: All sensitive data encrypted at rest
- **TLS**: All API endpoints use HTTPS
- **PII Handling**: Customer data anonymized in logs
- **Access Control**: Role-based permissions enforced

#### Monitoring & Alerting
- **Error Tracking**: Real-time error monitoring
- **Performance Monitoring**: APM with alerts
- **Security Monitoring**: Failed login attempts, suspicious activity
- **Business Metrics**: Order volume, revenue tracking

---

## Support & Contact

### Technical Support
- **Documentation**: https://docs.eatfast.cm
- **API Support**: api-support@eatfast.cm  
- **Status Page**: https://status.eatfast.cm

### Business Support
- **Restaurant Onboarding**: partners@eatfast.cm
- **Driver Support**: drivers@eatfast.cm
- **Customer Support**: support@eatfast.cm

---

*This documentation is automatically generated and updated. Last updated: September 10, 2025*