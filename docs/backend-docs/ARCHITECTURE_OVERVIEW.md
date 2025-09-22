# 🏗️ **EatFast Backend - Architecture Overview**

**Version:** 2.0.0 (Enhanced)
**Last Updated:** September 22, 2025
**Status:** ✅ Production Ready with Enhanced Features

---

## 📋 **Table of Contents**

- [System Architecture](#system-architecture)
- [Technology Stack](#technology-stack)
- [Directory Structure](#directory-structure)
- [Service Architecture](#service-architecture)
- [Database Design](#database-design)
- [API Architecture](#api-architecture)
- [Security Architecture](#security-architecture)
- [Deployment Architecture](#deployment-architecture)

---

## 🏛️ **System Architecture**

### **High-Level Architecture**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Mobile Apps   │    │   Web Frontend  │    │   Admin Panel   │
│  (iOS/Android)  │    │   (React/Vue)   │    │   (Dashboard)   │
└─────────┬───────┘    └─────────┬───────┘    └─────────┬───────┘
          │                      │                      │
          └──────────────────────┼──────────────────────┘
                                 │
                    ┌─────────────┴─────────────┐
                    │     Load Balancer/CDN     │
                    └─────────────┬─────────────┘
                                 │
                    ┌─────────────┴─────────────┐
                    │    EatFast Backend API    │
                    │     (Express.js)          │
                    └─────────────┬─────────────┘
                                 │
        ┌────────────────────────┼────────────────────────┐
        │                        │                        │
┌───────▼────────┐    ┌─────────▼────────┐    ┌─────────▼────────┐
│   PostgreSQL   │    │      Redis       │    │  File Storage    │
│   (Primary DB) │    │   (Cache/Jobs)   │    │   (Images/Docs)  │
└────────────────┘    └──────────────────┘    └──────────────────┘
```

### **Service Integration Architecture**

```
┌─────────────────────────────────────────────────────────────────┐
│                    EatFast Backend Core                         │
├─────────────────────────────────────────────────────────────────┤
│  External Services Integration Layer                            │
├─────────────────┬─────────────────┬─────────────────┬───────────┤
│   Google Maps   │   Google GA4    │   Infobip SMS   │ WhatsApp  │
│   • Geocoding   │   • Analytics   │   • SMS Service │ • Business│
│   • Routing     │   • Tracking    │   • Validation  │ • Templates│
│   • Places API  │   • Metrics     │   • Delivery    │ • Webhooks│
└─────────────────┴─────────────────┴─────────────────┴───────────┘
```

---

## 🛠️ **Technology Stack**

### **Backend Core**
- **Runtime:** Node.js 18+
- **Framework:** Express.js (Pure implementation)
- **Language:** JavaScript (ES2022)
- **Architecture:** RESTful API + WebSocket

### **Database & Storage**
- **Primary Database:** PostgreSQL 14+
- **Caching:** Redis 6+
- **File Storage:** Cloud Storage (AWS S3/Cloudinary)
- **Session Store:** Redis

### **External Integrations**
- **Maps & Location:** Google Maps API
- **Analytics:** Google Analytics 4 (Measurement Protocol)
- **SMS Service:** Infobip
- **Messaging:** WhatsApp Business API
- **Payments:** CamPay, NouPay, Stripe
- **Email:** Gmail SMTP

### **Security & Monitoring**
- **Authentication:** JWT + Refresh Tokens
- **Encryption:** bcrypt, crypto
- **Rate Limiting:** Redis-based
- **Monitoring:** Custom metrics + Health checks
- **Logging:** Winston + structured logging

---

## 📁 **Directory Structure**

```
eatfast-backend/
├── src/
│   ├── config/                 # Configuration files
│   │   ├── database.js
│   │   ├── redis.js
│   │   └── environment.js
│   │
│   ├── controllers/            # Route controllers
│   │   ├── auth/
│   │   ├── orders/
│   │   ├── restaurants/
│   │   ├── users/
│   │   └── payments/
│   │
│   ├── middleware/             # Express middleware (organized)
│   │   ├── auth/              # Authentication middleware
│   │   ├── validation/        # Validation middleware
│   │   ├── security/          # Security middleware
│   │   ├── monitoring/        # Monitoring middleware
│   │   └── cache/             # Caching middleware
│   │
│   ├── models/                # Database models (Sequelize)
│   │   ├── User.js
│   │   ├── Restaurant.js
│   │   ├── Order.js
│   │   └── Payment.js
│   │
│   ├── routes/                # API routes
│   │   ├── auth.js
│   │   ├── orders.js
│   │   ├── restaurants.js
│   │   └── admin.js
│   │
│   ├── services/              # Business logic services
│   │   ├── external/          # External service integrations
│   │   │   ├── googleMapsService.js
│   │   │   ├── googleAnalyticsService.js
│   │   │   ├── infobipService.js
│   │   │   └── whatsappService.js
│   │   ├── shared/            # Shared services
│   │   │   ├── localizationService.js
│   │   │   └── monitoringService.js
│   │   ├── payment/           # Payment services
│   │   ├── notification/      # Notification services
│   │   └── security/          # Security services
│   │
│   ├── utils/                 # Utility functions (organized)
│   │   ├── logging/           # Logging utilities
│   │   ├── validation/        # Validation utilities
│   │   ├── cache/             # Cache utilities
│   │   └── payment/           # Payment utilities
│   │
│   ├── migrations/            # Database migrations
│   ├── seeders/               # Database seeders
│   └── app.js                 # Express app setup
│
├── scripts/                   # Utility scripts
│   ├── unified-migrations.js  # Migration management
│   ├── unified-validation.js  # System validation
│   ├── setup-postgresql.js    # DB setup
│   └── test-postgresql-migrations.js
│
├── docs/                      # Documentation
├── config/                    # Configuration files
├── logs/                      # Application logs
└── tests/                     # Test files
```

---

## 🔧 **Service Architecture**

### **Core Service Layers**

```
┌─────────────────────────────────────────────────────────────┐
│                     API Layer                               │
│  Controllers → Validation → Business Logic → Response       │
└─────────────────────┬───────────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────────┐
│                 Business Logic Layer                        │
│  • Order Management    • User Management                    │
│  • Payment Processing  • Restaurant Operations              │
│  • Delivery Tracking   • Analytics & Reporting             │
└─────────────────────┬───────────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────────┐
│                 Service Layer                               │
│  • External Integrations  • Notification Services          │
│  • Security Services      • Caching Services               │
│  • Monitoring Services    • Localization Services          │
└─────────────────────┬───────────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────────┐
│                 Data Access Layer                           │
│  • PostgreSQL (Primary)   • Redis (Cache/Sessions)         │
│  • File Storage           • External APIs                  │
└─────────────────────────────────────────────────────────────┘
```

### **External Service Integration**

#### **Google Services**
- **Maps API:** Address validation, geocoding, route optimization
- **Analytics:** User behavior tracking, business metrics
- **Places:** Location search with Cameroon bias

#### **Communication Services**
- **Infobip SMS:** Primary SMS provider with Cameroon support
- **WhatsApp Business:** Template messaging and notifications
- **Web Push:** Pure Express.js push notifications

#### **Payment Services**
- **CamPay/NouPay:** Local mobile money integration
- **Stripe:** International card payments
- **Cash on Delivery:** Enhanced with fraud detection

---

## 🗄️ **Database Design**

### **PostgreSQL Schema Overview**

```sql
-- Core Tables
Users (id, email, phone, role, status, created_at, updated_at)
Restaurants (id, name, address, coordinates, status, created_at)
Menus (id, restaurant_id, name, price, category, availability)
Orders (id, user_id, restaurant_id, status, total, created_at)
OrderItems (id, order_id, menu_id, quantity, price)
Payments (id, order_id, method, status, amount, transaction_id)
Deliveries (id, order_id, driver_id, status, pickup_time, delivery_time)

-- Enhanced Tables
Wallets (id, user_id, balance, currency, updated_at)
LoyaltyPoints (id, user_id, points, earned_from, created_at)
Analytics (id, event_type, user_id, metadata, created_at)
GuestSessions (id, session_id, data, expires_at)
FraudAlerts (id, order_id, risk_score, factors, created_at)
```

### **Indexing Strategy**
- **Primary Keys:** All tables have UUID primary keys
- **Foreign Keys:** Properly indexed for joins
- **Search Indexes:** Full-text search on restaurant names, menu items
- **Performance Indexes:** Order status, user roles, timestamp ranges

---

## 🌐 **API Architecture**

### **RESTful API Design**

```
/api/v1/
├── auth/                    # Authentication endpoints
│   ├── POST /login
│   ├── POST /register
│   ├── POST /refresh
│   └── POST /logout
│
├── users/                   # User management
│   ├── GET /profile
│   ├── PUT /profile
│   ├── POST /convert-guest
│   └── GET /analytics
│
├── restaurants/             # Restaurant operations
│   ├── GET /
│   ├── GET /:id
│   ├── GET /:id/menu
│   └── POST /:id/orders
│
├── orders/                  # Order management
│   ├── GET /
│   ├── POST /
│   ├── GET /:id
│   ├── PUT /:id/status
│   └── GET /:id/tracking
│
├── payments/                # Payment processing
│   ├── POST /process
│   ├── GET /methods
│   ├── POST /campay
│   ├── POST /noupay
│   └── POST /stripe
│
├── notifications/           # Notification services
│   ├── POST /sms
│   ├── POST /whatsapp
│   ├── POST /push
│   └── GET /preferences
│
└── admin/                   # Admin operations
    ├── GET /dashboard
    ├── GET /analytics
    ├── POST /restaurants
    └── GET /system-health
```

### **WebSocket Events**

```javascript
// Real-time events
'order:created'       // New order notification
'order:status_updated' // Order status changes
'delivery:location'   // Driver location updates
'user:notification'   // User-specific notifications
'restaurant:new_order' // Restaurant notifications
```

---

## 🛡️ **Security Architecture**

### **Authentication & Authorization**

```
┌─────────────────────────────────────────────────────────────┐
│                   Security Layers                           │
├─────────────────────────────────────────────────────────────┤
│  Rate Limiting → CORS → Auth → RBAC → Validation → Action  │
└─────────────────────────────────────────────────────────────┘
```

#### **Security Features**
- **JWT Authentication:** Access tokens + refresh tokens
- **Role-Based Access Control:** Admin, Restaurant, Driver, Customer roles
- **Rate Limiting:** Redis-based with different limits per role
- **Input Validation:** Comprehensive validation middleware
- **Fraud Detection:** Machine learning pattern recognition
- **HTTPS Enforcement:** SSL/TLS in production
- **CORS Protection:** Configured for allowed origins

### **Data Protection**
- **Password Hashing:** bcrypt with salt rounds
- **Sensitive Data Encryption:** AES-256 for PII
- **API Key Management:** Environment-based configuration
- **Audit Logging:** All sensitive operations logged

---

## 🚀 **Deployment Architecture**

### **Production Environment**

```
┌─────────────────────────────────────────────────────────────┐
│                    Load Balancer                            │
└─────────────────────┬───────────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────────┐
│              Application Servers (3x)                       │
│  Node.js + Express.js + PM2 Process Management             │
└─────────────────────┬───────────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────────┐
│                Database Cluster                             │
│  PostgreSQL Primary + Read Replicas + Redis Cluster        │
└─────────────────────────────────────────────────────────────┘
```

### **Environment Configuration**

#### **Production Environment Variables**
```bash
# Database
DATABASE_URL=postgresql://user:pass@host:5432/db
REDIS_URL=redis://user:pass@host:6379

# Google Services
GOOGLE_MAPS_API_KEY=your_maps_key
GOOGLE_ANALYTICS_MEASUREMENT_ID=GA4_measurement_id

# Communication Services
INFOBIP_API_KEY=your_infobip_key
WHATSAPP_ACCESS_TOKEN=your_whatsapp_token

# Payment Services
CAMPAY_API_KEY=your_campay_key
STRIPE_SECRET_KEY=your_stripe_key

# Security
JWT_SECRET=your_jwt_secret
ENCRYPTION_KEY=your_encryption_key
```

### **Monitoring & Health Checks**

#### **Health Check Endpoints**
- `/health` - Basic health status
- `/health/detailed` - Comprehensive system health
- `/metrics` - Prometheus-compatible metrics
- `/status` - Service status dashboard

#### **Monitoring Metrics**
- **Performance:** Response times, throughput, error rates
- **Business:** Orders, revenue, user engagement
- **System:** CPU, memory, database connections
- **External Services:** API response times, success rates

---

## 📈 **Scalability Considerations**

### **Horizontal Scaling**
- **Stateless Application Design:** No server-side sessions
- **Database Read Replicas:** Separate read/write operations
- **Redis Clustering:** Distributed caching and sessions
- **Microservice Ready:** Service-oriented architecture

### **Performance Optimization**
- **Database Indexing:** Optimized for common queries
- **Response Caching:** Redis-based API response caching
- **Image Optimization:** CDN + compression
- **Mobile Optimization:** Specific endpoints for mobile apps

---

**Architecture Documentation Updated:** September 22, 2025
**Next Review:** October 1, 2025