@echo off
REM Eat Fast Mobile App - Build Scripts for Windows

REM Build APK for Android
if "%1"=="apk" (
    echo Building APK...
    flutter clean
    flutter pub get
    flutter build apk --release --split-per-abi
    echo APK built successfully!
    echo Output: build\app\outputs\flutter-apk\
    goto end
)

REM Build App Bundle for Android (recommended for Play Store)
if "%1"=="appbundle" (
    echo Building App Bundle...
    flutter clean
    flutter pub get
    flutter build appbundle --release
    echo App Bundle built successfully!
    echo Output: build\app\outputs\bundle\release\
    goto end
)

REM Build IPA for iOS
if "%1"=="ios" (
    echo Building iOS...
    flutter clean
    flutter pub get
    flutter build ios --release
    echo iOS build completed!
    echo Output: build\ios\iphoneos\
    goto end
)

REM Build Web
if "%1"=="web" (
    echo Building Web...
    flutter clean
    flutter pub get
    flutter build web --release
    echo Web build completed!
    echo Output: build\web\
    goto end
)

REM Generate app icons
if "%1"=="icons" (
    echo Generating app icons...
    flutter pub run flutter_launcher_icons
    echo Icons generated successfully!
    goto end
)

REM Generate splash screen
if "%1"=="splash" (
    echo Generating splash screen...
    flutter pub run flutter_native_splash:create
    echo Splash screen generated successfully!
    goto end
)

REM Full release build (Android)
if "%1"=="full" (
    echo Starting full release build...
    call :generate_icons
    call :generate_splash
    call :build_appbundle
    echo Full release build completed!
    goto end
)

REM Show usage
echo Usage: %0 {apk^|appbundle^|ios^|web^|icons^|splash^|full}
echo.
echo Commands:
echo   apk       - Build APK for Android
echo   appbundle - Build App Bundle for Android (recommended)
echo   ios       - Build IPA for iOS
echo   web       - Build for Web
echo   icons     - Generate app icons
echo   splash    - Generate splash screen
echo   full      - Full release build (icons + splash + appbundle)
goto end

:generate_icons
echo Generating app icons...
flutter pub run flutter_launcher_icons
echo Icons generated successfully!
goto :eof

:generate_splash
echo Generating splash screen...
flutter pub run flutter_native_splash:create
echo Splash screen generated successfully!
goto :eof

:build_appbundle
echo Building App Bundle...
flutter clean
flutter pub get
flutter build appbundle --release
echo App Bundle built successfully!
echo Output: build\app\outputs\bundle\release\
goto :eof

:end
