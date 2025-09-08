#!/bin/bash
# EatFast Mobile App Build Script

set -e

echo "🍔 EatFast Mobile App Build Script"
echo "=================================="

# Configuration
PROJECT_ROOT="$(dirname "$0")/.."
BUILD_TYPE="${1:-release}"
PLATFORM="${2:-android}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    log_error "Flutter is not installed or not in PATH"
    exit 1
fi

# Navigate to project root
cd "$PROJECT_ROOT"

log_info "Checking Flutter environment..."
flutter doctor

log_info "Getting dependencies..."
flutter pub get

log_info "Running code generation..."
flutter packages pub run build_runner build --delete-conflicting-outputs

log_info "Running tests..."
flutter test

log_info "Analyzing code..."
flutter analyze

log_info "Building $BUILD_TYPE build for $PLATFORM..."

case "$PLATFORM" in
    android)
        case "$BUILD_TYPE" in
            debug)
                flutter build apk --debug
                ;;
            release)
                flutter build apk --release
                ;;
            appbundle)
                flutter build appbundle --release
                ;;
            *)
                log_error "Unknown build type: $BUILD_TYPE"
                exit 1
                ;;
        esac
        ;;
    ios)
        case "$BUILD_TYPE" in
            debug)
                flutter build ios --debug
                ;;
            release)
                flutter build ios --release
                ;;
            *)
                log_error "Unknown build type: $BUILD_TYPE"
                exit 1
                ;;
        esac
        ;;
    web)
        flutter build web --release
        ;;
    *)
        log_error "Unknown platform: $PLATFORM"
        exit 1
        ;;
esac

log_info "Build completed successfully!"

# Show build artifacts location
case "$PLATFORM" in
    android)
        echo "📱 Android APK: build/app/outputs/flutter-apk/"
        echo "📱 Android App Bundle: build/app/outputs/bundle/release/"
        ;;
    ios)
        echo "📱 iOS build: build/ios/Release-iphoneos/"
        ;;
    web)
        echo "🌐 Web build: build/web/"
        ;;
esac

log_info "Build script completed!"