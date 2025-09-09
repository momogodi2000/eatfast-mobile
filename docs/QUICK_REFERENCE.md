# EatFast App Quick Reference Guide

This document provides quick reference commands for common tasks when developing and deploying the EatFast application.

## Mobile App Development (Flutter)

### Setup & Development

```bash
# Get dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app in debug mode
flutter run

# Run on specific device
flutter run -d <device_id>
flutter devices  # List available devices
```

### Testing

```bash
# Run all tests
flutter test

# Run a specific test file
flutter test test/path/to/test_file.dart

# Run with coverage
flutter test --coverage
```

### Building

```bash
# Build debug APK
flutter build apk --debug

# Build release APK
flutter build apk --release
# OR use the script
.\build_test_apk.bat

# Build app bundle for Play Store
.\build_release.bat appbundle

# Build iOS app for App Store
.\build_release.bat ios

# Clean build cache
.\clean_build.bat
```

## Backend Development (Node.js)

### Setup & Development

```bash
# Install dependencies
cd eatfast-backend
npm install

# Run in development mode
npm run dev

# Run with Docker
cd eatfast-backend/docker
docker-compose -f docker-compose.dev.yml up -d
```

### Testing

```bash
# Run tests
npm test

# Run with coverage
npm run test:coverage
```

### Deployment

```bash
# Deploy to production
cd eatfast-backend
./deploy.sh

# Setup monitoring
./setup-monitoring.sh
```

## Web Frontend Development

```bash
# Install dependencies
cd eatfast-web
npm install

# Run development server
npm run dev

# Build for production
npm run build

# Run linting
npm run lint
```

## Docker Commands

```bash
# Start development environment
docker-compose -f docker-compose.dev.yml up -d

# Start with monitoring
docker-compose -f docker-compose.monitoring.yml up -d

# View logs
docker logs <container-name>

# Stop all containers
docker-compose down

# Rebuild containers
docker-compose build --no-cache
```

## Database Management

```bash
# Access SQLite database
cd eatfast-backend
sqlite3 database/eatfast.db

# Common SQLite commands
.tables                # List all tables
.schema <table_name>   # Show table schema
SELECT * FROM <table>; # Query data
.quit                  # Exit SQLite
```

## Helpful Scripts

- `start_dev_environment.bat` - Interactive menu to start various development environments
- `build_release.bat` - Build mobile app for release
- `build_test_apk.bat` - Generate universal APK for testing
- `clean_build.bat` - Clean Flutter cache and dependencies

## Documentation

- Local Development Guide: `docs/LOCAL_DEVELOPMENT_GUIDE.md`
- Production Deployment Guide: `docs/PRODUCTION_DEPLOYMENT_GUIDE.md`
- API Documentation: Available at `http://localhost:3000/api-docs` when backend is running
- Backend Specification: `eatfast-backend/docs/Food Delivery App - Complete Backend Specification.pdf`

## Environment Variables

Check the following files for environment configuration:
- Backend: `eatfast-backend/config/config.js`
- Web Frontend: `eatfast-web/env.example` (copy to `.env` for local development)
- Mobile App: `eatfast-mobile/lib/config/api_config.dart`

## Production URLs

- Backend API: `https://eat-fast-backend-express-js.onrender.com`
- Web Frontend: [Deployed URL - Add when available]
