# EatFast Mobile App - Setup Guide

## Prerequisites

- Flutter SDK (3.16.0 or higher)
- Dart SDK (3.2.0 or higher)
- Android Studio / VS Code
- Git

## Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd eatfatsApp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Place `google-services.json` in `android/app/`
   - Place `GoogleService-Info.plist` in `ios/Runner/`

4. **Configure Google OAuth**
   - Follow the guide in `GOOGLE_OAUTH_INTEGRATION.md`

## Running the App

### Development
```bash
flutter run
```

### Release Build
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## Environment Configuration

The app uses different configurations for development and production:

- **Development**: Uses mock data and test APIs
- **Production**: Uses live APIs and real services

## Troubleshooting

### Common Issues

1. **Build errors**: Run `flutter clean && flutter pub get`
2. **Android back button not working**: Check `android/app/src/main/AndroidManifest.xml`
3. **Encoding issues**: Run `python fix_encoding.py`

### Support

For issues and questions, please check the troubleshooting section or contact the development team.
