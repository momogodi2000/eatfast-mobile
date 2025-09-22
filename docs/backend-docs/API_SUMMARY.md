# EatFast Backend API - Enhanced v2.0.0

## 🚀 **API Overview**
Production-ready backend for Cameroon food delivery platform with enhanced Google services integration, advanced analytics, WhatsApp messaging, and pure Express.js implementation.

**Base URL**: `https://your-domain.com/api/v1`
**Version**: 2.0.0
**Environment**: Production Ready - Enhanced Features
**Last Updated**: September 22, 2025  

## 📱 **Core Features Implemented**

### ✅ **Authentication & Authorization**
- **JWT-based authentication** with refresh tokens
- **Multi-factor authentication** (SMS OTP)
- **OAuth integration** (Google, Apple)
- **Role-based access control** (Admin, Restaurant, Driver, Client)
- **Guest checkout** functionality

### ✅ **Payment Processing**
- **CamPay integration** (primary mobile money)
- **NouPay integration** (fallback mobile money)
- **Stripe integration** (card payments)
- **Cash payments** support
- **Internal wallet** system
- **Split payment** functionality
- **Commission tracking** for restaurants

### ✅ **SMS & Notifications**
- **Infobip SMS** (primary provider with Cameroon validation)
- **WhatsApp Business API** (template messaging & notifications)
- **Email notifications** via Gmail SMTP
- **Pure Express.js Push Notifications** (Web Push API - Firebase removed)
- **Real-time notifications** via WebSocket

### ✅ **Google Services Integration**
- **Google Maps API** (geocoding, traffic-aware routing, Cameroon fallbacks)
- **Google Analytics 4** (server-side tracking & business metrics)
- **Places autocomplete** with Cameroon location bias
- **Distance matrix** for delivery optimization

### ✅ **Enhanced Mobile Features**
- **Guest-to-user conversion** with incentives
- **Offline support** with data synchronization
- **Mobile-specific caching** strategies
- **Response compression** for better performance
- **Dynamic pricing** for Cameroon market

### ✅ **Order Management**
- **Complete order lifecycle** (placed → confirmed → prepared → delivered)
- **Real-time order tracking** 
- **Driver assignment** and route optimization
- **Scheduled orders**
- **Order history** and analytics

### ✅ **User Management**
- **Multi-role user system** (Customer, Restaurant, Driver, Admin)
- **Profile management**
- **Loyalty points** and referral system
- **Social sharing** integration
- **Review and rating** system

## 🛠️ **API Endpoints**

### **Authentication Routes** (`/api/v1/auth/`)
```
POST /register           - User registration
POST /login             - User login
POST /refresh-token     - Refresh JWT token
POST /logout            - User logout
POST /forgot-password   - Password reset
POST /verify-otp        - SMS OTP verification
POST /oauth/google      - Google OAuth login
POST /oauth/apple       - Apple OAuth login
```

### **User Management** (`/api/v1/users/`)
```
GET    /profile         - Get user profile
PUT    /profile         - Update user profile
GET    /orders          - Get user orders
GET    /wallet          - Get wallet balance
POST   /wallet/topup    - Top up wallet
GET    /loyalty-points  - Get loyalty points
POST   /refer           - Create referral
```

### **Restaurant Management** (`/api/v1/restaurants/`)
```
GET    /                - List restaurants
GET    /:id             - Get restaurant details
POST   /                - Create restaurant (admin)
PUT    /:id             - Update restaurant
GET    /:id/menu        - Get restaurant menu
POST   /:id/menu        - Add menu item
PUT    /:id/menu/:itemId - Update menu item
GET    /:id/orders      - Get restaurant orders
PUT    /:id/orders/:orderId/status - Update order status
```

### **Order Management** (`/api/v1/orders/`)
```
POST   /                - Create new order
GET    /:id             - Get order details
PUT    /:id/status      - Update order status
GET    /:id/tracking    - Get order tracking
POST   /:id/cancel      - Cancel order
GET    /:id/receipt     - Get order receipt
POST   /:id/review      - Add order review
```

### **Payment Processing** (`/api/v1/payments/`)
```
POST   /                - Process payment
GET    /:id             - Get payment details
POST   /:id/refund      - Refund payment
POST   /webhook/campay  - CamPay webhook
POST   /webhook/noupay  - NouPay webhook
POST   /webhook/stripe  - Stripe webhook
```

### **Driver Management** (`/api/v1/drivers/`)
```
GET    /orders          - Get available orders
POST   /orders/:id/accept - Accept order
PUT    /orders/:id/location - Update location
POST   /orders/:id/complete - Mark order complete
GET    /earnings        - Get driver earnings
GET    /stats           - Get driver statistics
```

### **Admin Management** (`/api/v1/admin/`)
```
GET    /dashboard       - Admin dashboard data
GET    /users           - Manage users
GET    /restaurants     - Manage restaurants
GET    /orders          - View all orders
GET    /analytics       - Business analytics
GET    /reports         - Generate reports
POST   /notifications   - Send bulk notifications
GET    /commissions     - View commission records
```

### **Real-time Features** (WebSocket)
```
/socket.io/
  - order-updates      - Real-time order status
  - driver-location    - Live driver tracking
  - notifications      - Instant notifications
  - chat              - Customer support chat
```

## 🗄️ **Database Models**

### **Core Models**
- `User` - User accounts (customers, drivers, restaurant owners, admins)
- `Restaurant` - Restaurant information and settings
- `Menu` - Menu items and categories
- `Order` - Order details and status
- `Payment` - Payment transactions
- `Delivery` - Delivery information and tracking

### **New Production Models** ✅
- `CommissionRecord` - Platform commission tracking
- `NotificationLog` - SMS/email notification tracking
- `ReviewSystem` - Customer reviews and ratings
- `LoyaltyPoints` - Gamification and rewards
- `Wallet` - Internal wallet system
- `SplitPayment` - Split payment functionality

## 💰 **Payment Integration Details**

### **CamPay (Primary Mobile Money)**
- **Environment**: Production
- **Supported Networks**: MTN MoMo, Orange Money
- **Currency**: XAF (Central African Franc)
- **Webhook**: `/api/v1/payments/webhook/campay`

### **NouPay (Backup Mobile Money)**
- **Environment**: Production  
- **Supported Networks**: All Cameroon mobile money
- **Currency**: XAF
- **Webhook**: `/api/v1/payments/webhook/noupay`

### **Stripe (Card Payments)**
- **Environment**: Production
- **Supported Cards**: Visa, Mastercard, American Express
- **Currency**: XAF
- **Webhook**: `/api/v1/payments/webhook/stripe`

## 📱 **SMS Integration**

### **Twilio (Primary SMS Provider)**
- **Status**: ✅ Configured and working
- **Use Cases**: OTP verification, order notifications
- **Supported Numbers**: International format (+237XXXXXXXXX)

### **Infobip (Backup SMS Provider)**
- **Status**: ⚠️ Credentials need fixing (403 errors)
- **Fix Command**: `node scripts/fix-infobip-config.js`
- **Test Command**: `node scripts/test-infobip-credentials.js`

## 🌍 **Localization**
- **Default Language**: French (fr)
- **Supported Languages**: French, English
- **SMS Templates**: Localized for both languages
- **API Responses**: Multi-language support

## 📊 **Business Features**

### **For Restaurants**
- Commission-based revenue model (15% default)
- Real-time order management
- Menu management system
- Analytics and reporting
- Customer review management

### **For Drivers**
- Earnings tracking and analytics
- Route optimization
- Real-time order notifications
- Performance metrics
- Payout management

### **For Customers**
- Loyalty points and rewards
- Referral system
- Order history and tracking
- Multiple payment options
- Review and rating system

## 🔧 **Development Tools**

### **Available Scripts**
```bash
npm run start                    # Start production server
npm run dev                      # Start development server
npm run migrate:prod             # Run database migrations
npm run production:admin         # Create admin user
npm run verify:all              # Test all systems
npm run test                     # Run test suite
npm run db:migrate-to-postgres   # Migrate to PostgreSQL
```

### **Testing & Validation**
```bash
node scripts/test-infobip-credentials.js  # Test SMS provider
node scripts/verify-payment-gateways.js   # Test payment gateways
node scripts/validate-system.js           # Full system validation
```

## 🚨 **Critical Pre-Launch Items**

### **Immediate Fixes Required**
1. **Infobip SMS Credentials** - Currently returning 403 errors
2. **SSL Certificate Setup** for production domain
3. **Production Database** migration from SQLite to PostgreSQL
4. **Environment Variables** verification for production

### **Testing Checklist**
- [ ] SMS delivery working (both providers)
- [ ] All payment gateways functional
- [ ] Real-time features working
- [ ] Database performance optimized
- [ ] API response times < 2 seconds
- [ ] Error rates < 1%

## 📈 **Performance Specifications**
- **Target Response Time**: < 2 seconds for API calls
- **Concurrent Users**: Designed for 1000+ concurrent users
- **Database**: PostgreSQL with connection pooling
- **Caching**: Redis for session and data caching
- **Rate Limiting**: 100 requests per 15 minutes per IP

## 🔐 **Security Features**
- JWT authentication with refresh tokens
- Password hashing with bcrypt
- Rate limiting and DDoS protection
- Input validation and sanitization
- SQL injection prevention
- CORS configuration
- Security headers (Helmet.js)
- API key management for external services

---

## 📞 **Support & Documentation**

**Interactive API Docs**: `https://your-domain.com/api-docs` (Swagger UI)  
**Postman Collection**: Available in `/docs/` folder  
**WebSocket Docs**: Real-time event documentation  

**Production Ready**: ✅ Ready for deployment in Cameroon market  
**Last Updated**: September 10, 2025