# EatFast Mobile App - Deployment Guide

## 🚀 Deployment Overview

This guide covers the complete deployment process for the EatFast mobile app across different platforms and environments.

## 🌐 Environment Strategy

### Environment Types

| Environment | Purpose | Target Audience | Update Frequency |
|-------------|---------|-----------------|------------------|
| **Development** | Active development | Developers | Continuous |
| **Staging** | Pre-production testing | QA, Stakeholders | Daily |
| **Production** | Live app for users | End users | Weekly/Bi-weekly |

### Environment Configuration

#### Development Environment
- **API**: `http://localhost:3000/api`
- **Database**: Local PostgreSQL
- **Firebase**: `eatfast-dev` project
- **Logging**: Debug level
- **Analytics**: Disabled

#### Staging Environment
- **API**: `https://staging-api.eatfast.com/api`
- **Database**: Staging PostgreSQL
- **Firebase**: `eatfast-staging` project
- **Logging**: Info level
- **Analytics**: Test data

#### Production Environment
- **API**: `https://api.eatfast.com/api`
- **Database**: Production PostgreSQL
- **Firebase**: `eatfast-prod` project
- **Logging**: Error level
- **Analytics**: Enabled

## 📱 Mobile App Deployment

### Android Deployment

#### 1. Prepare for Release

**Configure Build Settings**
```bash
# Update version in pubspec.yaml
version: 2.1.0+21

# Update android/app/build.gradle
android {
    defaultConfig {
        versionCode 21
        versionName "2.1.0"
    }
}
```

**Generate Signing Key**
```bash
# Create keystore
keytool -genkey -v -keystore ~/eatfast-release-key.keystore \
  -alias eatfast -keyalg RSA -keysize 2048 -validity 10000

# Create key.properties file
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=eatfast
storeFile=/path/to/eatfast-release-key.keystore
```

#### 2. Build Release APK/Bundle

**Build APK (for direct distribution)**
```bash
# Build release APK
flutter build apk --release --flavor production

# Build split APKs by ABI (smaller size)
flutter build apk --release --flavor production --split-per-abi

# Output location: build/app/outputs/flutter-apk/
```

**Build App Bundle (for Play Store)**
```bash
# Build release app bundle
flutter build appbundle --release --flavor production

# Output location: build/app/outputs/bundle/productionRelease/
```

#### 3. Google Play Store Deployment

**Preparation Checklist**
- [ ] App signed with release key
- [ ] App bundle under 150MB
- [ ] Privacy policy uploaded
- [ ] App screenshots and descriptions ready
- [ ] Store listing complete
- [ ] Pricing and distribution configured

**Deployment Steps**
```bash
# 1. Build signed app bundle
flutter build appbundle --release --flavor production

# 2. Upload to Google Play Console
# - Go to Google Play Console
# - Select your app
# - Go to "Release" > "Production"
# - Upload the .aab file from build/app/outputs/bundle/

# 3. Configure release
# - Add release notes
# - Set rollout percentage (start with 5-10%)
# - Review and publish
```

**Release Types**
- **Internal Testing**: Team testing (up to 100 testers)
- **Closed Testing**: Specific user groups (up to 2,000 testers)
- **Open Testing**: Public beta (unlimited testers)
- **Production**: Live release to all users

### iOS Deployment

#### 1. Prepare for Release

**Configure iOS Settings**
```bash
# Update ios/Runner/Info.plist
<key>CFBundleVersion</key>
<string>21</string>
<key>CFBundleShortVersionString</key>
<string>2.1.0</string>
```

**Set Up Certificates**
```bash
# Install certificates from Apple Developer Portal
# - Development Certificate
# - Distribution Certificate
# - Provisioning Profiles for each environment
```

#### 2. Build Release IPA

**Build for iOS**
```bash
# Build release iOS app
flutter build ios --release --flavor production

# Archive in Xcode
# 1. Open ios/Runner.xcworkspace in Xcode
# 2. Select "Any iOS Device" as target
# 3. Product > Archive
# 4. Upload to App Store Connect
```

#### 3. App Store Deployment

**App Store Connect Setup**
1. Create app in App Store Connect
2. Configure app information
3. Upload screenshots and metadata
4. Set pricing and availability
5. Submit for review

**Deployment Process**
```bash
# 1. Upload build via Xcode or Application Loader
# 2. Configure release in App Store Connect
# 3. Submit for Apple review
# 4. Release when approved (automatic or manual)
```

## 🔄 CI/CD Pipeline

### GitHub Actions Pipeline

#### Workflow Configuration (`.github/workflows/deploy.yml`)

```yaml
name: Deploy EatFast Mobile App

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.16.0'

      - name: Install dependencies
        run: flutter pub get

      - name: Run tests
        run: flutter test

      - name: Analyze code
        run: flutter analyze

  build-android:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'

    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.16.0'

      - name: Setup Android SDK
        uses: android-actions/setup-android@v2

      - name: Install dependencies
        run: flutter pub get

      - name: Configure signing
        run: |
          echo "${{ secrets.KEYSTORE_BASE64 }}" | base64 -d > android/app/eatfast-release-key.keystore
          echo "storePassword=${{ secrets.STORE_PASSWORD }}" > android/key.properties
          echo "keyPassword=${{ secrets.KEY_PASSWORD }}" >> android/key.properties
          echo "keyAlias=eatfast" >> android/key.properties
          echo "storeFile=eatfast-release-key.keystore" >> android/key.properties

      - name: Build APK
        run: flutter build apk --release --flavor production

      - name: Build App Bundle
        run: flutter build appbundle --release --flavor production

      - name: Upload to Play Store
        uses: r0adkll/upload-google-play@v1
        with:
          serviceAccountJsonPlainText: ${{ secrets.GOOGLE_PLAY_SERVICE_ACCOUNT }}
          packageName: com.eatfast.app
          releaseFiles: build/app/outputs/bundle/productionRelease/app-production-release.aab
          track: internal
          status: completed

  build-ios:
    needs: test
    runs-on: macos-latest
    if: github.ref == 'refs/heads/main'

    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.16.0'

      - name: Install dependencies
        run: flutter pub get

      - name: Build iOS
        run: flutter build ios --release --flavor production --no-codesign

      - name: Archive and upload
        env:
          APP_STORE_CONNECT_USERNAME: ${{ secrets.APP_STORE_CONNECT_USERNAME }}
          APP_STORE_CONNECT_PASSWORD: ${{ secrets.APP_STORE_CONNECT_PASSWORD }}
        run: |
          xcodebuild -workspace ios/Runner.xcworkspace \
            -scheme Runner \
            -configuration Release \
            -archivePath build/Runner.xcarchive \
            archive

          xcodebuild -exportArchive \
            -archivePath build/Runner.xcarchive \
            -exportOptionsPlist ios/ExportOptions.plist \
            -exportPath build/
```

### Environment-Specific Deployments

#### Staging Deployment
```yaml
deploy-staging:
  runs-on: ubuntu-latest
  if: github.ref == 'refs/heads/develop'

  steps:
    - name: Build and deploy to Firebase App Distribution
      run: |
        flutter build apk --flavor staging
        firebase appdistribution:distribute \
          build/app/outputs/flutter-apk/app-staging-release.apk \
          --app ${{ secrets.FIREBASE_APP_ID_STAGING }} \
          --groups "qa-team, stakeholders"
```

#### Production Deployment
```yaml
deploy-production:
  runs-on: ubuntu-latest
  if: github.ref == 'refs/heads/main' && startsWith(github.ref, 'refs/tags/')

  steps:
    - name: Deploy to Play Store
      # Production deployment steps

    - name: Deploy to App Store
      # iOS deployment steps
```

## 🧪 Testing Before Deployment

### Pre-Deployment Checklist

#### Automated Tests
- [ ] Unit tests pass (coverage > 80%)
- [ ] Widget tests pass
- [ ] Integration tests pass
- [ ] Performance tests pass
- [ ] Security scans pass

#### Manual Testing
- [ ] Core user flows tested
- [ ] Payment flows verified
- [ ] Push notifications working
- [ ] Offline functionality tested
- [ ] Performance acceptable
- [ ] UI/UX review completed

#### Device Testing
- [ ] Multiple Android devices tested
- [ ] Multiple iOS devices tested
- [ ] Different screen sizes verified
- [ ] Various OS versions checked
- [ ] Network conditions tested

### Testing Environments

#### Firebase App Distribution
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Deploy to testers
firebase appdistribution:distribute app-release.apk \
  --app 1:123456789:android:abcd1234 \
  --groups "qa-team" \
  --release-notes "Bug fixes and performance improvements"
```

#### Internal Testing Groups
- **QA Team**: Core functionality testing
- **Stakeholders**: Business acceptance testing
- **Beta Users**: Real-world usage testing
- **Device Testing**: Hardware compatibility

## 📊 Monitoring & Analytics

### Deployment Monitoring

#### Crash Reporting
```dart
// Firebase Crashlytics setup
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kReleaseMode) {
    // Initialize crashlytics in release mode
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  runApp(MyApp());
}
```

#### Performance Monitoring
```dart
// Firebase Performance setup
class PerformanceService {
  static void trackScreen(String screenName) {
    FirebasePerformance.instance.newTrace(screenName).start();
  }

  static void trackAPICall(String endpoint) {
    final metric = FirebasePerformance.instance.newHttpMetric(
      endpoint,
      HttpMethod.Get,
    );
    metric.start();
  }
}
```

#### Analytics Setup
```dart
// Firebase Analytics
class AnalyticsService {
  static void logEvent(String name, Map<String, dynamic> parameters) {
    FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  static void setUserId(String userId) {
    FirebaseAnalytics.instance.setUserId(id: userId);
  }
}
```

### Key Metrics to Monitor

#### Technical Metrics
- App crash rate
- App launch time
- Network request success rate
- Battery usage
- Memory consumption

#### Business Metrics
- User acquisition
- User retention
- Order completion rate
- Revenue per user
- Customer satisfaction

## 🔒 Security Considerations

### Code Obfuscation
```bash
# Build with obfuscation
flutter build apk --obfuscate --split-debug-info=build/debug-info/

# Build iOS with bitcode
flutter build ios --release --obfuscate --split-debug-info=build/debug-info/
```

### API Security
```dart
// Certificate pinning
class ApiClient {
  static Dio createDio() {
    final dio = Dio();

    // Add certificate pinning in production
    if (kReleaseMode) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (cert, host, port) {
          // Implement certificate validation
          return validateCertificate(cert, host);
        };
        return client;
      };
    }

    return dio;
  }
}
```

### Data Protection
- Encrypt sensitive data at rest
- Use secure storage for tokens
- Implement certificate pinning
- Validate all API responses
- Sanitize user inputs

## 🚨 Rollback Strategy

### Rollback Plan

#### Immediate Rollback
```bash
# Play Store: Deactivate current release
# App Store: Remove from sale

# Deploy previous stable version
# Update server compatibility if needed
```

#### Gradual Rollback
1. Reduce rollout percentage to 0%
2. Fix critical issues
3. Re-test thoroughly
4. Gradually increase rollout

#### Emergency Procedures
- Hotfix deployment process
- Critical bug escalation
- Communication plan
- Monitoring intensification

## 📈 Post-Deployment

### Launch Monitoring

#### First 24 Hours
- Monitor crash rates
- Check user feedback
- Verify core functionality
- Monitor server load
- Track key metrics

#### First Week
- Analyze user behavior
- Monitor performance metrics
- Gather user feedback
- Address urgent issues
- Plan next iteration

### Continuous Improvement

#### Regular Updates
- Bug fixes and patches
- Performance optimizations
- Feature enhancements
- Security updates

#### User Feedback Integration
- App store review monitoring
- In-app feedback collection
- User survey analysis
- Customer support insights

---

**Deployment Support:**
- 🚀 DevOps Team: devops@eatfast.com
- 📱 Mobile Team: mobile@eatfast.com
- 🆘 Emergency Hotline: +1-555-DEPLOY
- 📊 Status Page: status.eatfast.com