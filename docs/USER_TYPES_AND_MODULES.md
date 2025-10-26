# EatFast Mobile App - User Types and Modules Documentation

## Table of Contents
1. [User Types Overview](#user-types-overview)
2. [Customer Module (Client Module)](#customer-module-client-module)
3. [Restaurant Manager Module](#restaurant-manager-module)
4. [Driver Module](#driver-module)
5. [Admin Module](#admin-module)
6. [Guest Module](#guest-module)
7. [Shared Services](#shared-services)
8. [Module Dependencies](#module-dependencies)

---

## User Types Overview

The EatFast mobile application supports **5 distinct user types**, each with specific roles, permissions, and functionality:

### 1. **Customer (Client)**
- **Role**: `customer`
- **Status**: `active`, `inactive`, `suspended`, `pending`
- **Description**: End users who order food from restaurants
- **Primary Functions**: Browse restaurants, place orders, track deliveries, manage profile

### 2. **Restaurant Owner**
- **Role**: `restaurant_owner`
- **Status**: `active`, `inactive`, `pending_verification`, `rejected`, `suspended`, `closed_temporarily`, `closed_permanently`
- **Description**: Restaurant owners who manage their business on the platform
- **Primary Functions**: Manage menu, handle orders, view analytics, manage restaurant profile

### 3. **Delivery Driver**
- **Role**: `delivery_agent` / `driver`
- **Status**: `active`, `inactive`, `pending_verification`, `rejected`, `suspended`, `documents_required`
- **Description**: Independent contractors who deliver orders to customers
- **Primary Functions**: Accept delivery requests, navigate to locations, complete deliveries

### 4. **Administrator**
- **Role**: `admin`
- **Status**: `active`, `inactive`, `suspended`
- **Description**: Platform administrators who manage the entire system
- **Primary Functions**: User management, restaurant approval, system monitoring, financial oversight

### 5. **Guest User**
- **Role**: `guest`
- **Status**: `temporary`
- **Description**: Unregistered users who can browse and order without account
- **Primary Functions**: Browse restaurants, place guest orders, convert to registered user

---

## Customer Module (Client Module)

### Overview
The Customer Module provides all functionality for registered customers to browse restaurants, place orders, and manage their account.

### Module Structure
```
lib/modules/client_module/
├── providers/           # State management and data providers
├── screens/            # UI screens for customer functionality
├── services/           # API services and data repositories
└── widgets/            # Reusable UI components
```

### Core Screens and Functionality

#### 1. **Home Screen** (`home_screen.dart`)
- **Purpose**: Main dashboard for customers
- **Features**:
  - Bottom navigation (Home, Restaurants, Orders, Profile)
  - Active order tracking
  - Popular restaurants section
  - Featured dishes section
  - Quick access to favorites and history
- **Navigation**: IndexedStack with 4 main sections

#### 2. **Client Dashboard** (`client_dashboard_screen.dart`)
- **Purpose**: Comprehensive customer dashboard
- **Features**:
  - User profile summary
  - Loyalty points display
  - Wallet balance
  - Recent orders
  - Quick action buttons:
    - Explorer (Browse restaurants)
    - Favorites
    - Order history
    - Address management
    - Payment methods
    - Loyalty program
- **Data Integration**: Loyalty provider, wallet provider, orders provider

#### 3. **Profile Management** (`profile/`)
- **Profile Screen** (`profile_screen.dart`):
  - Personal information display
  - Account settings
  - Preferences management
  - Security settings
- **Edit Profile** (`edit_profile_screen.dart`):
  - Update personal information
  - Change profile picture
  - Update contact details
- **Address Management** (`address_management_screen.dart`):
  - Add/edit delivery addresses
  - Set default address
  - Location-based address suggestions
- **Payment Methods** (`payment_methods_screen.dart`):
  - Add/remove payment methods
  - Set default payment
  - Manage saved cards

#### 4. **Order Management** (`orders/`)
- **Order History** (`order_history_screen.dart`):
  - View past orders
  - Order status tracking
  - Reorder functionality
  - Order details and receipts
- **Order Tracking**: Real-time order status updates

#### 5. **Loyalty Program** (`loyalty/`)
- **Loyalty Screen** (`loyalty_screen.dart`):
  - Points balance
  - Rewards catalog
  - Points history
  - Tier benefits
  - Referral program

#### 6. **Wallet Management** (`wallet/`)
- **Wallet Screen** (`wallet_screen.dart`):
  - Balance display
  - Transaction history
  - Top-up options
  - Withdrawal requests

#### 7. **Favorites** (`favorites/`)
- **Favorites Screen** (`favorites_screen.dart`):
  - Saved restaurants
  - Favorite dishes
  - Quick reorder
  - Remove favorites

### Key Features

#### Authentication & Security
- Email/password login
- Phone number verification (OTP)
- Google OAuth integration
- Biometric authentication
- Two-factor authentication support

#### Order Management
- Browse restaurants by location
- Menu browsing with categories
- Add items to cart
- Customize orders (special instructions)
- Multiple payment methods
- Real-time order tracking
- Order history and receipts

#### Personalization
- Favorite restaurants and dishes
- Order history for quick reordering
- Personalized recommendations
- Dietary preferences
- Language selection (French/English)

#### Payment Integration
- Credit/debit cards
- Mobile money (MTN/Orange)
- Cash on delivery
- Wallet balance
- Secure payment processing

---

## Restaurant Manager Module

### Overview
The Restaurant Manager Module provides comprehensive tools for restaurant owners to manage their business on the platform.

### Module Structure
```
lib/modules/restaurant_manager_module/
├── providers/           # State management for restaurant operations
├── screens/            # Restaurant management screens
├── services/           # API services for restaurant data
└── widgets/            # Restaurant-specific UI components
```

### Core Screens and Functionality

#### 1. **Restaurant Dashboard** (`restaurant_dashboard_screen.dart`)
- **Purpose**: Main control center for restaurant owners
- **Features**:
  - Real-time statistics (orders, revenue, ratings)
  - Live orders preview
  - Performance charts
  - Popular items list
  - Quick actions grid
- **Statistics Displayed**:
  - Today's orders count
  - Revenue metrics
  - Average order value
  - Customer ratings
  - Preparation time averages

#### 2. **Menu Management** (`menu_management_screen.dart`)
- **Purpose**: Complete menu management system
- **Features**:
  - Category management (create, edit, delete, reorder)
  - Menu item management (add, edit, delete, duplicate)
  - Item availability toggle
  - Price management
  - Image upload for items
  - Nutritional information
  - Allergen information
  - Preparation time settings
- **Menu Item Types**:
  - Single select (radio buttons)
  - Multi-select (checkboxes)
  - Quantity-based items
- **Bulk Operations**:
  - Bulk price updates
  - Bulk availability changes
  - Category reordering

#### 3. **Live Orders Management** (`live_orders_screen.dart`)
- **Purpose**: Real-time order processing
- **Features**:
  - Incoming orders display
  - Order acceptance/rejection
  - Preparation time updates
  - Order status management
  - Customer communication
  - Order details and modifications
- **Order Statuses**:
  - Pending (new orders)
  - Accepted (in preparation)
  - Ready for pickup
  - Out for delivery
  - Delivered
  - Cancelled

#### 4. **Analytics & Reports** (`analytics_reports_screen.dart`)
- **Purpose**: Business intelligence and reporting
- **Features**:
  - Sales analytics
  - Popular items analysis
  - Peak hours identification
  - Revenue trends
  - Customer insights
  - Performance metrics
- **Report Types**:
  - Daily reports
  - Weekly summaries
  - Monthly analytics
  - Custom date ranges

#### 5. **Restaurant Profile** (`restaurant_profile_screen.dart`)
- **Purpose**: Restaurant information management
- **Features**:
  - Basic information (name, description, cuisine type)
  - Contact details
  - Address and location
  - Operating hours
  - Delivery zones
  - Restaurant images
  - Social media links

#### 6. **Financial Management** (`wallet_financials_screen.dart`)
- **Purpose**: Financial tracking and management
- **Features**:
  - Revenue tracking
  - Commission calculations
  - Payout history
  - Financial reports
  - Tax information
  - Bank account management

#### 7. **Notifications** (`notifications_screen.dart`)
- **Purpose**: Restaurant-specific notifications
- **Features**:
  - New order alerts
  - System notifications
  - Promotional opportunities
  - Policy updates
  - Performance alerts

### Key Features

#### Order Management
- Real-time order notifications
- Order acceptance/rejection workflow
- Preparation time estimation
- Order modification handling
- Customer communication tools

#### Menu Management
- Comprehensive menu editor
- Category organization
- Item customization options
- Bulk operations
- Image management
- Nutritional information

#### Analytics & Insights
- Real-time performance metrics
- Sales trend analysis
- Popular items tracking
- Customer behavior insights
- Revenue optimization suggestions

#### Business Tools
- Operating hours management
- Delivery zone configuration
- Commission tracking
- Payout management
- Performance monitoring

---

## Driver Module

### Overview
The Driver Module provides functionality for delivery drivers to manage their work, accept orders, and complete deliveries.

### Module Structure
```
lib/modules/driver_module/
├── providers/           # Driver-specific state management
├── screens/            # Driver interface screens
├── services/           # Driver API services
└── widgets/            # Driver UI components
```

### Core Screens and Functionality

#### 1. **Driver Dashboard** (`driver_dashboard_screen.dart`)
- **Purpose**: Main interface for delivery drivers
- **Features**:
  - Online/offline status toggle
  - Availability management
  - Earnings summary
  - Active delivery tracking
  - Available orders list
  - Quick statistics
- **Status Management**:
  - Online/offline toggle
  - Available/unavailable status
  - Location sharing settings

#### 2. **Driver Status Card** (`driver_status_card.dart`)
- **Purpose**: Display current driver status and controls
- **Features**:
  - Current status indicator
  - Online/offline toggle
  - Availability toggle
  - Location permission status
  - Emergency contact button

#### 3. **Earnings Summary** (`earnings_summary_card.dart`)
- **Purpose**: Financial tracking for drivers
- **Features**:
  - Today's earnings
  - Weekly/monthly totals
  - Per-delivery earnings
  - Payout history
  - Performance bonuses

#### 4. **Available Orders** (`available_orders_list.dart`)
- **Purpose**: Display and manage available delivery requests
- **Features**:
  - Order list with details
  - Distance and estimated time
  - Earnings per delivery
  - Accept/reject functionality
  - Order filtering options

#### 5. **Active Delivery** (`active_delivery_card.dart`)
- **Purpose**: Manage current delivery
- **Features**:
  - Order details
  - Customer information
  - Restaurant location
  - Delivery address
  - Navigation integration
  - Status updates (picked up, delivered)

### Key Features

#### Order Management
- Available orders browsing
- Order acceptance/rejection
- Real-time order updates
- Delivery status tracking
- Customer communication

#### Navigation & Location
- GPS integration
- Route optimization
- Real-time location sharing
- Navigation app integration
- Delivery confirmation

#### Earnings & Performance
- Real-time earnings tracking
- Performance metrics
- Payout management
- Bonus calculations
- Financial reports

#### Communication
- Customer contact options
- Restaurant communication
- Support contact
- Issue reporting
- Emergency contacts

---

## Admin Module

### Overview
The Admin Module provides comprehensive administrative tools for platform management.

### Module Structure
```
lib/modules/admin_module/
├── providers/           # Admin state management
├── screens/            # Administrative screens
├── services/           # Admin API services
└── widgets/            # Admin UI components
```

### Core Screens and Functionality

#### 1. **Admin Dashboard** (`admin_dashboard_screen.dart`)
- **Purpose**: Central administrative control panel
- **Features**:
  - Platform statistics
  - Real-time metrics
  - System health monitoring
  - Recent activities
  - Alert management

#### 2. **User Management** (`user_management_screen.dart`)
- **Purpose**: Manage all platform users
- **Features**:
  - User account management
  - Role assignment
  - Status management (active, suspended, banned)
  - User activity monitoring
  - Account verification

#### 3. **Restaurant Management** (`restaurant_management_screen.dart`)
- **Purpose**: Manage restaurant accounts
- **Features**:
  - Restaurant approval workflow
  - Document verification
  - Status management
  - Performance monitoring
  - Compliance tracking

#### 4. **Order Management** (`order_management_screen.dart`)
- **Purpose**: Platform-wide order oversight
- **Features**:
  - Order monitoring
  - Issue resolution
  - Refund management
  - Dispute handling
  - Performance analytics

#### 5. **Financial Reports** (`financial_reports_screen.dart`)
- **Purpose**: Financial oversight and reporting
- **Features**:
  - Revenue tracking
  - Commission management
  - Payout monitoring
  - Financial analytics
  - Tax reporting

#### 6. **Live Delivery Tracking** (`live_delivery_tracking_screen.dart`)
- **Purpose**: Real-time delivery monitoring
- **Features**:
  - Live delivery map
  - Driver location tracking
  - Delivery status monitoring
  - Issue detection
  - Performance metrics

### Key Features

#### User Management
- Account lifecycle management
- Role-based access control
- Activity monitoring
- Security management
- Compliance tracking

#### Restaurant Oversight
- Onboarding workflow
- Document verification
- Performance monitoring
- Compliance management
- Support and assistance

#### System Monitoring
- Real-time metrics
- Performance tracking
- Alert management
- System health monitoring
- Issue detection and resolution

#### Financial Management
- Revenue tracking
- Commission management
- Payout oversight
- Financial reporting
- Tax compliance

---

## Guest Module

### Overview
The Guest Module allows unregistered users to browse and order without creating an account.

### Module Structure
```
lib/modules/guest_module/
├── providers/           # Guest session management
├── screens/            # Guest-specific screens
├── services/           # Guest API services
└── widgets/            # Guest UI components
```

### Core Screens and Functionality

#### 1. **Guest Landing** (`guest_landing_screen.dart`)
- **Purpose**: Welcome screen for guest users
- **Features**:
  - App introduction
  - Feature highlights
  - Location detection
  - Quick access to restaurants
  - Registration encouragement

#### 2. **Restaurant Discovery** (`guest_restaurant_discovery_screen.dart`)
- **Purpose**: Browse restaurants without registration
- **Features**:
  - Restaurant listing
  - Search and filtering
  - Menu browsing
  - Restaurant details
  - Guest checkout option

#### 3. **Guest Checkout** (`guest_checkout_screen.dart`)
- **Purpose**: Complete orders without account
- **Features**:
  - Guest information form
  - Payment processing
  - Order confirmation
  - Account creation option
  - Order tracking

#### 4. **Guest to Client Conversion** (`guest_to_client_conversion_screen.dart`)
- **Purpose**: Convert guest users to registered customers
- **Features**:
  - Account creation form
  - Order history transfer
  - Profile setup
  - Benefits explanation

### Key Features

#### Guest Experience
- Full restaurant browsing
- Menu exploration
- Guest checkout process
- Order placement without registration
- Basic order tracking

#### Conversion Features
- Seamless account creation
- Order history preservation
- Profile setup assistance
- Benefits highlighting
- Incentive offers

---

## Shared Services

### Overview
Shared services provide common functionality across all modules.

### Core Services

#### 1. **Authentication Service**
- User registration and login
- OAuth integration
- Token management
- Biometric authentication
- Two-factor authentication

#### 2. **Payment Service**
- Multiple payment methods
- Secure processing
- Transaction management
- Refund handling
- Mobile money integration

#### 3. **Location Service**
- GPS integration
- Address management
- Geocoding
- Delivery zone validation
- Route optimization

#### 4. **Notification Service**
- Push notifications
- In-app notifications
- Email notifications
- SMS notifications
- Notification preferences

#### 5. **Analytics Service**
- User behavior tracking
- Performance metrics
- Business intelligence
- Custom events
- Reporting

---

## Module Dependencies

### Dependency Graph
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Guest Module  │    │  Client Module  │    │Restaurant Module│
└─────────┬───────┘    └─────────┬───────┘    └─────────┬───────┘
          │                      │                      │
          └──────────────────────┼──────────────────────┘
                                 │
                    ┌─────────────┴─────────────┐
                    │                           │
            ┌───────▼───────┐           ┌───────▼───────┐
            │ Driver Module │           │  Admin Module │
            └───────────────┘           └───────────────┘
                    │                           │
                    └─────────────┬─────────────┘
                                  │
                    ┌─────────────▼─────────────┐
                    │     Shared Services      │
                    │  - Authentication        │
                    │  - Payment              │
                    │  - Location             │
                    │  - Notifications        │
                    │  - Analytics            │
                    └─────────────────────────┘
```

### Key Dependencies
- All modules depend on Shared Services
- Client and Restaurant modules interact for orders
- Driver module depends on both Client and Restaurant modules
- Admin module has access to all other modules
- Guest module can convert to Client module

---

## Security and Permissions

### Role-Based Access Control
Each user type has specific permissions and restrictions:

#### Customer Permissions
- Browse restaurants and menus
- Place and track orders
- Manage personal profile
- Access loyalty program
- View order history

#### Restaurant Owner Permissions
- Manage restaurant profile
- Handle menu and orders
- View analytics and reports
- Manage financial information
- Access restaurant-specific data only

#### Driver Permissions
- View available orders
- Accept/reject deliveries
- Update delivery status
- Access earnings information
- Manage driver profile

#### Admin Permissions
- Full system access
- User management
- Restaurant approval
- Financial oversight
- System configuration

#### Guest Permissions
- Browse restaurants
- Place guest orders
- Basic order tracking
- Convert to registered user

---

## Data Flow Architecture

### Customer Order Flow
1. **Browse** → Restaurant discovery and menu browsing
2. **Select** → Add items to cart and customize
3. **Checkout** → Payment processing and order confirmation
4. **Track** → Real-time order status updates
5. **Complete** → Delivery confirmation and rating

### Restaurant Order Flow
1. **Receive** → New order notification
2. **Accept** → Order acceptance and preparation
3. **Update** → Status updates and preparation time
4. **Complete** → Order ready for pickup/delivery

### Driver Delivery Flow
1. **Available** → Browse available delivery requests
2. **Accept** → Accept delivery and navigate to restaurant
3. **Pickup** → Confirm order pickup
4. **Deliver** → Navigate to customer and complete delivery
5. **Complete** → Delivery confirmation and earnings update

---

This comprehensive documentation covers all user types, modules, and functionality in the EatFast mobile application, providing detailed information about each component's purpose, features, and implementation.
