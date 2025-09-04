# EatFast Backend API Specification

## Overview
This document provides a comprehensive specification for building the backend API for the EatFast food delivery application using Express.js and SQLite. The backend needs to support a multi-role architecture with customers, restaurant owners, drivers, and administrators.

## Technology Stack
- **Framework**: Express.js with TypeScript
- **Database**: SQLite with better-sqlite3
- **Authentication**: JWT with refresh tokens
- **Real-time**: Socket.IO for live updates
- **File Storage**: Local file system (can be upgraded to cloud storage)
- **Payment**: Integration with Mobile Money APIs (MTN, Orange, EU Mobile)

## Database Schema

### Core Tables

#### Users Table
```sql
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE,
    password_hash TEXT NOT NULL,
    full_name TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('customer', 'restaurant_owner', 'driver', 'admin')),
    avatar_url TEXT,
    is_email_verified BOOLEAN DEFAULT FALSE,
    is_phone_verified BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    device_fingerprint TEXT,
    last_login_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

#### Addresses Table
```sql
CREATE TABLE addresses (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    landmark TEXT,
    latitude REAL,
    longitude REAL,
    is_default BOOLEAN DEFAULT FALSE,
    type TEXT DEFAULT 'other' CHECK (type IN ('home', 'work', 'other')),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

#### Restaurants Table
```sql
CREATE TABLE restaurants (
    id TEXT PRIMARY KEY,
    owner_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    image_url TEXT,
    phone_number TEXT,
    is_open BOOLEAN DEFAULT TRUE,
    rating REAL DEFAULT 0.0,
    review_count INTEGER DEFAULT 0,
    estimated_delivery_time INTEGER DEFAULT 30,
    delivery_fee REAL DEFAULT 0.0,
    price_range TEXT DEFAULT 'moderate',
    street TEXT NOT NULL,
    city TEXT NOT NULL,
    district TEXT,
    postal_code TEXT,
    latitude REAL,
    longitude REAL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE
);
```

#### Menu Categories Table
```sql
CREATE TABLE menu_categories (
    id TEXT PRIMARY KEY,
    restaurant_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    image_url TEXT,
    sort_order INTEGER DEFAULT 0,
    is_available BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);
```

#### Menu Items Table
```sql
CREATE TABLE menu_items (
    id TEXT PRIMARY KEY,
    restaurant_id TEXT NOT NULL,
    category_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    price REAL NOT NULL,
    image_url TEXT,
    is_available BOOLEAN DEFAULT TRUE,
    preparation_time INTEGER DEFAULT 15,
    calories REAL,
    nutritional_info TEXT,
    is_popular BOOLEAN DEFAULT FALSE,
    is_recommended BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES menu_categories(id) ON DELETE CASCADE
);
```

#### Menu Item Customizations Table
```sql
CREATE TABLE menu_item_customizations (
    id TEXT PRIMARY KEY,
    menu_item_id TEXT NOT NULL,
    name TEXT NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('single', 'multiple', 'quantity')),
    is_required BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id) ON DELETE CASCADE
);
```

#### Customization Options Table
```sql
CREATE TABLE customization_options (
    id TEXT PRIMARY KEY,
    customization_id TEXT NOT NULL,
    name TEXT NOT NULL,
    additional_price REAL DEFAULT 0.0,
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (customization_id) REFERENCES menu_item_customizations(id) ON DELETE CASCADE
);
```

#### Orders Table
```sql
CREATE TABLE orders (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    restaurant_id TEXT NOT NULL,
    driver_id TEXT,
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'preparing', 'ready', 'picked_up', 'on_the_way', 'delivered', 'cancelled', 'refunded')),
    subtotal REAL NOT NULL,
    delivery_fee REAL NOT NULL,
    tax REAL DEFAULT 0.0,
    discount REAL DEFAULT 0.0,
    total REAL NOT NULL,
    delivery_address TEXT NOT NULL,
    delivery_latitude REAL,
    delivery_longitude REAL,
    payment_method TEXT NOT NULL,
    special_instructions TEXT,
    estimated_delivery_time DATETIME,
    actual_delivery_time DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    FOREIGN KEY (driver_id) REFERENCES users(id)
);
```

#### Order Items Table
```sql
CREATE TABLE order_items (
    id TEXT PRIMARY KEY,
    order_id TEXT NOT NULL,
    menu_item_id TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    total_price REAL NOT NULL,
    customizations TEXT, -- JSON string of selected customizations
    special_instructions TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);
```

#### Order Status Updates Table
```sql
CREATE TABLE order_status_updates (
    id TEXT PRIMARY KEY,
    order_id TEXT NOT NULL,
    status TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    message TEXT,
    updated_by TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (updated_by) REFERENCES users(id)
);
```

#### Ratings and Reviews Table
```sql
CREATE TABLE ratings_reviews (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    restaurant_id TEXT,
    driver_id TEXT,
    order_id TEXT,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (driver_id) REFERENCES users(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
```

#### Payment Methods Table
```sql
CREATE TABLE payment_methods (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('mobile_money_mtn', 'mobile_money_orange', 'mobile_money_eu', 'cash', 'card')),
    provider TEXT, -- MTN, Orange, EU Mobile
    account_number TEXT,
    account_name TEXT,
    is_default BOOLEAN DEFAULT FALSE,
    is_verified BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

#### Favorites Table
```sql
CREATE TABLE favorites (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    restaurant_id TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    UNIQUE(user_id, restaurant_id)
);
```

#### Promotions Table
```sql
CREATE TABLE promotions (
    id TEXT PRIMARY KEY,
    code TEXT UNIQUE NOT NULL,
    description TEXT,
    discount_type TEXT NOT NULL CHECK (discount_type IN ('percentage', 'fixed')),
    discount_value REAL NOT NULL,
    minimum_order REAL DEFAULT 0.0,
    maximum_discount REAL,
    is_active BOOLEAN DEFAULT TRUE,
    valid_from DATETIME,
    valid_until DATETIME,
    usage_limit INTEGER,
    usage_count INTEGER DEFAULT 0,
    applicable_restaurants TEXT, -- JSON array of restaurant IDs
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

## API Endpoints

### Authentication Endpoints

#### POST /api/auth/register
Register a new user
```json
{
  "email": "user@example.com",
  "phone": "+237xxxxxxxxx",
  "password": "password123",
  "fullName": "John Doe",
  "role": "customer"
}
```

#### POST /api/auth/login
Login user
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

#### POST /api/auth/refresh
Refresh access token
```json
{
  "refreshToken": "refresh_token_here"
}
```

#### POST /api/auth/logout
Logout user

#### POST /api/auth/forgot-password
Request password reset
```json
{
  "email": "user@example.com"
}
```

#### POST /api/auth/verify-otp
Verify OTP for phone/email verification
```json
{
  "phone": "+237xxxxxxxxx",
  "otp": "123456"
}
```

### User Management Endpoints

#### GET /api/users/profile
Get current user profile

#### PUT /api/users/profile
Update user profile
```json
{
  "fullName": "Updated Name",
  "phone": "+237xxxxxxxxx",
  "avatarUrl": "https://example.com/avatar.jpg"
}
```

#### POST /api/users/addresses
Add new address
```json
{
  "name": "Home",
  "address": "123 Main St, Yaounde",
  "latitude": 3.8667,
  "longitude": 11.5167,
  "isDefault": true,
  "type": "home"
}
```

#### GET /api/users/addresses
Get user addresses

#### PUT /api/users/addresses/:id
Update address

#### DELETE /api/users/addresses/:id
Delete address

### Restaurant Endpoints

#### GET /api/restaurants
Get restaurants with filters
Query params: search, cuisine, rating, deliveryTime, deliveryFee, sortBy, sortOrder

#### GET /api/restaurants/:id
Get restaurant details

#### POST /api/restaurants (Restaurant Owner only)
Create restaurant
```json
{
  "name": "Restaurant Name",
  "description": "Description",
  "phoneNumber": "+237xxxxxxxxx",
  "street": "123 Main St",
  "city": "Yaounde",
  "latitude": 3.8667,
  "longitude": 11.5167
}
```

#### PUT /api/restaurants/:id (Owner only)
Update restaurant

#### GET /api/restaurants/:id/menu
Get restaurant menu

#### POST /api/restaurants/:id/menu/categories (Owner only)
Add menu category
```json
{
  "name": "Main Courses",
  "description": "Main dishes",
  "sortOrder": 1
}
```

#### POST /api/restaurants/:id/menu/items (Owner only)
Add menu item
```json
{
  "categoryId": "category_id",
  "name": "Pizza Margherita",
  "description": "Classic pizza",
  "price": 15000,
  "imageUrl": "https://example.com/pizza.jpg",
  "preparationTime": 20
}
```

### Order Endpoints

#### POST /api/orders
Create new order
```json
{
  "restaurantId": "restaurant_id",
  "items": [
    {
      "menuItemId": "item_id",
      "quantity": 2,
      "customizations": [
        {
          "customizationId": "customization_id",
          "optionId": "option_id"
        }
      ]
    }
  ],
  "deliveryAddressId": "address_id",
  "paymentMethodId": "payment_id",
  "specialInstructions": "Extra spicy"
}
```

#### GET /api/orders
Get user orders

#### GET /api/orders/:id
Get order details

#### PUT /api/orders/:id/status (Restaurant/Driver/Admin only)
Update order status
```json
{
  "status": "preparing",
  "message": "Your order is being prepared"
}
```

#### POST /api/orders/:id/cancel
Cancel order

#### POST /api/orders/:id/rate
Rate and review order
```json
{
  "restaurantRating": 5,
  "driverRating": 4,
  "restaurantComment": "Great food!",
  "driverComment": "Fast delivery"
}
```

### Driver Endpoints

#### GET /api/drivers/orders/available
Get available orders for pickup

#### PUT /api/drivers/orders/:id/accept
Accept delivery order

#### PUT /api/drivers/status
Update driver status
```json
{
  "isOnline": true,
  "currentLatitude": 3.8667,
  "currentLongitude": 11.5167
}
```

#### GET /api/drivers/earnings
Get driver earnings

### Admin Endpoints

#### GET /api/admin/dashboard
Get admin dashboard stats

#### GET /api/admin/users
Get all users with filters

#### PUT /api/admin/users/:id/status
Update user status

#### GET /api/admin/orders
Get all orders

#### GET /api/admin/restaurants
Get all restaurants

#### POST /api/admin/promotions
Create promotion
```json
{
  "code": "WELCOME10",
  "description": "10% off first order",
  "discountType": "percentage",
  "discountValue": 10,
  "minimumOrder": 5000,
  "validUntil": "2024-12-31T23:59:59Z"
}
```

### Payment Endpoints

#### POST /api/payments/mobile-money/initiate
Initiate mobile money payment
```json
{
  "orderId": "order_id",
  "provider": "mtn",
  "phoneNumber": "+237xxxxxxxxx",
  "amount": 15000
}
```

#### POST /api/payments/mobile-money/verify
Verify payment status

#### GET /api/payments/methods
Get user payment methods

#### POST /api/payments/methods
Add payment method

### Real-time Events (Socket.IO)

#### Order Status Updates
```javascript
socket.emit('join-order', orderId);
socket.on('order-status-update', (data) => {
  // Handle status update
});
```

#### Driver Location Updates
```javascript
socket.emit('driver-location-update', {
  orderId: orderId,
  latitude: lat,
  longitude: lng
});
```

#### Chat Messages
```javascript
socket.emit('send-message', {
  orderId: orderId,
  message: message,
  senderId: userId
});
```

## Middleware

### Authentication Middleware
```typescript
const authenticate = (req: Request, res: Response, next: Function) => {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'No token provided' });
  
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET!);
    req.user = decoded;
    next();
  } catch (error) {
    res.status(401).json({ error: 'Invalid token' });
  }
};
```

### Role-based Authorization Middleware
```typescript
const authorize = (...roles: string[]) => {
  return (req: Request, res: Response, next: Function) => {
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({ error: 'Insufficient permissions' });
    }
    next();
  };
};
```

### Rate Limiting Middleware
```typescript
const rateLimit = require('express-rate-limit');
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});
```

## File Upload Configuration

### Multer Configuration
```typescript
const multer = require('multer');
const storage = multer.diskStorage({
  destination: (req: Request, file: Express.Multer.File, cb: Function) => {
    cb(null, 'uploads/');
  },
  filename: (req: Request, file: Express.Multer.File, cb: Function) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
  }
});

const upload = multer({ 
  storage: storage,
  limits: { fileSize: 5 * 1024 * 1024 }, // 5MB limit
  fileFilter: (req: Request, file: Express.Multer.File, cb: Function) => {
    if (file.mimetype.startsWith('image/')) {
      cb(null, true);
    } else {
      cb(new Error('Only image files are allowed!'));
    }
  }
});
```

## Environment Variables

```env
NODE_ENV=development
PORT=3000
JWT_SECRET=your_jwt_secret_here
JWT_REFRESH_SECRET=your_refresh_secret_here
DATABASE_URL=./database.sqlite
UPLOAD_PATH=./uploads
GOOGLE_MAPS_API_KEY=your_google_maps_key
FIREBASE_SERVER_KEY=your_firebase_key
MTN_API_KEY=your_mtn_api_key
ORANGE_API_KEY=your_orange_api_key
EU_MOBILE_API_KEY=your_eu_mobile_api_key
STRIPE_SECRET_KEY=your_stripe_key
```

## Project Structure

```
eatfast-backend/
├── src/
│   ├── config/
│   │   ├── database.ts
│   │   └── environment.ts
│   ├── controllers/
│   │   ├── authController.ts
│   │   ├── userController.ts
│   │   ├── restaurantController.ts
│   │   ├── orderController.ts
│   │   ├── driverController.ts
│   │   └── adminController.ts
│   ├── middleware/
│   │   ├── auth.ts
│   │   ├── validation.ts
│   │   └── upload.ts
│   ├── models/
│   │   ├── User.ts
│   │   ├── Restaurant.ts
│   │   ├── Order.ts
│   │   └── index.ts
│   ├── routes/
│   │   ├── auth.ts
│   │   ├── users.ts
│   │   ├── restaurants.ts
│   │   ├── orders.ts
│   │   └── index.ts
│   ├── services/
│   │   ├── authService.ts
│   │   ├── paymentService.ts
│   │   ├── notificationService.ts
│   │   └── socketService.ts
│   ├── utils/
│   │   ├── helpers.ts
│   │   ├── validation.ts
│   │   └── responses.ts
│   ├── app.ts
│   └── server.ts
├── uploads/
├── database.sqlite
├── package.json
├── tsconfig.json
└── README.md
```

## Package Dependencies

```json
{
  "name": "eatfast-backend",
  "version": "1.0.0",
  "description": "Backend API for EatFast food delivery app",
  "main": "dist/server.js",
  "scripts": {
    "start": "node dist/server.js",
    "dev": "ts-node-dev --respawn --transpile-only src/server.ts",
    "build": "tsc",
    "test": "jest",
    "migrate": "ts-node src/scripts/migrate.ts"
  },
  "dependencies": {
    "express": "^4.18.2",
    "better-sqlite3": "^8.7.0",
    "jsonwebtoken": "^9.0.2",
    "bcryptjs": "^2.4.3",
    "socket.io": "^4.7.2",
    "multer": "^1.4.5-lts.1",
    "express-rate-limit": "^6.10.0",
    "helmet": "^7.0.0",
    "cors": "^2.8.5",
    "dotenv": "^16.3.1",
    "uuid": "^9.0.1",
    "axios": "^1.5.0",
    "firebase-admin": "^11.11.0",
    "stripe": "^13.0.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.17",
    "@types/better-sqlite3": "^7.6.8",
    "@types/jsonwebtoken": "^9.0.3",
    "@types/bcryptjs": "^2.4.6",
    "@types/multer": "^1.4.8",
    "@types/uuid": "^9.0.4",
    "@types/cors": "^2.8.13",
    "@types/node": "^20.6.3",
    "typescript": "^5.2.2",
    "ts-node-dev": "^2.0.0",
    "jest": "^29.6.4",
    "supertest": "^6.3.3"
  }
}
```

## Implementation Notes

1. **Database Initialization**: Create all tables on startup
2. **Seed Data**: Add initial data for testing (users, restaurants, menu items)
3. **Error Handling**: Implement comprehensive error handling with proper HTTP status codes
4. **Logging**: Add request/response logging
5. **Testing**: Implement unit and integration tests
6. **Documentation**: Use Swagger/OpenAPI for API documentation
7. **Security**: Implement input validation, SQL injection prevention, XSS protection
8. **Performance**: Add database indexes, caching, and optimization
9. **Monitoring**: Add health checks and metrics endpoints

This specification provides a solid foundation for building the EatFast backend API. The implementation should follow RESTful principles, include proper error handling, and support all the features required by the mobile application.</content>
<parameter name="filePath">E:\Eat Fast App\eatfast-mobile\BACKEND_SPECIFICATION.md
