# EatFast Mobile - Production Deployment Guide

## 📋 Pre-Deployment Checklist

### 1. Environment Configuration

#### Update API Base URL
Edit `lib/core/constants/api_constants.dart`:
```dart
static const String baseUrl = 'https://your-production-api.com/api/v1';
```

#### Configure App Config
Edit `lib/core/config/app_config.dart`:
```dart
static const bool enableDebugMode = false;
static const bool enableAPILogging = false; // Disable in production
```

### 2. Android Production Build

#### Step 1: Create Keystore
```bash
keytool -genkey -v -keystore android/keystore/eatfast-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias eatfast-key
```

#### Step 2: Configure Signing
Create `android/key.properties`:
```properties
storePassword=YOUR_KEYSTORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=eatfast-key
storeFile=../keystore/eatfast-release-key.jks
```

⚠️ **IMPORTANT**: Add `key.properties` to `.gitignore`

#### Step 3: Build Release APK
```bash
flutter build apk --release --split-per-abi
```

#### Step 4: Build App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

**Output Location:**
- APK: `build/app/outputs/flutter-apk/app-arm64-v8a-release.apk`
- Bundle: `build/app/outputs/bundle/release/app-release.aab`

### 3. iOS Production Build

#### Step 1: Configure Xcode
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner target
3. Update Bundle Identifier: `com.eatfast.mobile`
4. Configure Signing & Capabilities
5. Select your Team and Provisioning Profile

#### Step 2: Update Info.plist Permissions
Ensure these keys are present in `ios/Runner/Info.plist`:
- `NSLocationWhenInUseUsageDescription`
- `NSCameraUsageDescription`
- `NSPhotoLibraryUsageDescription`
- `NSMicrophoneUsageDescription`

#### Step 3: Build Release IPA
```bash
flutter build ios --release
```

Then archive and distribute via Xcode or:
```bash
flutter build ipa --release
```

### 4. Google Maps API Configuration

#### Android
1. Get API Key from [Google Cloud Console](https://console.cloud.google.com)
2. Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
```

#### iOS
Add to `ios/Runner/AppDelegate.swift`:
```swift
GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
```

### 5. Payment Gateway Configuration

#### Backend Setup Required
Ensure your Express.js backend has:
- CamPay integration configured
- NouPay API credentials
- MTN Mobile Money API setup
- Orange Money API setup
- Stripe (optional for card payments)

**Mobile App**: No additional configuration needed - uses backend endpoints

### 6. Push Notifications Setup

#### Android
1. Configure notification channels in `AndroidManifest.xml`
2. Add notification icons to `android/app/src/main/res/`

#### iOS
1. Enable Push Notifications in Xcode Capabilities
2. Upload APNs certificate to backend server

**Note**: This app uses native web push via backend (NO Firebase required)

### 7. Store Listing Preparation

#### Google Play Store
**Required Assets:**
- App Icon: 512x512px (already configured)
- Feature Graphic: 1024x500px
- Screenshots: 16:9 or 9:16 ratio (min 2, max 8)
- Privacy Policy URL
- Content Rating questionnaire

**Store Listing:**
- Title: EatFast - Food Delivery
- Short Description: Fast and reliable food delivery in Cameroon
- Full Description: See below

#### Apple App Store
**Required Assets:**
- App Icon: 1024x1024px
- Screenshots: iPhone 6.7", 6.5", 5.5"
- App Preview videos (optional)
- Privacy Policy URL
- Export Compliance

### 8. Testing Checklist

✅ **Functional Testing:**
- [ ] User registration and login
- [ ] Guest mode functionality
- [ ] Restaurant browsing and search
- [ ] Cart management
- [ ] MTN/Orange Money payments
- [ ] Order placement and tracking
- [ ] Push notifications
- [ ] Profile management
- [ ] Address picker with Google Maps
- [ ] Loyalty program
- [ ] Promo codes

✅ **Platform Testing:**
- [ ] Tested on Android 5.0+ (API 21+)
- [ ] Tested on iOS 12.0+
- [ ] Tested on various screen sizes
- [ ] Tested on slow networks
- [ ] Tested offline mode

✅ **Performance Testing:**
- [ ] App startup time < 3 seconds
- [ ] Smooth 60fps animations
- [ ] Image loading optimized
- [ ] No memory leaks

## 🚀 Deployment Steps

### Google Play Store

1. **Create App in Console**
   - Go to [Google Play Console](https://play.google.com/console)
   - Create new app
   - Fill in store listing details

2. **Upload Build**
   - Go to Production → Releases
   - Create new release
   - Upload `app-release.aab`
   - Add release notes

3. **Complete Store Listing**
   - Add screenshots
   - Set content rating
   - Set pricing (Free)
   - Select countries (Cameroon + others)

4. **Submit for Review**
   - Review and publish

### Apple App Store

1. **App Store Connect**
   - Go to [App Store Connect](https://appstoreconnect.apple.com)
   - Create new app
   - Fill in app information

2. **Upload Build**
   - Use Xcode or Transporter app
   - Upload IPA file
   - Wait for processing (10-30 mins)

3. **Complete Metadata**
   - Add screenshots
   - Write description
   - Set age rating
   - Add privacy policy

4. **Submit for Review**
   - Submit app for review
   - Typical review time: 1-3 days

## 📱 App Store Descriptions

### Short Description (80 chars)
Fast and reliable food delivery from your favorite restaurants in Cameroon.

### Full Description

**🍔 EatFast - Your Ultimate Food Delivery Experience**

Order delicious meals from the best restaurants in Cameroon with just a few taps. EatFast brings you fast, reliable food delivery with real-time tracking and secure mobile money payments.

**✨ Key Features:**
- 🏪 Browse hundreds of local restaurants
- 🍕 Extensive menu selection
- 📍 Real-time order tracking with maps
- 💰 Secure payments via MTN, Orange Money, or Cash
- 🎁 Loyalty rewards program
- 🎟️ Promo codes and special offers
- 👤 Guest checkout (no account required)
- 🌐 Available in English and French
- 🌙 Dark mode support

**💳 Payment Methods:**
- MTN Mobile Money
- Orange Money
- Cash on Delivery

**📞 Customer Support:**
- Email: contact@eatfast-cameroun.com
- Phone: +237 6 XX XX XX XX
- WhatsApp: Available

**🔐 Privacy & Security:**
Your data is protected with industry-standard security measures. We never share your personal information.

**🌍 Service Areas:**
Currently available in Yaoundé, Douala, Bafoussam, and Bamenda.

Download EatFast today and enjoy delicious meals delivered right to your door!

## 🔧 Post-Deployment

### Monitoring
1. **Crash Reporting**: Monitor via backend `/shared/mvp/crash-reports` endpoint
2. **Analytics**: Check backend analytics dashboard
3. **User Feedback**: Monitor store reviews and ratings

### Updates
To release updates:
```bash
# Update version in pubspec.yaml
version: 1.1.0+2  # version+buildNumber

# Build and upload new version
flutter build appbundle --release  # Android
flutter build ipa --release        # iOS
```

### Support
For technical issues or questions:
- Documentation: `/docs` folder
- Backend API: Check `docs/backend-docs/`
- Contact: dev@eatfast-cameroun.com

## 🎉 Success Criteria

Your app is ready for production when:
- ✅ All tests passing (94%+ coverage)
- ✅ No critical bugs
- ✅ Backend API fully integrated
- ✅ Payment gateways configured and tested
- ✅ Google Maps working
- ✅ Push notifications functional
- ✅ App size < 50MB
- ✅ Store listings complete

---

**Version:** 1.0.0
**Last Updated:** 2025-01-12
**Platform:** Flutter 3.8.1+
**Minimum OS:** Android 5.0 (API 21), iOS 12.0
