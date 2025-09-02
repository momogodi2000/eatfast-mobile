# 🍽️ EatFast Mobile - Food Delivery App for Cameroon

A modern, feature-rich food delivery mobile application built with Flutter, specifically designed for the Cameroon market with support for local payment methods (Mobile Money) and French localization.

## ✨ Features

### Phase 1 - Core Foundation
- ✅ **Modern Flutter Architecture**: MVVM with Riverpod state management
- ✅ **Enhanced Authentication**: Email/phone + Google Sign-In + biometric authentication
- ✅ **Security Layer**: Secure token storage, device fingerprinting, account lockout protection
- ✅ **Professional UI Components**: Reusable component library with Material Design 3
- ✅ **Animation System**: Lottie animations, staggered animations, smooth transitions
- ✅ **Comprehensive Linting**: Strict code quality rules and formatting

### Phase 2 - User Management (Current)
- ✅ **Complete Profile Management**: Avatar upload, personal information editing
- ✅ **Address Management**: Google Maps integration, location services, multiple addresses
- ✅ **Payment Methods**: MTN Mobile Money, Orange Money, EU Mobile, cash payments
- ✅ **Notification Preferences**: Push, email, SMS, WhatsApp notification settings
- ✅ **Security Features**: Password change, two-factor authentication, account deletion
- ✅ **Production-Ready Testing**: Unit tests, widget tests, integration tests

## 🏗️ Architecture

### Clean Architecture with MVVM Pattern
```
lib/
├── core/                    # Core utilities and shared logic
│   ├── theme/              # Theme configuration (colors, text styles)
│   ├── network/            # API client and network utilities
│   ├── security/           # Security services (secure storage, biometrics)
│   └── utils/              # Utilities and extensions
├── features/               # Feature-based modules
│   ├── auth/              # Authentication feature
│   │   ├── domain/        # Business logic and models
│   │   ├── data/          # Repository implementations
│   │   ├── providers/     # State management
│   │   └── presentation/  # UI screens and widgets
│   └── profile/           # Profile management feature
│       ├── domain/        # Business logic and models
│       ├── data/          # Repository implementations
│       ├── providers/     # State management
│       └── presentation/  # UI screens and widgets
└── shared/                # Shared UI components
    └── widgets/           # Reusable widgets
```

### State Management
- **Riverpod 2.4.9**: Modern, compile-safe state management
- **AsyncValue**: Built-in loading, error, and data states
- **Repository Pattern**: Clean separation of data and business logic

## 🔧 Technical Stack

### Core Dependencies
```yaml
# State Management
flutter_riverpod: ^2.4.9
riverpod_annotation: ^2.3.5

# Networking
dio: ^5.4.3+1
retrofit: ^4.1.0
pretty_dio_logger: ^1.3.1

# Local Storage
shared_preferences: ^2.2.3
hive: ^2.2.3
flutter_secure_storage: ^9.2.2

# Authentication & Security
google_sign_in: ^6.2.1
local_auth: ^2.2.0
sign_in_with_apple: ^6.1.0

# Maps & Location
google_maps_flutter: ^2.6.0
location: ^6.0.2
geocoding: ^3.0.0

# UI & Animations
lottie: ^3.1.2
shimmer: ^3.0.0
flutter_staggered_animations: ^1.1.1
cached_network_image: ^3.3.1

# Media & Files
image_picker: ^1.0.7
image_cropper: ^5.0.1

# Push Notifications
firebase_core: ^2.31.0
firebase_messaging: ^14.9.2
flutter_local_notifications: ^17.1.2

# Real-time Communication
socket_io_client: ^2.0.3+1

# Payment Integration
flutter_stripe: ^10.1.1
```

## 🚀 Getting Started

### Prerequisites
- Flutter 3.8.1+
- Dart 3.8.1+
- Android Studio / VS Code
- Google Maps API key
- Firebase project (for notifications)

### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/eatfast-mobile.git
   cd eatfast-mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API keys**
   ```bash
   # Add to android/app/src/main/AndroidManifest.xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
   
   # Add to ios/Runner/AppDelegate.swift
   GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 🧪 Testing

### Run all tests
```bash
flutter test
```

### Run specific test suites
```bash
# Unit tests
flutter test test/features/profile/profile_provider_test.dart

# Widget tests
flutter test test/features/profile/profile_screen_test.dart

# Integration tests
flutter test integration_test/
```

## 📱 Key Features Implemented

### Authentication System
- **Multi-method Authentication**: Email, phone, Google Sign-In
- **Biometric Support**: Fingerprint and Face ID integration
- **Security Features**: Device fingerprinting, account lockout, secure token storage
- **Social Login**: Google OAuth integration with profile sync

### Profile Management
- **Personal Information**: Full name, email, phone number editing
- **Avatar Management**: Image upload, cropping, deletion
- **Verification Status**: Email and phone verification indicators
- **Account Settings**: Password change, two-factor authentication

### Address Management
- **Google Maps Integration**: Interactive map for address selection
- **Location Services**: Current location detection and geocoding
- **Multiple Addresses**: Home, work, custom labels
- **Default Address**: Set preferred delivery address

### Payment Methods
- **Mobile Money Support**: MTN Mobile Money, Orange Money, EU Mobile
- **Cash on Delivery**: Traditional payment option
- **Multiple Methods**: Store multiple payment options
- **Default Payment**: Set preferred payment method

### Security Features
- **Data Protection**: Flutter Secure Storage with encryption
- **JWT Token Management**: Automatic token refresh and secure storage
- **Device Fingerprinting**: Unique device identification
- **Account Lockout**: Protection against brute force attacks

## 🎨 UI/UX Design

### Design System
- **Material Design 3**: Modern Google design language
- **Color Scheme**: Primary orange theme for food industry
- **Typography**: Poppins font family with multiple weights
- **Accessibility**: Screen reader support, keyboard navigation

### Component Library
- **AppButton**: Standardized button with loading states
- **AppLoadingIndicator**: Shimmer effects and skeleton screens
- **Form Components**: Consistent input fields and validation
- **Cards & Lists**: Material cards with proper elevation

### Animations
- **Lottie Animations**: Custom animations for empty states
- **Page Transitions**: Smooth navigation between screens
- **Micro-interactions**: Button press feedback, form validation

## 🌍 Cameroon-Specific Features

### Localization
- **French Language**: Primary language support for Cameroon
- **Local Payment Methods**: Mobile Money integration (MTN, Orange)
- **Currency**: Central African CFA franc (XAF) support
- **Local Services**: Cameroon-specific address formats

### Payment Integration
- **MTN Mobile Money**: Direct integration with MTN payment gateway
- **Orange Money**: Orange mobile payment support
- **EU Mobile**: Local mobile payment option
- **Cash on Delivery**: Traditional payment method support

## 📊 Code Quality & Testing

### Testing Strategy
- **Unit Tests**: Business logic and provider testing
- **Widget Tests**: UI component testing with mocks
- **Integration Tests**: End-to-end user flow testing
- **Code Coverage**: Maintain 80%+ coverage

### Code Quality Standards
- **Linting Rules**: Strict Flutter/Dart linting
- **Architecture**: Clean Architecture with MVVM
- **Documentation**: Comprehensive README and code docs
- **Error Handling**: Centralized error management

## 🔮 Future Phases

### Phase 3 - Restaurant & Menu Management (Planned)
- Restaurant discovery and search
- Menu browsing with categories and filters  
- Real-time restaurant availability
- Reviews and ratings system

### Phase 4 - Ordering System (Planned)
- Shopping cart with customization options
- Real-time order tracking with maps
- Driver communication and updates
- Order history and reordering

### Phase 5 - Advanced Features (Planned)
- Loyalty program and rewards
- Group ordering and splitting bills
- Restaurant recommendations with AI
- Social features and sharing

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch
3. Write comprehensive tests
4. Follow coding standards
5. Submit a Pull Request

## 📞 Support

For support and questions:
- 📧 Email: support@eatfast.cm
- 🌐 Website: https://www.eatfast.cm

---

**Made with ❤️ in Cameroon 🇨🇲**
