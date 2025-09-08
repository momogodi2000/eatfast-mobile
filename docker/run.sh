#!/bin/bash
# EatFast Mobile App Development Runner Script

set -e

echo "🍔 EatFast Mobile App Runner"
echo "============================"

# Configuration
PROJECT_ROOT="$(dirname "$0")/.."
MODE="${1:-dev}"
DEVICE="${2:-chrome}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

log_debug() {
    echo -e "${BLUE}[DEBUG]${NC} $1"
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    log_error "Flutter is not installed or not in PATH"
    exit 1
fi

# Navigate to project root
cd "$PROJECT_ROOT"

# Load environment variables if .env file exists
if [ -f "docker/.env" ]; then
    log_info "Loading environment variables..."
    source docker/.env
fi

log_info "Checking Flutter environment..."
flutter doctor

log_info "Getting dependencies..."
flutter pub get

log_info "Running code generation..."
flutter packages pub run build_runner build --delete-conflicting-outputs

case "$MODE" in
    dev|development)
        log_info "Starting development server..."
        log_debug "Device: $DEVICE"
        log_debug "API URL: ${DEV_API_BASE_URL:-http://localhost:3000/api}"
        
        # Export environment variables for the Flutter app
        export API_BASE_URL="${DEV_API_BASE_URL:-http://localhost:3000/api}"
        export SOCKET_URL="${DEV_SOCKET_URL:-http://localhost:3000}"
        
        flutter run -d "$DEVICE" --dart-define=API_BASE_URL="$API_BASE_URL" --dart-define=SOCKET_URL="$SOCKET_URL"
        ;;
    
    prod|production)
        log_info "Starting production build..."
        log_debug "Device: $DEVICE"
        log_debug "API URL: ${API_BASE_URL:-https://eat-fast-backend-express-js.onrender.com/api}"
        
        # Export environment variables for the Flutter app
        export API_BASE_URL="${API_BASE_URL:-https://eat-fast-backend-express-js.onrender.com/api}"
        export SOCKET_URL="${SOCKET_URL:-https://eat-fast-backend-express-js.onrender.com}"
        
        flutter run -d "$DEVICE" --release --dart-define=API_BASE_URL="$API_BASE_URL" --dart-define=SOCKET_URL="$SOCKET_URL"
        ;;
    
    test)
        log_info "Running tests..."
        export API_BASE_URL="${TEST_API_BASE_URL:-https://eat-fast-backend-express-js.onrender.com/api}"
        flutter test --coverage
        ;;
    
    analyze)
        log_info "Analyzing code..."
        flutter analyze
        flutter format --dry-run --set-exit-if-changed .
        ;;
    
    clean)
        log_info "Cleaning project..."
        flutter clean
        flutter pub get
        flutter packages pub run build_runner clean
        ;;
    
    web)
        log_info "Starting web development server..."
        export API_BASE_URL="${DEV_API_BASE_URL:-http://localhost:3000/api}"
        export SOCKET_URL="${DEV_SOCKET_URL:-http://localhost:3000}"
        
        flutter run -d chrome --web-port=8080 --dart-define=API_BASE_URL="$API_BASE_URL" --dart-define=SOCKET_URL="$SOCKET_URL"
        ;;
    
    doctor)
        log_info "Running Flutter doctor..."
        flutter doctor -v
        ;;
    
    devices)
        log_info "Available devices:"
        flutter devices
        ;;
    
    *)
        log_error "Unknown mode: $MODE"
        echo "Usage: $0 [dev|prod|test|analyze|clean|web|doctor|devices] [device]"
        echo ""
        echo "Modes:"
        echo "  dev        - Run in development mode (default)"
        echo "  prod       - Run in production mode"
        echo "  test       - Run tests with coverage"
        echo "  analyze    - Analyze code and check formatting"
        echo "  clean      - Clean project and rebuild"
        echo "  web        - Run web development server"
        echo "  doctor     - Run Flutter doctor"
        echo "  devices    - List available devices"
        echo ""
        echo "Examples:"
        echo "  $0 dev chrome          # Run in dev mode on Chrome"
        echo "  $0 prod                # Run in prod mode on default device"
        echo "  $0 test                # Run tests"
        echo "  $0 web                 # Start web server"
        exit 1
        ;;
esac

log_info "Runner script completed!"