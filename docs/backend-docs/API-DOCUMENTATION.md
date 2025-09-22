# EatFast Backend API Documentation v1.0.0

## Overview

EatFast is a comprehensive food delivery platform backend designed specifically for the Cameroonian market. This API provides a complete solution for connecting customers, restaurants, and delivery drivers with modern features like real-time tracking, AI-powered recommendations, and multiple payment gateways.

## Architecture

### Tech Stack
- **Runtime**: Node.js 22.x
- **Framework**: Express.js
- **Database**: SQLite (dev) / PostgreSQL (prod)
- **ORM**: Sequelize
- **Authentication**: JWT with refresh tokens
- **Real-time**: Socket.IO
- **Documentation**: Swagger/OpenAPI
- **Testing**: Jest
- **Deployment**: Docker + Kubernetes

### Key Features
- Multi-role user system (Customer, Restaurant Owner, Driver, Admin)
- Real-time order tracking with WebSocket
- AI-powered menu recommendations
- Multiple payment gateways (CamPay, NouPay, Stripe)
- SMS notifications (Twilio, Infobip failover)
- Email notifications with templates
- Loyalty and gamification system
- Advanced analytics and reporting
- Mobile-optimized API responses

## User Types & Functionality

### 1. Guest Users
**Purpose**: Allow browsing and basic ordering without registration

**Endpoints**:
- `GET /api/v1/public/restaurants` - Browse restaurants
- `GET /api/v1/public/menus` - Browse menus
- `POST /api/v1/guest/order` - Place guest order
- `GET /api/v1/guest/order/{id}/status` - Track order status

**Limitations**:
- No account features (loyalty, history)
- Limited to cash payments
- Session expires after 24 hours

### 2. Customer Users
**Purpose**: Registered customers with full platform access

**Core Functionality**:
- Complete profile management
- Order history and reordering
- Loyalty points and rewards
- Multiple payment methods
- Address book management
- Favorite restaurants tracking
- Review and rating system

**Key Endpoints**:
- `POST /api/v1/auth/register` - User registration
- `POST /api/v1/auth/login` - User login
- `POST /api/v1/client/order` - Place order
- `GET /api/v1/client/orders` - Order history
- `GET /api/v1/client/profile` - User profile
- `PUT /api/v1/client/profile` - Update profile
- `GET /api/v1/client/loyalty` - Loyalty points
- `POST /api/v1/client/review` - Submit review

### 3. Restaurant Owners
**Purpose**: Manage restaurant operations and menu

**Core Functionality**:
- Restaurant profile management
- Menu creation and updates
- Order management and status updates
- Earnings tracking and payouts
- Customer communication
- Analytics and reporting
- Document upload for verification

**Key Endpoints**:
- `POST /api/v1/restaurant/register` - Restaurant registration
- `GET /api/v1/restaurant/orders` - View orders
- `PUT /api/v1/restaurant/order/{id}/status` - Update order status
- `GET /api/v1/restaurant/menu` - Manage menu
- `POST /api/v1/restaurant/menu/item` - Add menu item
- `GET /api/v1/restaurant/analytics` - Business analytics
- `GET /api/v1/restaurant/earnings` - Earnings report

### 4. Delivery Drivers
**Purpose**: Handle order delivery and earnings

**Core Functionality**:
- Real-time order assignments
- GPS tracking and route optimization
- Earnings calculation and history
- Performance metrics
- Customer communication
- Document verification

**Key Endpoints**:
- `POST /api/v1/driver/register` - Driver registration
- `GET /api/v1/driver/orders` - Assigned orders
- `PUT /api/v1/driver/order/{id}/status` - Update delivery status
- `GET /api/v1/driver/location` - Current location
- `PUT /api/v1/driver/location` - Update location
- `GET /api/v1/driver/earnings` - Earnings history
- `GET /api/v1/driver/performance` - Performance metrics

### 5. Admin Users
**Purpose**: Platform management and oversight

**Core Functionality**:
- User management across all roles
- Platform analytics and reporting
- Payment gateway monitoring
- Content moderation
- System configuration
- Marketing campaign management
- Customer support oversight

**Key Endpoints**:
- `GET /api/v1/admin/users` - User management
- `GET /api/v1/admin/orders` - All orders overview
- `GET /api/v1/admin/analytics` - Platform analytics
- `GET /api/v1/admin/payments` - Payment monitoring
- `POST /api/v1/admin/marketing/campaign` - Create campaign
- `GET /api/v1/admin/reports` - Generate reports
- `PUT /api/v1/admin/system/config` - System configuration

## API Endpoints Summary

### Authentication & User Management
```
POST   /api/v1/auth/register           - User registration
POST   /api/v1/auth/login              - User login
POST   /api/v1/auth/refresh            - Refresh JWT token
POST   /api/v1/auth/logout             - User logout
POST   /api/v1/auth/forgot-password    - Password reset request
POST   /api/v1/auth/reset-password     - Reset password
GET    /api/v1/auth/me                 - Get current user
PUT    /api/v1/auth/profile            - Update profile
```

### Public Endpoints
```
GET    /api/v1/public/restaurants      - List restaurants
GET    /api/v1/public/restaurant/{id}  - Restaurant details
GET    /api/v1/public/menu/{id}        - Menu details
GET    /api/v1/public/search           - Search restaurants/menus
GET    /api/v1/public/categories       - Menu categories
```

### Customer Endpoints
```
POST   /api/v1/client/order            - Place new order
GET    /api/v1/client/orders           - Order history
GET    /api/v1/client/order/{id}       - Order details
PUT    /api/v1/client/order/{id}/cancel - Cancel order
GET    /api/v1/client/favorites        - Favorite restaurants
POST   /api/v1/client/favorite/{id}    - Add to favorites
GET    /api/v1/client/loyalty          - Loyalty points
GET    /api/v1/client/wallet           - Wallet balance
POST   /api/v1/client/review           - Submit review
```

### Restaurant Endpoints
```
GET    /api/v1/restaurant/orders       - Restaurant orders
PUT    /api/v1/restaurant/order/{id}   - Update order status
GET    /api/v1/restaurant/menu         - Restaurant menu
POST   /api/v1/restaurant/menu/item    - Add menu item
PUT    /api/v1/restaurant/menu/item/{id} - Update menu item
DELETE /api/v1/restaurant/menu/item/{id} - Delete menu item
GET    /api/v1/restaurant/analytics    - Restaurant analytics
GET    /api/v1/restaurant/earnings     - Earnings report
```

### Driver Endpoints
```
GET    /api/v1/driver/orders           - Assigned orders
PUT    /api/v1/driver/order/{id}/status - Update delivery status
GET    /api/v1/driver/earnings         - Earnings history
PUT    /api/v1/driver/location         - Update location
GET    /api/v1/driver/performance      - Performance metrics
```

### Admin Endpoints
```
GET    /api/v1/admin/dashboard         - Admin dashboard
GET    /api/v1/admin/users             - User management
GET    /api/v1/admin/orders            - All orders
GET    /api/v1/admin/restaurants       - Restaurant management
GET    /api/v1/admin/drivers           - Driver management
GET    /api/v1/admin/analytics         - Platform analytics
GET    /api/v1/admin/reports           - Generate reports
POST   /api/v1/admin/marketing/campaign - Create campaign
```

### Real-time WebSocket Events
```
Connection: ws://localhost:4000
Events:
- order:status_update     - Order status changes
- driver:location_update  - Driver location updates
- restaurant:new_order    - New order notifications
- chat:message            - Chat messages
- notification:new        - Push notifications
```

## Data Models

### User Model
```json
{
  "id": "uuid",
  "email": "string",
  "phone": "string",
  "firstName": "string",
  "lastName": "string",
  "role": "customer|restaurant_owner|delivery_agent|admin|guest",
  "status": "active|suspended|pending|inactive",
  "city": "Yaoundé|Douala|Bafoussam|Bamenda|Autre",
  "language": "fr|en",
  "loyalty_points": "integer",
  "total_orders": "integer",
  "total_spent": "decimal",
  "isGuest": "boolean",
  "createdAt": "datetime",
  "updatedAt": "datetime"
}
```

### Order Model
```json
{
  "id": "uuid",
  "customer_id": "uuid",
  "restaurant_id": "uuid",
  "driver_id": "uuid",
  "status": "created|confirmed|preparing|ready_for_pickup|in_transit|delivered|cancelled",
  "paymentMethod": "cash|noupay|campay|stripe|wallet",
  "paymentStatus": "pending|paid|failed|refunded",
  "subtotal": "decimal",
  "deliveryFee": "decimal",
  "total": "decimal",
  "currency": "XAF",
  "items": "json",
  "deliveryAddress": "string",
  "specialInstructions": "string",
  "estimatedDeliveryTime": "datetime",
  "createdAt": "datetime",
  "updatedAt": "datetime"
}
```

### Restaurant Model
```json
{
  "id": "uuid",
  "owner_id": "uuid",
  "name": "string",
  "description": "string",
  "address": "string",
  "phone": "string",
  "email": "string",
  "cuisine_type": "string",
  "isOpen": "boolean",
  "rating": "decimal",
  "total_orders": "integer",
  "delivery_time": "integer",
  "delivery_fee": "decimal",
  "minimum_order": "decimal",
  "location": "json",
  "operating_hours": "json",
  "createdAt": "datetime",
  "updatedAt": "datetime"
}
```

## Payment Integration

### Supported Gateways
1. **CamPay** - Mobile money (Cameroon)
2. **NouPay** - Mobile money (Cameroon)
3. **Stripe** - International card payments
4. **Cash on Delivery** - Traditional payment

### Payment Flow
1. Order placement with payment method selection
2. Payment initiation via selected gateway
3. Webhook confirmation from payment provider
4. Order status update based on payment result
5. Automated notifications to customer and restaurant

## Security Features

### Authentication
- JWT tokens with refresh mechanism
- Password hashing with Argon2id
- Two-factor authentication support
- Session management with Redis

### Authorization
- Role-based access control (RBAC)
- Route-level permissions
- API rate limiting
- CSRF protection

### Data Protection
- PII data scrubbing in logs
- Input sanitization and validation
- SQL injection prevention
- XSS protection

## Mobile Optimization

### Features
- Compressed responses for mobile networks
- Battery-aware polling intervals
- Offline queue for order placement
- GPS-optimized location updates
- Push notification support

### API Design
- RESTful endpoints with JSON responses
- Pagination for large datasets
- Filtering and sorting capabilities
- Consistent error response format
- Versioned API with backward compatibility

## Monitoring & Analytics

### System Monitoring
- Real-time performance metrics
- Error tracking and alerting
- Database connection monitoring
- Payment gateway health checks
- SMS provider failover monitoring

### Business Analytics
- Order volume and revenue tracking
- Customer behavior analysis
- Restaurant performance metrics
- Driver efficiency reports
- Geographic demand patterns

## Deployment & Scaling

### Development Environment
- SQLite database for quick setup
- In-memory caching
- Local file storage
- Development logging

### Production Environment
- PostgreSQL with connection pooling
- Redis for caching and sessions
- Cloud storage (AWS S3, Google Cloud Storage)
- Structured logging with ELK stack
- Docker containerization
- Kubernetes orchestration

## Error Handling

### HTTP Status Codes
- `200` - Success
- `201` - Created
- `400` - Bad Request
- `401` - Unauthorized
- `403` - Forbidden
- `404` - Not Found
- `409` - Conflict
- `422` - Validation Error
- `500` - Internal Server Error

### Error Response Format
```json
{
  "success": false,
  "error": "Error message",
  "code": "ERROR_CODE",
  "details": {},
  "timestamp": "2025-09-10T12:00:00Z"
}
```

## Testing

### Test Coverage
- Unit tests for all services
- Integration tests for API endpoints
- End-to-end tests for critical flows
- Performance testing for high-load scenarios

### Test Categories
- Authentication and authorization
- Order placement and management
- Payment processing
- Real-time features
- Mobile optimization
- Error scenarios

## Support & Maintenance

### Logging
- Structured logging with Winston
- Log rotation and archival
- Error tracking with correlation IDs
- Performance monitoring logs

### Backup & Recovery
- Automated database backups
- File storage backups
- Disaster recovery procedures
- Data retention policies

### Documentation Updates
- API documentation auto-generation
- Change logs for each version
- Migration guides
- Troubleshooting guides

---

## Quick Start Guide

### 1. Environment Setup
```bash
# Clone repository
git clone https://github.com/momogodi2000/eat-fast-backend-express-js.git
cd eat-fast-backend

# Install dependencies
npm install

# Copy environment file
cp .env.example .env

# Configure environment variables
# Edit .env with your API keys and database settings
```

### 2. Database Setup
```bash
# Run migrations
npm run migrate

# Seed database (optional)
npm run seed
```

### 3. Start Server
```bash
# Development mode
npm run dev

# Production mode
npm run build
npm start
```

### 4. Access API
- **API Base URL**: `http://localhost:4000/api/v1`
- **Documentation**: `http://localhost:4000/docs`
- **Health Check**: `http://localhost:4000/health`

### 5. Test API
```bash
# Test health endpoint
curl http://localhost:4000/health

# Test API documentation
curl http://localhost:4000/api-docs.json
```

## Contributing

### Development Workflow
1. Create feature branch from `main`
2. Implement changes with tests
3. Update documentation
4. Submit pull request
5. Code review and merge

### Code Standards
- ESLint configuration
- Prettier formatting
- Husky pre-commit hooks
- Conventional commit messages

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

- **Technical Support**: tech@eatfast.cm
- **Business Inquiries**: contact@eatfast.cm
- **Documentation**: https://docs.eatfast.cm

---

*Last updated: September 10, 2025*
*Version: 1.0.0*
- `POST /api/v1/client/addresses` - Add new address
- `PUT /api/v1/client/addresses/:id` - Update address
- `DELETE /api/v1/client/addresses/:id` - Delete address

**Order Management:**
- `POST /api/v1/client/orders` - Place new order
- `GET /api/v1/client/orders` - Get order history
- `GET /api/v1/client/orders/:id` - Get order details
- `PUT /api/v1/client/orders/:id/cancel` - Cancel order
- `POST /api/v1/client/orders/:id/review` - Rate and review order

**Cart Management:**
- `GET /api/v1/client/cart` - Get current cart
- `POST /api/v1/client/cart/items` - Add item to cart
- `PUT /api/v1/client/cart/items/:id` - Update cart item
- `DELETE /api/v1/client/cart/items/:id` - Remove cart item
- `DELETE /api/v1/client/cart` - Clear cart

**Payment & Wallet:**
- `GET /api/v1/client/wallet` - Get wallet balance
- `POST /api/v1/client/wallet/topup` - Add money to wallet
- `GET /api/v1/client/wallet/transactions` - Get transaction history
- `GET /api/v1/client/payment-methods` - Get saved payment methods
- `POST /api/v1/client/payment-methods` - Add payment method

**Loyalty & Referrals:**
- `GET /api/v1/client/loyalty-points` - Get loyalty points
- `POST /api/v1/client/referrals` - Send referral
- `GET /api/v1/client/referrals` - Get referral history

### 3. Restaurant Owners
Users who manage restaurants and process orders.

**Restaurant Management:**
- `GET /api/v1/restaurant/profile` - Get restaurant profile
- `PUT /api/v1/restaurant/profile` - Update restaurant info
- `POST /api/v1/restaurant/upload-images` - Upload restaurant images
- `GET /api/v1/restaurant/menu` - Get menu items
- `POST /api/v1/restaurant/menu` - Add menu item
- `PUT /api/v1/restaurant/menu/:id` - Update menu item
- `DELETE /api/v1/restaurant/menu/:id` - Delete menu item

**Order Management:**
- `GET /api/v1/restaurant/orders` - Get incoming orders
- `GET /api/v1/restaurant/orders/:id` - Get order details
- `PUT /api/v1/restaurant/orders/:id/accept` - Accept order
- `PUT /api/v1/restaurant/orders/:id/reject` - Reject order
- `PUT /api/v1/restaurant/orders/:id/ready` - Mark order ready
- `PUT /api/v1/restaurant/orders/:id/status` - Update order status

**Analytics & Reports:**
- `GET /api/v1/restaurant/analytics/sales` - Sales analytics
- `GET /api/v1/restaurant/analytics/popular-items` - Popular menu items
- `GET /api/v1/restaurant/reports/daily` - Daily reports
- `GET /api/v1/restaurant/reports/monthly` - Monthly reports

**Financial Management:**
- `GET /api/v1/restaurant/earnings` - Get earnings
- `GET /api/v1/restaurant/payouts` - Get payout history
- `POST /api/v1/restaurant/payout-request` - Request payout

### 4. Delivery Drivers
Users who deliver food orders.

**Driver Management:**
- `GET /api/v1/driver/profile` - Get driver profile
- `PUT /api/v1/driver/profile` - Update driver info
- `POST /api/v1/driver/documents` - Upload required documents
- `GET /api/v1/driver/status` - Get approval status

**Delivery Management:**
- `GET /api/v1/driver/available-orders` - Get available deliveries
- `POST /api/v1/driver/accept-order/:id` - Accept delivery
- `PUT /api/v1/driver/location` - Update current location
- `PUT /api/v1/driver/orders/:id/pickup` - Mark order picked up
- `PUT /api/v1/driver/orders/:id/deliver` - Mark order delivered
- `GET /api/v1/driver/orders/current` - Get current deliveries

**Earnings & Reports:**
- `GET /api/v1/driver/earnings` - Get earnings
- `GET /api/v1/driver/trips` - Get trip history
- `GET /api/v1/driver/reports/daily` - Daily reports

### 5. Admin Users
Platform administrators with full system access.

**User Management:**
- `GET /api/v1/admin/users` - List all users
- `GET /api/v1/admin/users/:id` - Get user details
- `PUT /api/v1/admin/users/:id` - Update user
- `DELETE /api/v1/admin/users/:id` - Delete user
- `PUT /api/v1/admin/users/:id/status` - Change user status

**Restaurant Management:**
- `GET /api/v1/admin/restaurants` - List all restaurants
- `POST /api/v1/admin/restaurants` - Create restaurant
- `PUT /api/v1/admin/restaurants/:id` - Update restaurant
- `PUT /api/v1/admin/restaurants/:id/approve` - Approve restaurant
- `PUT /api/v1/admin/restaurants/:id/suspend` - Suspend restaurant

**Order Management:**
- `GET /api/v1/admin/orders` - List all orders
- `GET /api/v1/admin/orders/statistics` - Order statistics
- `PUT /api/v1/admin/orders/:id` - Update order
- `POST /api/v1/admin/orders/:id/refund` - Process refund

**System Analytics:**
- `GET /api/v1/admin/analytics/platform` - Platform analytics
- `GET /api/v1/admin/analytics/revenue` - Revenue analytics
- `GET /api/v1/admin/analytics/users` - User analytics
- `GET /api/v1/admin/reports/financial` - Financial reports

**Support & Messaging:**
- `GET /api/v1/admin/support/tickets` - Get support tickets
- `PUT /api/v1/admin/support/tickets/:id` - Update ticket
- `POST /api/v1/admin/messaging/broadcast` - Send broadcast message
- `GET /api/v1/admin/messaging/templates` - Get message templates

## Data Models

### User
```json
{
  "id": "uuid",
  "email": "string",
  "name": "string",
  "phone": "string",
  "role": "client|restaurant|driver|admin",
  "isActive": "boolean",
  "emailVerified": "boolean",
  "createdAt": "datetime",
  "updatedAt": "datetime"
}
```

### Restaurant
```json
{
  "id": "uuid",
  "name": "string",
  "description": "string",
  "address": "string",
  "coordinates": {"lat": "number", "lng": "number"},
  "cuisineType": "string",
  "isOpen": "boolean",
  "deliveryTime": "number",
  "rating": "number",
  "totalOrders": "number",
  "images": ["string"],
  "createdAt": "datetime"
}
```

### Menu Item
```json
{
  "id": "uuid",
  "restaurantId": "uuid",
  "name": "string",
  "description": "string",
  "price": "number",
  "currency": "XAF",
  "category": "string",
  "isAvailable": "boolean",
  "images": ["string"],
  "preparationTime": "number"
}
```

### Order
```json
{
  "id": "uuid",
  "customerId": "uuid",
  "restaurantId": "uuid",
  "driverId": "uuid",
  "status": "created|accepted|preparing|ready|picked_up|delivered|cancelled",
  "items": [{"menuItemId": "uuid", "quantity": "number", "price": "number"}],
  "subtotal": "number",
  "deliveryFee": "number",
  "total": "number",
  "currency": "XAF",
  "deliveryAddress": "string",
  "paymentMethod": "string",
  "paymentStatus": "pending|completed|failed",
  "createdAt": "datetime",
  "estimatedDeliveryTime": "datetime"
}
```

## Error Handling

### Standard Error Response
```json
{
  "success": false,
  "error": "Error message",
  "code": "ERROR_CODE",
  "details": "Additional error details"
}
```

### Common HTTP Status Codes
- `200 OK` - Request successful
- `201 Created` - Resource created
- `400 Bad Request` - Invalid request data
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Access denied
- `404 Not Found` - Resource not found
- `422 Unprocessable Entity` - Validation failed
- `500 Internal Server Error` - Server error

## Rate Limiting
- **General API**: 100 requests per minute per IP
- **Authentication**: 5 requests per minute per IP
- **Order Placement**: 10 requests per minute per user

## Webhooks
The system supports webhooks for real-time notifications:
- Order status updates
- Payment confirmations
- Delivery updates

## SDK & Integration
- **Mobile Apps**: Flutter SDK available
- **Web Apps**: JavaScript SDK available
- **Postman Collection**: Available for testing

## Support
For API support, contact:
- **Email**: api-support@eatfast.cm
- **Documentation**: https://docs.eatfast.cm
- **Status Page**: https://status.eatfast.cm

---
*Last Updated: September 10, 2025*
*API Version: 1.0.0*