# ⚠️ Google OAuth Configuration Required

## Status: INCOMPLETE

The Google OAuth implementation code is ready, but the Firebase configuration files are missing.

## Missing Files

### Android
**File:** `android/app/google-services.json`
**Status:** ❌ NOT FOUND

### iOS
**File:** `ios/Runner/GoogleService-Info.plist`
**Status:** ❌ NOT FOUND

## ✅ What's Already Done

1. ✅ `google_sign_in` package installed (v6.2.1)
2. ✅ Google Sign-In service implemented (`lib/shared/services/auth/google_sign_in_service.dart`)
3. ✅ Backend integration ready (`lib/shared/services/auth/unified_auth_service.dart:382`)
4. ✅ State management configured
5. ✅ AndroidManifest.xml has required permissions

## 📋 Setup Steps Required

### Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing one
3. Add Android and iOS apps

### Step 2: Android Configuration

#### 2.1 Get SHA-1 Fingerprint

```bash
cd android
./gradlew signingReport
```

Copy the **SHA-1** fingerprint from the output.

#### 2.2 Register Android App in Firebase

1. In Firebase Console, add Android app
2. Package name: `com.eatfast.eatfast_mobile` (check `android/app/build.gradle`)
3. Add the SHA-1 fingerprint
4. Download `google-services.json`
5. Place it in: `android/app/google-services.json`

#### 2.3 Verify build.gradle

Check that `android/build.gradle` has:
```gradle
dependencies {
    classpath 'com.google.gms:google-services:4.4.0'
}
```

Check that `android/app/build.gradle` has:
```gradle
apply plugin: 'com.google.gms.google-services'
```

### Step 3: iOS Configuration

#### 3.1 Register iOS App in Firebase

1. In Firebase Console, add iOS app
2. Bundle ID: `com.eatfast.eatfastMobile` (check `ios/Runner.xcodeproj/project.pbxproj`)
3. Download `GoogleService-Info.plist`
4. Open Xcode and add file to `ios/Runner/` folder

#### 3.2 Configure URL Scheme

1. Open `ios/Runner/Info.plist`
2. Add the URL scheme (get REVERSED_CLIENT_ID from GoogleService-Info.plist):

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>com.googleusercontent.apps.YOUR-REVERSED-CLIENT-ID</string>
    </array>
  </dict>
</array>
```

### Step 4: Enable Google Sign-In in Firebase

1. Go to Firebase Console > Authentication
2. Click "Sign-in method" tab
3. Enable "Google" provider
4. Save

### Step 5: Backend Configuration

Ensure your backend has:

1. Google OAuth Client ID configured
2. Token verification endpoint: `/api/auth/google-signin`
3. Google Auth Library to verify ID tokens:

```javascript
const { OAuth2Client } = require('google-auth-library');
const client = new OAuth2Client(GOOGLE_CLIENT_ID);

async function verifyGoogleToken(idToken) {
  const ticket = await client.verifyIdToken({
    idToken: idToken,
    audience: GOOGLE_CLIENT_ID,
  });
  const payload = ticket.getPayload();
  return payload;
}
```

### Step 6: Test

1. Run the app: `flutter run`
2. Go to Login screen
3. Tap "Sign in with Google" button
4. Verify Google account picker appears
5. Complete sign-in flow

## 🔐 Security Notes

**DO NOT commit these files to git:**
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

Add them to `.gitignore`:
```
# Firebase
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
ios/firebase_app_id_file.json
```

## 📚 References

- [Google Sign-In for Flutter](https://pub.dev/packages/google_sign_in)
- [Firebase Setup Guide](https://firebase.google.com/docs/flutter/setup)
- [Google OAuth Setup](https://developers.google.com/identity/protocols/oauth2)

## ✅ Verification Checklist

After setup, verify:

- [ ] `google-services.json` exists in `android/app/`
- [ ] `GoogleService-Info.plist` exists in `ios/Runner/`
- [ ] SHA-1 fingerprint added to Firebase Console
- [ ] Google Sign-In enabled in Firebase Authentication
- [ ] URL scheme added to iOS Info.plist
- [ ] Backend endpoint `/api/auth/google-signin` works
- [ ] Google Sign-In button appears in Login screen
- [ ] Sign-in flow works on Android
- [ ] Sign-in flow works on iOS

---

**Status:** ⚠️ SETUP REQUIRED BEFORE PRODUCTION
**Priority:** HIGH
**Estimated Time:** 30 minutes
