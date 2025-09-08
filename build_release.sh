# Eat Fast Mobile App - Build Scripts

# Build APK for Android
build_apk() {
    echo "Building APK..."
    flutter clean
    flutter pub get
    flutter build apk --release --split-per-abi
    echo "APK built successfully!"
    echo "Output: build/app/outputs/flutter-apk/"
}

# Build App Bundle for Android (recommended for Play Store)
build_appbundle() {
    echo "Building App Bundle..."
    flutter clean
    flutter pub get
    flutter build appbundle --release
    echo "App Bundle built successfully!"
    echo "Output: build/app/outputs/bundle/release/"
}

# Build IPA for iOS
build_ios() {
    echo "Building iOS..."
    flutter clean
    flutter pub get
    flutter build ios --release
    echo "iOS build completed!"
    echo "Output: build/ios/iphoneos/"
}

# Build Web
build_web() {
    echo "Building Web..."
    flutter clean
    flutter pub get
    flutter build web --release
    echo "Web build completed!"
    echo "Output: build/web/"
}

# Generate app icons
generate_icons() {
    echo "Generating app icons..."
    flutter pub run flutter_launcher_icons
    echo "Icons generated successfully!"
}

# Generate splash screen
generate_splash() {
    echo "Generating splash screen..."
    flutter pub run flutter_native_splash:create
    echo "Splash screen generated successfully!"
}

# Full release build (Android)
full_release() {
    echo "Starting full release build..."
    generate_icons
    generate_splash
    build_appbundle
    echo "Full release build completed!"
}

# Show usage
usage() {
    echo "Usage: $0 {apk|appbundle|ios|web|icons|splash|full}"
    echo ""
    echo "Commands:"
    echo "  apk       - Build APK for Android"
    echo "  appbundle - Build App Bundle for Android (recommended)"
    echo "  ios       - Build IPA for iOS"
    echo "  web       - Build for Web"
    echo "  icons     - Generate app icons"
    echo "  splash    - Generate splash screen"
    echo "  full      - Full release build (icons + splash + appbundle)"
    exit 1
}

# Main script logic
case "$1" in
    apk)
        build_apk
        ;;
    appbundle)
        build_appbundle
        ;;
    ios)
        build_ios
        ;;
    web)
        build_web
        ;;
    icons)
        generate_icons
        ;;
    splash)
        generate_splash
        ;;
    full)
        full_release
        ;;
    *)
        usage
        ;;
esac
