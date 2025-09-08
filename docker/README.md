# EatFast Mobile App - Deployment & DevOps

This directory contains all deployment configurations, build scripts, and DevOps utilities for the EatFast mobile application.

## 📁 Directory Structure

```
docker/
├── Dockerfile              # Flutter build environment
├── docker-compose.yml      # Multi-environment orchestration
├── .env.example            # Environment variables template
├── build.sh               # Build script for all platforms
├── run.sh                 # Development runner script
└── README.md              # This file
```

## 🚀 Quick Start

### 1. Environment Setup

Copy the environment template and configure your values:

```bash
cp docker/.env.example docker/.env
# Edit docker/.env with your configuration
```

### 2. Development Mode

Start the development server:

```bash
# Using the run script (recommended)
cd docker
chmod +x run.sh
./run.sh dev chrome

# Or using Docker Compose
docker-compose --profile dev up flutter-dev
```

### 3. Production Build

Build for production:

```bash
# Using the build script (recommended)
cd docker
chmod +x build.sh
./build.sh release android

# Or using Docker Compose
docker-compose --profile build up flutter-build
```

## 🛠️ Available Scripts

### Build Script (`build.sh`)

Comprehensive build script supporting multiple platforms and build types.

```bash
./build.sh [BUILD_TYPE] [PLATFORM]

# Examples:
./build.sh release android    # Android APK
./build.sh debug android      # Debug APK
./build.sh appbundle android  # Android App Bundle
./build.sh release ios        # iOS Release
./build.sh release web        # Web Build
```

### Run Script (`run.sh`)

Development and utility runner script.

```bash
./run.sh [MODE] [DEVICE]

# Examples:
./run.sh dev chrome           # Development on Chrome
./run.sh prod                 # Production mode
./run.sh test                 # Run tests
./run.sh analyze              # Code analysis
./run.sh clean                # Clean project
./run.sh web                  # Web development server
./run.sh doctor               # Flutter doctor
./run.sh devices              # List available devices
```

## 🐳 Docker Services

### Development (`flutter-dev`)

```bash
docker-compose --profile dev up flutter-dev
```

Features:
- Hot reload enabled
- Local API connection
- Web server on port 8080
- Volume mounted for live code changes

### Build (`flutter-build`)

```bash
docker-compose --profile build up flutter-build
```

Features:
- Production APK build
- Optimized for release
- Output exported to host

### Testing (`flutter-test`)

```bash
docker-compose --profile test up flutter-test
```

Features:
- Complete test suite
- Code coverage reporting
- CI/CD ready

### Code Analysis (`flutter-analyze`)

```bash
docker-compose --profile analyze up flutter-analyze
```

Features:
- Static code analysis
- Format checking
- Linting validation

## 🌍 Environment Configuration

### API Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `API_BASE_URL` | Production API URL | `https://eat-fast-backend-express-js.onrender.com/api` |
| `SOCKET_URL` | WebSocket server URL | `https://eat-fast-backend-express-js.onrender.com` |
| `DEV_API_BASE_URL` | Development API URL | `http://localhost:3000/api` |

### Build Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `FLUTTER_BUILD_MODE` | Build mode | `release` |
| `FLUTTER_TARGET_PLATFORM` | Target platform | `android` |
| `APP_NAME` | Application name | `EatFast` |
| `APP_VERSION` | App version | `1.0.0` |

### External Services

| Variable | Description | Required |
|----------|-------------|----------|
| `FIREBASE_PROJECT_ID` | Firebase project ID | Yes (for notifications) |
| `GOOGLE_MAPS_API_KEY` | Google Maps API key | Yes (for location) |
| `GOOGLE_OAUTH_CLIENT_ID` | Google OAuth client ID | Yes (for social login) |

## 📱 Platform-Specific Builds

### Android

```bash
# Debug APK
./build.sh debug android

# Release APK
./build.sh release android

# App Bundle (for Play Store)
./build.sh appbundle android
```

Build artifacts:
- APK: `build/app/outputs/flutter-apk/`
- App Bundle: `build/app/outputs/bundle/release/`

### iOS

```bash
# Debug build
./build.sh debug ios

# Release build
./build.sh release ios
```

Build artifacts:
- iOS build: `build/ios/Release-iphoneos/`

### Web

```bash
# Web build
./build.sh release web
```

Build artifacts:
- Web build: `build/web/`

---

**EatFast Mobile - Cameroon's Premier Food Delivery App** 🍔🇨🇲