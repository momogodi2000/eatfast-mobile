@echo off
REM Script to generate a universal APK for testing purposes

echo Generating universal APK for testing...
echo This APK will be larger but compatible with all devices

REM Clean existing builds
call flutter clean

REM Get dependencies
call flutter pub get

REM Run code generation if needed
call flutter packages pub run build_runner build --delete-conflicting-outputs

REM Build universal APK (not split)
call flutter build apk --release

echo Universal APK built successfully!
echo File location: build\app\outputs\flutter-apk\app-release.apk
echo Note: For Google Play Store submission, use the App Bundle instead of this APK.
echo Run: .\build_release.bat appbundle
