# EatFast Mobile App - Installation Guide

## 📋 Prerequisites

Before you begin, ensure you have the following installed on your development machine:

### Required Software

| Software | Version | Download Link |
|----------|---------|---------------|
| Flutter SDK | 3.16.0+ | [flutter.dev](https://flutter.dev/docs/get-started/install) |
| Dart SDK | 3.2.0+ | Included with Flutter |
| Git | Latest | [git-scm.com](https://git-scm.com/downloads) |
| VS Code / Android Studio | Latest | [code.visualstudio.com](https://code.visualstudio.com/) |

### Platform-Specific Requirements

#### For Android Development
- **Android Studio**: Latest version
- **Android SDK**: API level 21 (Android 5.0) or higher
- **Java JDK**: 11 or higher
- **Android Device/Emulator**: For testing

#### For iOS Development (macOS only)
- **Xcode**: Latest version (15.0+)
- **iOS Simulator**: Included with Xcode
- **CocoaPods**: Latest version
- **iOS Device**: For physical device testing

#### For Web Development
- **Chrome Browser**: Latest version
- **Web Server**: For local development

## 🚀 Quick Installation

### 1. Clone the Repository

```bash
# Using HTTPS
git clone https://github.com/eatfast/eatfast-mobile.git

# Using SSH (if you have SSH keys set up)
git clone git@github.com:eatfast/eatfast-mobile.git

# Navigate to project directory
cd eatfast-mobile
```

### 2. Install Flutter Dependencies

```bash
# Get all dependencies
flutter pub get

# Generate code (if needed)
flutter packages pub run build_runner build
```

### 3. Verify Installation

```bash
# Check Flutter installation
flutter doctor

# Check for issues and dependencies
flutter doctor -v
```

### 4. Run the Application

```bash
# Run on default device
flutter run

# Run on specific device
flutter devices
flutter run -d <device-id>

# Run with specific flavor
flutter run --flavor development
flutter run --flavor staging
flutter run --flavor production
```

## 🛠️ Detailed Setup

### Environment Configuration

#### 1. Create Environment Files

Create the following files in the root directory:

```bash
# Development environment
touch .env.development

# Staging environment
touch .env.staging

# Production environment
touch .env.production
```

#### 2. Configure Environment Variables

**`.env.development`**
```env
# API Configuration
API_BASE_URL=http://localhost:3000/api
API_VERSION=v1
API_TIMEOUT=30000

# Firebase Configuration
FIREBASE_PROJECT_ID=eatfast-dev
FIREBASE_API_KEY=your-dev-api-key
FIREBASE_APP_ID=your-dev-app-id

# Payment Configuration
STRIPE_PUBLISHABLE_KEY=pk_test_your-dev-stripe-key
PAYPAL_CLIENT_ID=your-dev-paypal-client-id

# Maps Configuration
GOOGLE_MAPS_API_KEY=your-dev-google-maps-key

# Analytics
MIXPANEL_TOKEN=your-dev-mixpanel-token

# Debug Settings
DEBUG_MODE=true
LOG_LEVEL=debug
```

**`.env.staging`**
```env
# API Configuration
API_BASE_URL=https://staging-api.eatfast.com/api
API_VERSION=v1
API_TIMEOUT=30000

# Firebase Configuration
FIREBASE_PROJECT_ID=eatfast-staging
FIREBASE_API_KEY=your-staging-api-key
FIREBASE_APP_ID=your-staging-app-id

# Payment Configuration
STRIPE_PUBLISHABLE_KEY=pk_test_your-staging-stripe-key
PAYPAL_CLIENT_ID=your-staging-paypal-client-id

# Maps Configuration
GOOGLE_MAPS_API_KEY=your-staging-google-maps-key

# Analytics
MIXPANEL_TOKEN=your-staging-mixpanel-token

# Debug Settings
DEBUG_MODE=false
LOG_LEVEL=info
```

**`.env.production`**
```env
# API Configuration
API_BASE_URL=https://api.eatfast.com/api
API_VERSION=v1
API_TIMEOUT=30000

# Firebase Configuration
FIREBASE_PROJECT_ID=eatfast-prod
FIREBASE_API_KEY=your-prod-api-key
FIREBASE_APP_ID=your-prod-app-id

# Payment Configuration
STRIPE_PUBLISHABLE_KEY=pk_live_your-prod-stripe-key
PAYPAL_CLIENT_ID=your-prod-paypal-client-id

# Maps Configuration
GOOGLE_MAPS_API_KEY=your-prod-google-maps-key

# Analytics
MIXPANEL_TOKEN=your-prod-mixpanel-token

# Debug Settings
DEBUG_MODE=false
LOG_LEVEL=error
```

### Firebase Setup

#### 1. Create Firebase Projects

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create projects for each environment:
   - `eatfast-dev` (Development)
   - `eatfast-staging` (Staging)
   - `eatfast-prod` (Production)

#### 2. Add Apps to Firebase Projects

For each project, add:
- Android app (`com.eatfast.app.dev`, `com.eatfast.app.staging`, `com.eatfast.app`)
- iOS app (`com.eatfast.app.dev`, `com.eatfast.app.staging`, `com.eatfast.app`)
- Web app (if applicable)

#### 3. Download Configuration Files

**Android:**
- Download `google-services.json` for each flavor
- Place them in:
  ```
  android/app/src/development/google-services.json
  android/app/src/staging/google-services.json
  android/app/src/production/google-services.json
  ```

**iOS:**
- Download `GoogleService-Info.plist` for each environment
- Add them to Xcode project with proper targets

#### 4. Enable Firebase Services

Enable the following services in Firebase Console:
- **Authentication** (Email/Password, Google, Facebook)
- **Firestore Database** (for offline data)
- **Cloud Storage** (for file uploads)
- **Cloud Messaging** (for push notifications)
- **Analytics** (for user tracking)
- **Crashlytics** (for crash reporting)

### Google Maps Setup

#### 1. Enable Google Maps APIs

In [Google Cloud Console](https://console.cloud.google.com/):
1. Create a new project or select existing
2. Enable the following APIs:
   - Maps SDK for Android
   - Maps SDK for iOS
   - Places API
   - Directions API
   - Geocoding API

#### 2. Generate API Keys

1. Create API keys for each environment
2. Restrict keys by application (recommended)
3. Add keys to environment files

#### 3. Configure Platform-Specific Settings

**Android (`android/app/src/main/AndroidManifest.xml`):**
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="${GOOGLE_MAPS_API_KEY}" />
```

**iOS (`ios/Runner/AppDelegate.swift`):**
```swift
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR_API_KEY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

## 🔧 Development Setup

### IDE Configuration

#### Visual Studio Code

**Recommended Extensions:**
```json
{
  "recommendations": [
    "dart-code.dart-code",
    "dart-code.flutter",
    "alexisvt.flutter-snippets",
    "nash.awesome-flutter-snippets",
    "gornivv.vscode-flutter-files",
    "everettjf.pubspec-dependency-search",
    "bradlc.vscode-tailwindcss",
    "ms-vscode.vscode-json"
  ]
}
```

**Settings (`.vscode/settings.json`):**
```json
{
  "dart.debugExternalPackageLibraries": true,
  "dart.debugSdkLibraries": true,
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "dart.hotReloadOnSave": "always",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true,
    "source.organizeImports": true
  },
  "files.associations": {
    "*.dart": "dart"
  }
}
```

#### Android Studio

1. Install Flutter and Dart plugins
2. Configure Flutter SDK path
3. Set up device debugging
4. Enable hot reload

### Project Configuration

#### 1. Verify Dart/Flutter Configuration

```bash
# Check Dart version
dart --version

# Check Flutter version
flutter --version

# Check Flutter doctor
flutter doctor -v
```

#### 2. Configure Build Flavors

**Android (`android/app/build.gradle`):**
```gradle
android {
    flavorDimensions "environment"

    productFlavors {
        development {
            dimension "environment"
            applicationIdSuffix ".dev"
            versionNameSuffix "-dev"
            resValue "string", "app_name", "EatFast Dev"
        }

        staging {
            dimension "environment"
            applicationIdSuffix ".staging"
            versionNameSuffix "-staging"
            resValue "string", "app_name", "EatFast Staging"
        }

        production {
            dimension "environment"
            resValue "string", "app_name", "EatFast"
        }
    }
}
```

**iOS:** Configure schemes in Xcode for each environment.

#### 3. Set Up Code Generation

```bash
# Install build_runner
flutter pub add --dev build_runner

# Generate code
flutter packages pub run build_runner build

# Watch for changes (during development)
flutter packages pub run build_runner watch
```

### Database Setup

#### Local Development Database

If using a local backend:

```bash
# Install and start PostgreSQL
# macOS
brew install postgresql
brew services start postgresql

# Create database
createdb eatfast_dev

# Run migrations (in backend repository)
npm run migrate:dev
```

#### Remote Database Connection

Update your `.env.development` file:
```env
# Database Configuration
DB_HOST=localhost
DB_PORT=5432
DB_NAME=eatfast_dev
DB_USERNAME=postgres
DB_PASSWORD=your_password
```

## 🧪 Testing Setup

### Unit Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
```

### Integration Testing

```bash
# Run integration tests
flutter drive --target=test_driver/app.dart
```

### Widget Testing

```bash
# Run widget tests
flutter test test/widgets/
```

## 📱 Device Setup

### Android Device Setup

#### Physical Device

1. Enable Developer Options
2. Enable USB Debugging
3. Install USB drivers
4. Connect device and authorize computer

#### Emulator Setup

```bash
# List available emulators
flutter emulators

# Launch specific emulator
flutter emulators --launch <emulator_id>

# Create new emulator
flutter emulators --create --name pixel_5_api_30
```

### iOS Device Setup

#### Physical Device

1. Register device in Apple Developer Portal
2. Create provisioning profile
3. Trust developer certificate on device
4. Build and install app through Xcode

#### Simulator Setup

```bash
# List available simulators
xcrun simctl list devices

# Launch specific simulator
open -a Simulator --args -CurrentDeviceUDID <device_id>
```

## 🔍 Troubleshooting

### Common Issues

#### Flutter Doctor Issues

**Issue:** `Android license status unknown`
```bash
# Solution
flutter doctor --android-licenses
```

**Issue:** `Xcode not found`
```bash
# Solution (macOS)
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

#### Build Issues

**Issue:** `Gradle build failed`
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build apk
```

**Issue:** `CocoaPods not found` (iOS)
```bash
# Install CocoaPods
sudo gem install cocoapods
cd ios && pod install
```

#### Runtime Issues

**Issue:** Hot reload not working
```bash
# Restart with hot reload
flutter run --hot
```

**Issue:** Package conflicts
```bash
# Reset dependencies
flutter clean
rm pubspec.lock
flutter pub get
```

### Performance Issues

#### Large App Size

1. Enable code shrinking in release builds
2. Split APKs by ABI
3. Use app bundles for Play Store

#### Slow Build Times

1. Enable Gradle daemon
2. Increase Gradle heap size
3. Use build cache
4. Enable parallel builds

## 📚 Additional Resources

### Documentation Links

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)

### Community Support

- [Flutter Discord](https://discord.gg/flutter)
- [Flutter Reddit](https://reddit.com/r/FlutterDev)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)

### Development Tools

- [Flutter Inspector](https://flutter.dev/docs/development/tools/flutter-inspector)
- [Dart DevTools](https://dart.dev/tools/dart-devtools)
- [Firebase Console](https://console.firebase.google.com/)
- [Google Cloud Console](https://console.cloud.google.com/)

---

**Need Help?** If you encounter any issues during installation, please:
1. Check our [Troubleshooting Guide](./TROUBLESHOOTING.md)
2. Search existing [GitHub Issues](https://github.com/eatfast/eatfast-mobile/issues)
3. Create a new issue with detailed information
4. Join our [Discord Community](https://discord.gg/eatfast) for real-time help