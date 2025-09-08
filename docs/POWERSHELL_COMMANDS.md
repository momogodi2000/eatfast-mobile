# PowerShell Commands for EatFast Mobile Development

## Overview
This guide provides Windows PowerShell-specific commands for Flutter development, replacing bash-style commands that don't work in PowerShell.

---

## ❌ Commands That Don't Work in PowerShell

### The Problem
PowerShell uses different command separators than bash/cmd:

```powershell
# ❌ This DOESN'T work in PowerShell:
cd "E:\Eat Fast App\eatfast-mobile" && flutter analyze
# Error: The token '&&' is not a valid statement separator
```

---

## ✅ Correct PowerShell Commands

### Basic Commands

#### Navigate and Run Flutter Analyze
```powershell
# Method 1: Semicolon separator
cd "E:\Eat Fast App\eatfast-mobile"; flutter analyze

# Method 2: Separate commands
cd "E:\Eat Fast App\eatfast-mobile"
flutter analyze

# Method 3: Using PowerShell build script (RECOMMENDED)
.\build_release.ps1 -Command analyze
```

#### Flutter Commands
```powershell
# Get dependencies
flutter pub get

# Run code generation
flutter packages pub run build_runner build --delete-conflicting-outputs

# Run app
flutter run

# Build APK
flutter build apk --release

# Clean project
flutter clean
```

---

## 🚀 Using the PowerShell Build Script (Recommended)

### Available Commands

#### Analyze Code
```powershell
.\build_release.ps1 -Command analyze
```

#### Build APK
```powershell
.\build_release.ps1 -Command apk
```

#### Build App Bundle (Play Store)
```powershell
.\build_release.ps1 -Command appbundle
```

#### Build for iOS
```powershell
.\build_release.ps1 -Command ios
```

#### Build for Web
```powershell
.\build_release.ps1 -Command web
```

#### Generate App Icons
```powershell
.\build_release.ps1 -Command icons
```

#### Generate Splash Screen
```powershell
.\build_release.ps1 -Command splash
```

#### Clean Project
```powershell
.\build_release.ps1 -Command clean
```

#### Full Release Build
```powershell
.\build_release.ps1 -Command full
```

---

## 🔧 PowerShell-Specific Development Commands

### Project Setup
```powershell
# Navigate to project directory
cd "E:\Eat Fast App\eatfast-mobile"

# Install dependencies
flutter pub get

# Generate code files
flutter packages pub run build_runner build --delete-conflicting-outputs

# Check for issues
flutter analyze lib --no-fatal-infos
```

### Development Workflow
```powershell
# Start development server
flutter run

# Hot reload (while app is running)
# Press 'r' in the terminal

# Hot restart (while app is running)  
# Press 'R' in the terminal

# Quit app (while app is running)
# Press 'q' in the terminal
```

### Testing Commands
```powershell
# Run all tests
flutter test

# Run specific test file
flutter test test/features/restaurants/restaurant_models_test.dart

# Run tests with coverage
flutter test --coverage

# View coverage report (after running with --coverage)
Start-Process "coverage\lcov-report\index.html"
```

### Build Commands
```powershell
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# Split APK per ABI (recommended)
flutter build apk --release --split-per-abi

# App Bundle for Play Store
flutter build appbundle --release
```

### Maintenance Commands
```powershell
# Check for outdated packages
flutter pub outdated

# Upgrade packages
flutter pub upgrade

# Upgrade Flutter itself
flutter upgrade

# Doctor check
flutter doctor

# Check devices
flutter devices
```

---

## 📝 Common Development Tasks

### Fix Flutter Analyze Issues
```powershell
# Check issues
.\build_release.ps1 -Command analyze

# Generate missing files
flutter packages pub run build_runner build --delete-conflicting-outputs

# Check again
flutter analyze lib --no-fatal-infos
```

### Build for Testing
```powershell
# Debug build for testing
flutter build apk --debug

# Install on connected device
flutter install

# Or build and install in one command
flutter run --release
```

### Build for Production
```powershell
# Use the PowerShell script for full build
.\build_release.ps1 -Command full

# Or manual steps:
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter build appbundle --release
```

---

## 🎯 Quick Reference

### Most Common Commands
```powershell
# Daily development
cd "E:\Eat Fast App\eatfast-mobile"
flutter run

# Check for issues
.\build_release.ps1 -Command analyze

# Build APK for testing
.\build_release.ps1 -Command apk

# Full production build
.\build_release.ps1 -Command full
```

### Troubleshooting Commands
```powershell
# Clean and reset
flutter clean
flutter pub get

# Regenerate all code files
flutter packages pub run build_runner build --delete-conflicting-outputs

# Check Flutter installation
flutter doctor

# Check connected devices
flutter devices
```

---

## 💡 PowerShell Tips

### Command History
```powershell
# View command history
Get-History

# Run previous command
!!  # (PowerShell equivalent: Up arrow key)
```

### Multiple Commands
```powershell
# Use semicolon to separate commands
cd "C:\path"; flutter run

# Or use PowerShell pipeline
cd "C:\path" | Out-Null; flutter run
```

### Environment Variables
```powershell
# Check Flutter environment
$env:PATH
echo $env:FLUTTER_ROOT
```

### File Operations
```powershell
# List files
Get-ChildItem
# or
ls

# Check if file exists
Test-Path "pubspec.yaml"

# View file contents
Get-Content "pubspec.yaml"
# or
cat "pubspec.yaml"
```

---

## 🚨 Common Errors and Solutions

### Error: Token '&&' is not valid
```powershell
# ❌ Wrong:
cd "path" && flutter analyze

# ✅ Correct:
cd "path"; flutter analyze
# or
cd "path"
flutter analyze
```

### Error: Execution Policy
```powershell
# If PowerShell blocks script execution:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Then try again:
.\build_release.ps1 -Command analyze
```

### Error: Path with spaces
```powershell
# Always quote paths with spaces:
cd "E:\Eat Fast App\eatfast-mobile"

# Not:
cd E:\Eat Fast App\eatfast-mobile
```

---

## 📋 Cheat Sheet

**Copy this to your notepad:**

```powershell
# Navigate to project
cd "E:\Eat Fast App\eatfast-mobile"

# Check for issues
.\build_release.ps1 -Command analyze

# Run app for development
flutter run

# Build APK for testing
.\build_release.ps1 -Command apk

# Full production build
.\build_release.ps1 -Command full

# Clean project
.\build_release.ps1 -Command clean
```

This should resolve all PowerShell compatibility issues and provide a smooth development experience on Windows!