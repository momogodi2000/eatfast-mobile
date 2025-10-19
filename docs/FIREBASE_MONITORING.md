# Firebase Monitoring Setup Guide

## Overview

EatFast Mobile uses Firebase for comprehensive application monitoring, including crash reporting, performance monitoring, and analytics. This guide explains the setup, configuration, and usage of Firebase monitoring services.

## Components

### 1. Firebase Crashlytics
Automatic crash reporting and error tracking in production.

### 2. Firebase Performance Monitoring
Real-time performance metrics for app responsiveness and network requests.

### 3. Firebase Analytics
User behavior tracking and app usage insights.

## Setup Instructions

### Step 1: Firebase Project Configuration

1. **Run Flutter Fire Configure**:
   ```bash
   flutter pub add firebase_core
   flutterfire configure
   ```

2. **Select Your Firebase Project**:
   - Choose existing project or create new one
   - Select platforms: Android, iOS, Web
   - Configuration will be saved to `lib/firebase_options.dart`

### Step 2: Update Firebase Options

The `lib/firebase_options.dart` file currently contains placeholder values. Replace them with your actual Firebase project configuration:

```dart
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ANDROID_API_KEY',
  appId: '1:YOUR_PROJECT_NUMBER:android:YOUR_ANDROID_APP_ID',
  messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
  projectId: 'YOUR_PROJECT_ID',
  storageBucket: 'YOUR_PROJECT_ID.appspot.com',
);
```

### Step 3: Initialize Firebase

Firebase is automatically initialized in `lib/main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _initializeMonitoring();

  runApp(const ProviderScope(child: EatFastApp()));
}
```

## Firebase Monitoring Service

### Location
`lib/core/monitoring/firebase_monitoring_service.dart`

### Features

#### Crash Reporting
```dart
final monitoring = FirebaseMonitoringService();

// Log an error
await monitoring.logError(
  exception,
  stackTrace,
  reason: 'User action failed',
  additionalInfo: {'userId': '12345', 'action': 'checkout'},
  fatal: false,
);

// Set user identifier
await monitoring.setUserIdentifier(userId);

// Log custom message
await monitoring.log('User completed onboarding');
```

#### Performance Monitoring
```dart
// Start a custom trace
final trace = await monitoring.startTrace('checkout_flow');
// ... perform operations ...
await monitoring.stopTrace(trace);

// Monitor HTTP requests
final metric = await monitoring.startHttpMetric(
  'https://api.eatfast.com/orders',
  HttpMethod.Post,
);
// ... make request ...
await monitoring.stopHttpMetric(
  metric,
  responseCode: 200,
  requestPayloadSize: 1024,
  responsePayloadSize: 2048,
);
```

#### Analytics
```dart
// Log custom events
await monitoring.logEvent(
  name: 'item_added_to_cart',
  parameters: {
    'item_id': 'burger_123',
    'item_name': 'Deluxe Burger',
    'price': 12.99,
  },
);

// Log screen views
await monitoring.logScreenView(
  screenName: 'RestaurantDetails',
  screenClass: 'RestaurantDetailsScreen',
);

// Log purchase
await monitoring.logPurchase(
  value: 25.99,
  currency: 'XAF',
  transactionId: 'txn_abc123',
  items: {
    'items': ['burger', 'fries'],
    'restaurant_id': 'rest_456',
  },
);

// Log user login
await monitoring.logLogin('email');

// Log sign up
await monitoring.logSignUp('google');
```

## Environment-Based Configuration

### Development Mode
- Crashlytics is **disabled** (no crash reports sent)
- Performance monitoring is **disabled**
- Analytics is **disabled**

### Release Mode (Production)
- Crashlytics is **enabled**
- Performance monitoring is **enabled**
- Analytics is **enabled**

## Best Practices

### 1. Error Logging
- Always include context in error logs (user ID, action, screen)
- Use `fatal: true` only for critical errors
- Log custom keys for debugging: `setCustomKey('feature', 'checkout')`

### 2. Performance Monitoring
- Create traces for critical user flows (checkout, login, search)
- Monitor network requests to backend APIs
- Keep trace names consistent and descriptive

### 3. Analytics
- Log meaningful user actions (purchases, searches, favorites)
- Use consistent event naming conventions
- Include relevant parameters for segmentation
- Respect user privacy - avoid logging PII

### 4. User Identification
```dart
// Set user ID when user logs in
await FirebaseMonitoringService().setUserIdentifier(user.id);

// Clear user ID on logout
await FirebaseMonitoringService().setUserIdentifier('');
```

## Monitoring Dashboard

### Firebase Console
Access your monitoring data at: `https://console.firebase.google.com`

#### Crashlytics Dashboard
- View crash-free users percentage
- Analyze crash reports with stack traces
- Filter by version, device, OS
- Track crash trends over time

#### Performance Dashboard
- Monitor app start time
- Track screen rendering performance
- Analyze network request latency
- View performance by device/OS

#### Analytics Dashboard
- View user engagement metrics
- Track conversion funnels
- Analyze user demographics
- Monitor retention rates

## Testing

### Test Crashlytics (Debug Mode Only)
```dart
await FirebaseMonitoringService().testCrash();
```

**Note**: This method is only available in debug mode and will not execute in production.

### Verify Setup
1. Run app in debug mode
2. Check console output for initialization messages:
   ```
   [FirebaseMonitoring] All services initialized successfully
   [Main] Firebase monitoring initialized successfully
   ```

## Troubleshooting

### Issue: Crashes not appearing in console
- **Solution**: Crashes only appear in release builds. Use `flutter build apk --release` or TestFlight/Play Store builds.

### Issue: Performance data not showing
- **Solution**: Ensure app is in release mode. Performance monitoring is disabled in debug builds.

### Issue: Analytics events not logging
- **Solution**: Check that `kReleaseMode` is true. Events are only sent in production.

### Issue: Firebase initialization fails
- **Solution**: Verify `firebase_options.dart` has correct project configuration. Run `flutterfire configure` again.

## Dependencies

```yaml
dependencies:
  firebase_core: ^3.6.0
  firebase_crashlytics: ^4.1.3
  firebase_performance: ^0.10.0+8
  firebase_analytics: ^11.3.3
```

## Security Considerations

1. **API Keys**: Firebase API keys in `firebase_options.dart` are safe to commit - they're client-side keys with restrictions configured in Firebase Console.

2. **User Privacy**:
   - Do not log sensitive user information
   - Anonymize user IDs if required by privacy policy
   - Provide opt-out mechanism for analytics if needed

3. **Data Retention**: Configure data retention policies in Firebase Console according to your privacy requirements.

## Next Steps

1. Run `flutterfire configure` to set up Firebase project
2. Update `firebase_options.dart` with actual project values
3. Test in debug mode to verify setup
4. Build release version and deploy to beta testers
5. Monitor Firebase dashboards for crash reports and analytics

## Resources

- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev)
- [Crashlytics Best Practices](https://firebase.google.com/docs/crashlytics/best-practices)
- [Performance Monitoring Guide](https://firebase.google.com/docs/perf-mon)
- [Analytics Events Reference](https://firebase.google.com/docs/analytics/events)
