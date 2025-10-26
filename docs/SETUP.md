# EatFast Mobile App - Comprehensive Setup Guide

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Development Environment Setup](#development-environment-setup)
3. [Project Installation](#project-installation)
4. [Configuration](#configuration)
5. [Running the Application](#running-the-application)
6. [Build and Deployment](#build-and-deployment)
7. [Environment Management](#environment-management)
8. [Troubleshooting](#troubleshooting)
9. [Development Workflow](#development-workflow)
10. [Contributing Guidelines](#contributing-guidelines)

---

## Prerequisites

### System Requirements

#### Operating System
- **Windows**: Windows 10 version 1903 or higher (64-bit)
- **macOS**: macOS 10.14 (Mojave) or higher
- **Linux**: Ubuntu 18.04 LTS or higher (64-bit)

#### Hardware Requirements
- **RAM**: Minimum 8GB, Recommended 16GB
- **Storage**: At least 10GB free space
- **Processor**: Intel Core i5 or equivalent
- **Graphics**: Integrated graphics sufficient for development

### Required Software

#### 1. Flutter SDK
- **Version**: 3.16.0 or higher
- **Download**: [Flutter Official Website](https://flutter.dev/docs/get-started/install)
- **Installation**: Follow platform-specific installation guide
- **Verification**: Run `flutter doctor` to check installation

#### 2. Dart SDK
- **Version**: 3.2.0 or higher
- **Included**: Comes with Flutter SDK
- **Verification**: Run `dart --version` to check version

#### 3. Development IDE
Choose one of the following:

**Android Studio (Recommended)**
- **Version**: Arctic Fox (2020.3.1) or higher
- **Download**: [Android Studio](https://developer.android.com/studio)
- **Required Plugins**:
  - Flutter plugin
  - Dart plugin
  - Android SDK

**Visual Studio Code**
- **Download**: [VS Code](https://code.visualstudio.com/)
- **Required Extensions**:
  - Flutter extension
  - Dart extension
  - GitLens extension

#### 4. Platform-Specific Requirements

**For Android Development:**
- **Android SDK**: API level 21 (Android 5.0) or higher
- **Android Studio**: Latest stable version
- **Android Emulator**: Or physical Android device
- **Java Development Kit (JDK)**: Version 11 or higher

**For iOS Development (macOS only):**
- **Xcode**: Version 14.0 or higher
- **iOS Simulator**: Included with Xcode
- **CocoaPods**: For iOS dependency management
- **Apple Developer Account**: For device testing and App Store deployment

#### 5. Additional Tools
- **Git**: Version 2.0 or higher
- **Node.js**: Version 16 or higher (for some build tools)
- **Python**: Version 3.8 or higher (for encoding fixes)
- **Curl**: For API testing
- **Postman**: For API development and testing

---

## Development Environment Setup

### 1. Flutter Installation

#### Windows
```bash
# Download Flutter SDK
# Extract to C:\flutter
# Add C:\flutter\bin to PATH

# Verify installation
flutter doctor
```

#### macOS
```bash
# Using Homebrew (recommended)
brew install --cask flutter

# Or download from website
# Extract to ~/development/flutter
# Add to PATH in ~/.zshrc or ~/.bash_profile

# Verify installation
flutter doctor
```

#### Linux
```bash
# Download Flutter SDK
wget https://storage.googleapis.com/flutter_infra_releases/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz

# Extract
tar xf flutter_linux_3.16.0-stable.tar.xz

# Add to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter doctor
```

### 2. Android Studio Setup

#### Installation
1. Download Android Studio from [developer.android.com](https://developer.android.com/studio)
2. Run the installer and follow the setup wizard
3. Install Android SDK (API level 21+)
4. Install Android Virtual Device (AVD)

#### Flutter Plugin Installation
1. Open Android Studio
2. Go to File → Settings → Plugins
3. Search for "Flutter" and install
4. Restart Android Studio

#### Android SDK Configuration
```bash
# Set Android SDK path
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Verify setup
flutter doctor --android-licenses
```

### 3. VS Code Setup (Alternative)

#### Installation
1. Download VS Code from [code.visualstudio.com](https://code.visualstudio.com/)
2. Install Flutter and Dart extensions
3. Configure Flutter SDK path in settings

#### Configuration
```json
{
  "dart.flutterSdkPath": "/path/to/flutter",
  "dart.sdkPath": "/path/to/flutter/bin/cache/dart-sdk",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  }
}
```

### 4. iOS Setup (macOS only)

#### Xcode Installation
1. Install Xcode from Mac App Store
2. Install Xcode Command Line Tools
3. Accept Xcode license

#### CocoaPods Installation
```bash
# Install CocoaPods
sudo gem install cocoapods

# Verify installation
pod --version
```

#### iOS Simulator Setup
1. Open Xcode
2. Go to Xcode → Preferences → Components
3. Install iOS Simulator
4. Create a new simulator device

---

## Project Installation

### 1. Repository Setup

#### Clone Repository
```bash
# Clone the repository
git clone https://github.com/your-org/eatfatsApp.git
cd eatfatsApp

# Checkout the correct branch
git checkout main

# Verify repository structure
ls -la
```

#### Repository Structure Verification
```
eatfatsApp/
├── android/                 # Android-specific files
├── ios/                     # iOS-specific files
├── lib/                     # Dart source code
│   ├── core/               # Core utilities
│   ├── modules/            # Feature modules
│   ├── shared/             # Shared components
│   └── main.dart           # App entry point
├── assets/                  # App assets
├── test/                    # Test files
├── docs/                    # Documentation
├── pubspec.yaml            # Dependencies
└── README.md               # Project readme
```

### 2. Dependencies Installation

#### Install Flutter Dependencies
```bash
# Install dependencies
flutter pub get

# Verify dependencies
flutter pub deps

# Check for outdated packages
flutter pub outdated
```

#### Install Platform-Specific Dependencies

**Android:**
```bash
# No additional steps required
# Dependencies are managed by Gradle
```

**iOS:**
```bash
# Install CocoaPods dependencies
cd ios
pod install
cd ..
```

### 3. Environment Setup

#### Create Environment Files
```bash
# Create environment configuration
touch .env
touch .env.development
touch .env.production
```

#### Environment Configuration
```bash
# .env.development
API_BASE_URL=https://api-dev.eatfast.com
GOOGLE_MAPS_API_KEY=your_dev_api_key
FIREBASE_PROJECT_ID=eatfast-dev
DEBUG_MODE=true

# .env.production
API_BASE_URL=https://api.eatfast.com
GOOGLE_MAPS_API_KEY=your_prod_api_key
FIREBASE_PROJECT_ID=eatfast-prod
DEBUG_MODE=false
```

---

## Configuration

### 1. Firebase Configuration

#### Android Setup
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing
3. Add Android app with package name: `com.eatfast.cameroon`
4. Download `google-services.json`
5. Place file in `android/app/google-services.json`

#### iOS Setup
1. Add iOS app to Firebase project
2. Download `GoogleService-Info.plist`
3. Place file in `ios/Runner/GoogleService-Info.plist`
4. Add to Xcode project

#### Firebase Services Configuration
```dart
// lib/firebase_options.dart
// This file is auto-generated by FlutterFire CLI
// Run: flutterfire configure
```

### 2. Google OAuth Configuration

#### Android Setup
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create OAuth 2.0 credentials
3. Add package name: `com.eatfast.cameroon`
4. Add SHA-1 fingerprint
5. Download `google-services.json` (if not already done)

#### iOS Setup
1. Add iOS bundle ID to Google Cloud Console
2. Download updated `GoogleService-Info.plist`
3. Update Xcode project

#### OAuth Configuration
```dart
// lib/shared/services/auth/google_sign_in_service.dart
class GoogleSignInService {
  static const String clientId = 'your_client_id';
  static const String serverClientId = 'your_server_client_id';
}
```

### 3. Google Maps Configuration

#### API Key Setup
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Enable Maps SDK for Android and iOS
3. Create API key
4. Restrict API key to your app

#### Android Configuration
```xml
<!-- android/app/src/main/AndroidManifest.xml -->
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY"/>
```

#### iOS Configuration
```xml
<!-- ios/Runner/Info.plist -->
<key>GMSApiKey</key>
<string>YOUR_API_KEY</string>
```

### 4. Payment Gateway Configuration

#### Stripe Configuration
```dart
// lib/shared/services/payment/stripe_service.dart
class StripeService {
  static const String publishableKey = 'pk_test_...';
  static const String secretKey = 'sk_test_...';
}
```

#### Mobile Money Configuration
```dart
// lib/shared/services/payment/mobile_money_service.dart
class MobileMoneyService {
  static const String mtnApiKey = 'your_mtn_api_key';
  static const String orangeApiKey = 'your_orange_api_key';
}
```

### 5. API Configuration

#### Base URL Configuration
```dart
// lib/shared/config/api_config.dart
class ApiConfig {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.eatfast.com',
  );
}
```

#### API Headers Configuration
```dart
// lib/shared/services/api/api_client.dart
class ApiClient {
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Device-Type': 'flutter_mobile',
    'X-App-Version': '1.0.0',
  };
}
```

---

## Running the Application

### 1. Development Mode

#### Basic Run
```bash
# Run on connected device/emulator
flutter run

# Run with specific device
flutter run -d <device_id>

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release
```

#### Hot Reload and Hot Restart
```bash
# Hot reload (preserves state)
r

# Hot restart (resets state)
R

# Quit application
q
```

#### Debugging
```bash
# Run with debugging enabled
flutter run --debug

# Run with verbose logging
flutter run --verbose

# Run with specific flavor
flutter run --flavor development
```

### 2. Device Management

#### List Available Devices
```bash
# List all connected devices
flutter devices

# List Android devices
flutter devices --machine

# List iOS devices
flutter devices --machine | grep ios
```

#### Android Device Setup
```bash
# Enable USB debugging on Android device
# Go to Settings → Developer Options → USB Debugging

# Verify device connection
adb devices

# Run on Android device
flutter run -d android
```

#### iOS Device Setup
```bash
# Trust developer certificate on iOS device
# Go to Settings → General → Device Management

# Run on iOS device
flutter run -d ios
```

### 3. Emulator Setup

#### Android Emulator
```bash
# List available emulators
flutter emulators

# Launch Android emulator
flutter emulators --launch <emulator_id>

# Create new emulator
# Use Android Studio AVD Manager
```

#### iOS Simulator
```bash
# List available simulators
xcrun simctl list devices

# Launch iOS simulator
open -a Simulator

# Run on iOS simulator
flutter run -d ios
```

---

## Build and Deployment

### 1. Android Build

#### Debug Build
```bash
# Build debug APK
flutter build apk --debug

# Build debug bundle
flutter build appbundle --debug
```

#### Release Build
```bash
# Build release APK
flutter build apk --release

# Build release bundle
flutter build appbundle --release

# Build with specific flavor
flutter build apk --release --flavor production
```

#### Signing Configuration
```bash
# Create keystore
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Configure signing in android/app/build.gradle
android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile']
            storePassword keystoreProperties['storePassword']
        }
    }
}
```

### 2. iOS Build

#### Debug Build
```bash
# Build debug iOS app
flutter build ios --debug

# Build for simulator
flutter build ios --simulator
```

#### Release Build
```bash
# Build release iOS app
flutter build ios --release

# Build with specific configuration
flutter build ios --release --flavor production
```

#### App Store Deployment
```bash
# Archive for App Store
flutter build ipa --release

# Upload to App Store
flutter build ipa --release --export-method app-store
```

### 3. Build Optimization

#### Code Splitting
```bash
# Build with code splitting
flutter build apk --split-per-abi

# Build for specific architectures
flutter build apk --target-platform android-arm64
```

#### Size Optimization
```bash
# Analyze app size
flutter build apk --analyze-size

# Build with size optimization
flutter build apk --release --obfuscate --split-debug-info=debug-info
```

---

## Environment Management

### 1. Environment Variables

#### Development Environment
```bash
# .env.development
API_BASE_URL=https://api-dev.eatfast.com
GOOGLE_MAPS_API_KEY=dev_api_key
FIREBASE_PROJECT_ID=eatfast-dev
DEBUG_MODE=true
LOG_LEVEL=debug
```

#### Production Environment
```bash
# .env.production
API_BASE_URL=https://api.eatfast.com
GOOGLE_MAPS_API_KEY=prod_api_key
FIREBASE_PROJECT_ID=eatfast-prod
DEBUG_MODE=false
LOG_LEVEL=error
```

#### Environment Loading
```dart
// lib/core/config/env_config.dart
class EnvConfig {
  static String get apiBaseUrl => 
    const String.fromEnvironment('API_BASE_URL');
  
  static String get googleMapsApiKey => 
    const String.fromEnvironment('GOOGLE_MAPS_API_KEY');
  
  static bool get isDebugMode => 
    const String.fromEnvironment('DEBUG_MODE') == 'true';
}
```

### 2. Build Flavors

#### Flavor Configuration
```dart
// android/app/build.gradle
android {
    flavorDimensions "environment"
    productFlavors {
        development {
            dimension "environment"
            applicationIdSuffix ".dev"
            versionNameSuffix "-dev"
        }
        production {
            dimension "environment"
        }
    }
}
```

#### Flavor Usage
```bash
# Run with development flavor
flutter run --flavor development

# Build with production flavor
flutter build apk --flavor production
```

---

## Troubleshooting

### 1. Common Issues

#### Flutter Doctor Issues
```bash
# Run Flutter Doctor
flutter doctor

# Fix specific issues
flutter doctor --android-licenses
flutter doctor --fix
```

#### Build Issues
```bash
# Clean build cache
flutter clean

# Reinstall dependencies
flutter pub get

# Clean and rebuild
flutter clean && flutter pub get && flutter run
```

#### Android Issues
```bash
# Fix Android build issues
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

#### iOS Issues
```bash
# Fix iOS build issues
cd ios
pod deintegrate
pod install
cd ..
flutter clean
flutter pub get
flutter run
```

### 2. Device Issues

#### Android Device Issues
```bash
# Check device connection
adb devices

# Restart ADB server
adb kill-server
adb start-server

# Check device logs
adb logcat
```

#### iOS Device Issues
```bash
# Check device connection
xcrun devicectl list devices

# Check device logs
xcrun devicectl device install app --device <device_id> <app_path>
```

### 3. Performance Issues

#### Memory Issues
```bash
# Check memory usage
flutter run --verbose

# Profile memory usage
flutter run --profile
```

#### Build Performance
```bash
# Enable build caching
flutter build apk --build-cache

# Use incremental builds
flutter build apk --incremental
```

### 4. Debugging

#### Log Analysis
```bash
# Enable verbose logging
flutter run --verbose

# Check Flutter logs
flutter logs

# Check device logs
adb logcat | grep flutter
```

#### Performance Profiling
```bash
# Run with profiling
flutter run --profile

# Analyze performance
flutter run --trace-startup
```

---

## Development Workflow

### 1. Git Workflow

#### Branch Management
```bash
# Create feature branch
git checkout -b feature/new-feature

# Create bugfix branch
git checkout -b bugfix/fix-issue

# Create hotfix branch
git checkout -b hotfix/critical-fix
```

#### Commit Guidelines
```bash
# Commit with conventional format
git commit -m "feat: add new user authentication feature"
git commit -m "fix: resolve Android back button issue"
git commit -m "docs: update setup documentation"
```

#### Pull Request Process
1. Create feature branch
2. Make changes and commit
3. Push branch to remote
4. Create pull request
5. Code review process
6. Merge to main branch

### 2. Code Quality

#### Linting
```bash
# Run Dart analyzer
flutter analyze

# Fix linting issues
dart fix --apply

# Run specific linting rules
flutter analyze --no-fatal-infos
```

#### Testing
```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Run specific test file
flutter test test/unit/auth_test.dart
```

#### Code Formatting
```bash
# Format code
dart format .

# Check formatting
dart format --set-exit-if-changed .
```

### 3. Continuous Integration

#### GitHub Actions
```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
```

#### Pre-commit Hooks
```bash
# Install pre-commit hooks
flutter pub add --dev pre_commit

# Configure pre-commit
echo "flutter analyze" > .pre-commit-config.yaml
echo "flutter test" >> .pre-commit-config.yaml
```

---

## Contributing Guidelines

### 1. Code Standards

#### Dart Style Guide
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable names
- Write self-documenting code
- Add comments for complex logic

#### Flutter Best Practices
- Use const constructors where possible
- Implement proper state management
- Follow widget composition patterns
- Optimize for performance

### 2. Documentation

#### Code Documentation
```dart
/// A service class for handling user authentication.
/// 
/// This class provides methods for user login, logout, and session management.
/// It integrates with Firebase Auth and Google Sign-In services.
class AuthService {
  /// Authenticates a user with email and password.
  /// 
  /// Returns [AuthResult] containing user data and authentication status.
  /// Throws [AuthException] if authentication fails.
  Future<AuthResult> signInWithEmail(String email, String password) async {
    // Implementation
  }
}
```

#### README Updates
- Update setup instructions
- Document new features
- Include code examples
- Update troubleshooting section

### 3. Testing Requirements

#### Unit Tests
```dart
// test/unit/auth_service_test.dart
void main() {
  group('AuthService', () {
    test('should authenticate user with valid credentials', () async {
      // Test implementation
    });
  });
}
```

#### Widget Tests
```dart
// test/widget/login_screen_test.dart
void main() {
  testWidgets('LoginScreen should display login form', (tester) async {
    // Test implementation
  });
}
```

#### Integration Tests
```dart
// integration_test/app_test.dart
void main() {
  group('App Integration Tests', () {
    testWidgets('Complete user flow', (tester) async {
      // Test implementation
    });
  });
}
```

---

This comprehensive setup guide provides detailed instructions for setting up, configuring, and running the EatFast mobile application in various environments and scenarios.
