# Firebase Setup and Configuration Guide for EatFast Mobile App

## Table of Contents
1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Firebase Project Setup](#firebase-project-setup)
4. [Firebase Services Configuration](#firebase-services-configuration)
5. [Flutter Integration](#flutter-integration)
6. [Platform-Specific Setup](#platform-specific-setup)
7. [Testing and Validation](#testing-and-validation)
8. [Production Deployment](#production-deployment)
9. [Monitoring and Analytics](#monitoring-and-analytics)
10. [Troubleshooting](#troubleshooting)

## Overview

This guide provides comprehensive instructions for setting up Firebase services for the EatFast mobile application. The app currently uses Firebase for:
- **Crashlytics**: Crash reporting and error tracking
- **Performance Monitoring**: App performance metrics
- **Analytics**: User behavior and app usage analytics
- **A/B Testing**: Feature flagging and experimentation (planned)

## Prerequisites

Before starting, ensure you have:
- Google Cloud Platform account
- Flutter development environment set up
- Android Studio (for Android configuration)
- Xcode (for iOS configuration)
- Firebase CLI installed (`npm install -g firebase-tools`)

## Firebase Project Setup

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter project name: `eatfast-mobile` (or your preferred name)
4. Enable Google Analytics (recommended)
5. Choose or create a Google Analytics account
6. Click "Create project"

### 2. Configure Project Settings

1. In Firebase Console, go to Project Settings (gear icon)
2. Set up project details:
   - **Project ID**: `eatfast-mobile-prod` (or similar)
   - **Display Name**: EatFast Mobile
   - **Support Email**: your-email@domain.com
3. Add project members and set permissions

## Firebase Services Configuration

### 1. Crashlytics Setup

#### Enable Crashlytics
1. In Firebase Console, go to "Crashlytics" in the left sidebar
2. Click "Get started"
3. Follow the setup wizard
4. Enable Crashlytics for your platforms

#### Configure Crashlytics Rules
```javascript
// In Firebase Console > Crashlytics > Rules
rules_version = '2';
service firebase.crashlytics {
  match /databases/{database}/documents {
    // Allow read/write access to crash reports
    match /crash_reports/{reportId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### 2. Performance Monitoring Setup

#### Enable Performance Monitoring
1. Go to "Performance" in Firebase Console
2. Click "Get started"
3. Enable Performance Monitoring
4. Configure data collection settings

#### Set up Custom Traces
The app already includes custom trace implementations:
- Order processing time
- API response times
- Screen load times
- Payment processing duration

### 3. Analytics Setup

#### Enable Google Analytics
1. Go to "Analytics" in Firebase Console
2. Click "Get started"
3. Configure Analytics settings
4. Enable enhanced measurement

#### Configure Custom Events
The app tracks these custom events:
- `app_open`: App launch
- `login`: User authentication
- `sign_up`: User registration
- `purchase`: Order completion
- `add_to_cart`: Item added to cart
- `screen_view`: Screen navigation

### 4. A/B Testing Setup (Future)

#### Enable Firebase A/B Testing
1. Go to "A/B Testing" in Firebase Console
2. Click "Get started"
3. Create your first experiment
4. Configure feature flags

#### Example A/B Test Configuration
```json
{
  "experiments": [
    {
      "name": "checkout_flow_optimization",
      "description": "Test new checkout flow design",
      "variants": [
        {
          "name": "control",
          "weight": 50,
          "config": {
            "checkout_flow": "original"
          }
        },
        {
          "name": "variant_a",
          "weight": 50,
          "config": {
            "checkout_flow": "simplified"
          }
        }
      ]
    }
  ]
}
```

## Flutter Integration

### 1. Install Firebase Dependencies

The app already includes the necessary Firebase dependencies in `pubspec.yaml`:

```yaml
dependencies:
  firebase_core: ^3.6.0
  firebase_crashlytics: ^4.1.3
  firebase_performance: ^0.10.0+8
  firebase_analytics: ^11.3.3
```

### 2. Configure Firebase Options

Update `lib/firebase_options.dart` with your actual Firebase configuration:

```dart
// Replace placeholder values with actual Firebase config
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ACTUAL_ANDROID_API_KEY',
  appId: '1:YOUR_PROJECT_NUMBER:android:YOUR_ANDROID_APP_ID',
  messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
  projectId: 'YOUR_PROJECT_ID',
  storageBucket: 'YOUR_PROJECT_ID.appspot.com',
);

static const FirebaseOptions ios = FirebaseOptions(
  apiKey: 'YOUR_ACTUAL_IOS_API_KEY',
  appId: '1:YOUR_PROJECT_NUMBER:ios:YOUR_IOS_APP_ID',
  messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
  projectId: 'YOUR_PROJECT_ID',
  storageBucket: 'YOUR_PROJECT_ID.appspot.com',
  iosBundleId: 'com.eatfast.mobile',
);
```

### 3. Initialize Firebase Services

The app already has Firebase initialization in `lib/main.dart`:

```dart
// Initialize Firebase
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

// Initialize monitoring services
await _initializeMonitoring();
```

## Platform-Specific Setup

### Android Configuration

#### 1. Download google-services.json
1. In Firebase Console, go to Project Settings
2. Select your Android app
3. Download `google-services.json`
4. Place it in `android/app/` directory

#### 2. Update build.gradle files

**android/build.gradle:**
```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.4.0'
        classpath 'com.google.firebase:firebase-crashlytics-gradle:2.9.9'
    }
}
```

**android/app/build.gradle:**
```gradle
apply plugin: 'com.google.gms.google-services'
apply plugin: 'com.google.firebase.crashlytics'

android {
    compileSdkVersion 34
    
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
    }
}

dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.7.0')
    implementation 'com.google.firebase:firebase-analytics'
    implementation 'com.google.firebase:firebase-crashlytics'
    implementation 'com.google.firebase:firebase-perf'
}
```

#### 3. Configure ProGuard (Optional)
Add to `android/app/proguard-rules.pro`:
```proguard
# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**
```

### iOS Configuration

#### 1. Download GoogleService-Info.plist
1. In Firebase Console, go to Project Settings
2. Select your iOS app
3. Download `GoogleService-Info.plist`
4. Add it to `ios/Runner/` in Xcode

#### 2. Update Podfile
```ruby
# ios/Podfile
platform :ios, '12.0'

target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(File.join(__FILE__, '..', '..', '.symlinks', 'flutter', 'packages', 'flutter', 'pubspec.yaml')))
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
  end
end
```

#### 3. Update Info.plist
Add to `ios/Runner/Info.plist`:
```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>REVERSED_CLIENT_ID</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>YOUR_REVERSED_CLIENT_ID</string>
        </array>
    </dict>
</array>
```

## Testing and Validation

### 1. Test Crashlytics

Add this test code to trigger a test crash:

```dart
// Test crash reporting (development only)
await FirebaseCrashlytics.instance.crash();
```

### 2. Test Performance Monitoring

The app includes custom traces. Monitor them in Firebase Console:
- Go to Performance > Traces
- Look for custom traces like "order_processing", "api_request"

### 3. Test Analytics

Verify events are being tracked:
- Go to Analytics > Events
- Check for custom events like "app_open", "login", "purchase"

### 4. Validate Configuration

Run the app and check logs for Firebase initialization:

```bash
flutter run --debug
```

Look for these log messages:
```
[FirebaseMonitoring] All services initialized successfully
[Main] Firebase monitoring initialized successfully
```

## Production Deployment

### 1. Environment Configuration

Update `lib/shared/config/app_config.dart` for production:

```dart
class AppConfig {
  static const bool isProduction = true;
  static const bool enableCrashlytics = true;
  static const bool enableAnalytics = true;
  static const bool enablePerformanceMonitoring = true;
}
```

### 2. Security Considerations

1. **API Keys**: Never commit actual API keys to version control
2. **Environment Variables**: Use environment variables for sensitive data
3. **Build Variants**: Use different Firebase projects for dev/staging/prod

### 3. Release Build

```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release
```

## Monitoring and Analytics

### 1. Crashlytics Dashboard

Monitor crashes in Firebase Console:
- **Crashes**: Real-time crash reports
- ** Non-fatals**: Handled exceptions
- ** ANRs**: Application Not Responding issues
- ** Custom Logs**: User-defined log messages

### 2. Performance Monitoring

Track app performance:
- **App Start Time**: Cold and warm start times
- **Screen Rendering**: Screen load performance
- **Network Requests**: API call performance
- **Custom Traces**: Business-specific metrics

### 3. Analytics Insights

Key metrics to monitor:
- **User Engagement**: DAU, MAU, session duration
- **Conversion Funnel**: Sign-up to order completion
- **Feature Usage**: Most used features
- **Geographic Data**: User distribution
- **Device Information**: Platform and device breakdown

### 4. Custom Dashboards

Create custom dashboards for:
- **Business Metrics**: Orders, revenue, user growth
- **Technical Metrics**: Crash rate, performance, API errors
- **User Behavior**: Feature adoption, retention

## Troubleshooting

### Common Issues

#### 1. Firebase Not Initializing
**Symptoms**: App crashes on startup, Firebase services not available
**Solutions**:
- Check `google-services.json` and `GoogleService-Info.plist` are in correct locations
- Verify package names match in Firebase Console and app configuration
- Check internet connectivity

#### 2. Analytics Not Tracking
**Symptoms**: No events appearing in Firebase Console
**Solutions**:
- Ensure Analytics is enabled in Firebase Console
- Check if events are being logged in debug mode
- Verify user properties are set correctly

#### 3. Crashlytics Not Reporting
**Symptoms**: Crashes not appearing in Firebase Console
**Solutions**:
- Check if Crashlytics is enabled for the correct build variant
- Verify the app is not in debug mode (Crashlytics disabled in debug)
- Check network connectivity

#### 4. Performance Data Missing
**Symptoms**: No performance traces in Firebase Console
**Solutions**:
- Ensure Performance Monitoring is enabled
- Check if custom traces are being started and stopped correctly
- Verify the app is in release mode

### Debug Commands

```bash
# Check Firebase configuration
flutter doctor

# Test Firebase connectivity
flutter run --debug --verbose

# Check Firebase logs
adb logcat | grep Firebase
```

### Support Resources

- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com/)
- [Firebase Support](https://firebase.google.com/support)

## Next Steps

1. **Complete Setup**: Follow all configuration steps
2. **Test Thoroughly**: Validate all Firebase services
3. **Monitor Closely**: Watch dashboards during initial deployment
4. **Optimize**: Use data to improve app performance and user experience
5. **Scale**: Add more Firebase services as needed (Cloud Messaging, Remote Config, etc.)

---

**Note**: This guide assumes you have administrative access to the Firebase project. If you're working in a team, ensure proper permissions are granted to all team members.
