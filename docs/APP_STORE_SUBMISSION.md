# App Store Submission Guide

This guide provides step-by-step instructions for submitting the Eat Fast mobile app to both Google Play Store and Apple App Store.

## Prerequisites

Before submitting, ensure you have:

1. ✅ Completed all optimization steps from RELEASE_OPTIMIZATION.md
2. ✅ Created and placed app icon assets (1024x1024 PNG)
3. ✅ Created splash screen assets
4. ✅ Generated release builds using build_release.sh or build_release.bat
5. ✅ Prepared app store screenshots (various device sizes)
6. ✅ Completed privacy policy and terms of service
7. ✅ Set up developer accounts (Google Play Console & Apple Developer Program)

## Google Play Store Submission

### Step 1: Prepare Release Build
```bash
# Generate Android App Bundle (recommended)
flutter build appbundle --release

# Or generate APK
flutter build apk --release
```

### Step 2: Create Play Store Listing
1. Go to [Google Play Console](https://play.google.com/console/)
2. Create new app or update existing one
3. Fill in app details:
   - **App name**: Eat Fast
   - **Short description**: Fast food delivery in Cameroon
   - **Full description**: Use the enhanced description from pubspec.yaml
   - **App icon**: 512x512 PNG (will be generated automatically)
   - **Feature graphic**: 1024x500 PNG
   - **Screenshots**: 2-8 screenshots (phone: 1080x1920, tablet: 1200x1920)

### Step 3: Store Settings
- **Category**: Food & Drink
- **Content rating**: Everyone or Teen (based on content)
- **Contact details**: Your business contact information
- **Privacy policy**: Link to your hosted privacy policy
- **Terms of service**: Link to your hosted terms

### Step 4: Release Management
1. Upload App Bundle or APK
2. Set release notes (changelog)
3. Choose release track (Internal, Alpha, Beta, Production)
4. Publish to production when ready

## Apple App Store Submission

### Step 1: Prepare Release Build
```bash
# Generate iOS build
flutter build ios --release

# Archive for App Store (requires Xcode)
# Open ios/Runner.xcworkspace in Xcode
# Product > Archive
```

### Step 2: Create App Store Connect Listing
1. Go to [App Store Connect](https://appstoreconnect.apple.com/)
2. Create new app or update existing one
3. Fill in app details:
   - **App name**: Eat Fast
   - **Subtitle**: Fast Food Delivery
   - **Description**: Use the enhanced description from pubspec.yaml
   - **Keywords**: food delivery, Cameroon, restaurant, fast food
   - **Support URL**: Your website or support page
   - **Marketing URL**: Optional promotional page

### Step 3: App Information
- **Bundle ID**: com.eatfast.mobile
- **SKU**: EATFAST001
- **Apple ID**: Will be assigned automatically
- **Primary Category**: Food & Drink
- **Secondary Category**: Lifestyle (optional)

### Step 4: Prepare Assets
- **App Icon**: 1024x1024 PNG (will be generated automatically)
- **Screenshots**: 
  - iPhone 6.5" Display: 1242x2688
  - iPhone 5.5" Display: 1242x2208
  - iPad Pro 12.9": 2048x2732
  - iPad Pro 11": 1668x2388

### Step 5: Pricing and Availability
- **Price**: Set your app price or Free
- **Availability**: All countries or specific regions
- **Education Store**: No (unless educational)

### Step 6: Submit for Review
1. Upload build from Xcode Archive
2. Fill in version information and what's new
3. Answer content rights questions
4. Submit for review

## Common Issues and Solutions

### Android Issues
- **App Bundle rejected**: Ensure minSdkVersion >= 21
- **Missing 64-bit support**: Include both 32-bit and 64-bit architectures
- **Privacy policy required**: Must be hosted online and linked

### iOS Issues
- **Bundle ID mismatch**: Ensure matches pubspec.yaml ios:bundle_id
- **Missing app icon**: Ensure 1024x1024 PNG is properly configured
- **Guideline violations**: Review App Store guidelines before submission

## Post-Submission Checklist

- [ ] Monitor app review status
- [ ] Prepare for user feedback and updates
- [ ] Set up crash reporting (Firebase Crashlytics recommended)
- [ ] Plan for regular updates and maintenance
- [ ] Consider beta testing programs

## Additional Resources

- [Google Play Launch Checklist](https://developer.android.com/distribute/best-practices/launch/launch-checklist)
- [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [Flutter Deployment Documentation](https://flutter.dev/docs/deployment/android)
- [Flutter iOS Deployment](https://flutter.dev/docs/deployment/ios)

## Support

If you encounter issues during submission:
1. Check the official documentation links above
2. Review error messages carefully
3. Ensure all assets meet size and format requirements
4. Test builds on physical devices before submission
