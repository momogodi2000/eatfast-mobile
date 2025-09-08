# Eat Fast Mobile App - PowerShell Build Scripts for Windows

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("apk", "appbundle", "ios", "web", "icons", "splash", "full", "clean", "analyze")]
    [string]$Command
)

# Build APK for Android
function Build-APK {
    Write-Host "Building APK..." -ForegroundColor Yellow
    flutter clean
    flutter pub get
    flutter packages pub run build_runner build --delete-conflicting-outputs
    flutter build apk --release --split-per-abi
    Write-Host "APK built successfully!" -ForegroundColor Green
    Write-Host "Output: build\app\outputs\flutter-apk\" -ForegroundColor Cyan
}

# Build App Bundle for Android (recommended for Play Store)
function Build-AppBundle {
    Write-Host "Building App Bundle..." -ForegroundColor Yellow
    flutter clean
    flutter pub get
    flutter packages pub run build_runner build --delete-conflicting-outputs
    flutter build appbundle --release
    Write-Host "App Bundle built successfully!" -ForegroundColor Green
    Write-Host "Output: build\app\outputs\bundle\release\" -ForegroundColor Cyan
}

# Build IPA for iOS
function Build-iOS {
    Write-Host "Building iOS..." -ForegroundColor Yellow
    flutter clean
    flutter pub get
    flutter packages pub run build_runner build --delete-conflicting-outputs
    flutter build ios --release
    Write-Host "iOS build completed!" -ForegroundColor Green
    Write-Host "Output: build\ios\iphoneos\" -ForegroundColor Cyan
}

# Build Web
function Build-Web {
    Write-Host "Building Web..." -ForegroundColor Yellow
    flutter clean
    flutter pub get
    flutter packages pub run build_runner build --delete-conflicting-outputs
    flutter build web --release
    Write-Host "Web build completed!" -ForegroundColor Green
    Write-Host "Output: build\web\" -ForegroundColor Cyan
}

# Generate app icons
function Generate-Icons {
    Write-Host "Generating app icons..." -ForegroundColor Yellow
    flutter pub run flutter_launcher_icons
    Write-Host "Icons generated successfully!" -ForegroundColor Green
}

# Generate splash screen
function Generate-Splash {
    Write-Host "Generating splash screen..." -ForegroundColor Yellow
    flutter pub run flutter_native_splash:create
    Write-Host "Splash screen generated successfully!" -ForegroundColor Green
}

# Clean project
function Clean-Project {
    Write-Host "Cleaning project..." -ForegroundColor Yellow
    flutter clean
    flutter pub get
    Write-Host "Project cleaned successfully!" -ForegroundColor Green
}

# Analyze code
function Analyze-Code {
    Write-Host "Running Flutter analyze..." -ForegroundColor Yellow
    flutter analyze lib --no-fatal-infos
    Write-Host "Analysis completed!" -ForegroundColor Green
}

# Full release build (Android)
function Full-Release {
    Write-Host "Starting full release build..." -ForegroundColor Yellow
    Generate-Icons
    Generate-Splash
    Build-AppBundle
    Write-Host "Full release build completed!" -ForegroundColor Green
}

# Show usage
function Show-Usage {
    Write-Host "Usage: .\build_release.ps1 -Command <command>" -ForegroundColor White
    Write-Host ""
    Write-Host "Commands:" -ForegroundColor White
    Write-Host "  apk       - Build APK for Android" -ForegroundColor Gray
    Write-Host "  appbundle - Build App Bundle for Android (recommended)" -ForegroundColor Gray
    Write-Host "  ios       - Build IPA for iOS" -ForegroundColor Gray
    Write-Host "  web       - Build for Web" -ForegroundColor Gray
    Write-Host "  icons     - Generate app icons" -ForegroundColor Gray
    Write-Host "  splash    - Generate splash screen" -ForegroundColor Gray
    Write-Host "  clean     - Clean project and get dependencies" -ForegroundColor Gray
    Write-Host "  analyze   - Run Flutter analyze" -ForegroundColor Gray
    Write-Host "  full      - Full release build (icons + splash + appbundle)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Examples:" -ForegroundColor White
    Write-Host "  .\build_release.ps1 -Command apk" -ForegroundColor Cyan
    Write-Host "  .\build_release.ps1 -Command full" -ForegroundColor Cyan
}

# Main script logic
try {
    switch ($Command) {
        "apk" { Build-APK }
        "appbundle" { Build-AppBundle }
        "ios" { Build-iOS }
        "web" { Build-Web }
        "icons" { Generate-Icons }
        "splash" { Generate-Splash }
        "clean" { Clean-Project }
        "analyze" { Analyze-Code }
        "full" { Full-Release }
        default { Show-Usage }
    }
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}