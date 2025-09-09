#!/bin/bash

# EatFast Mobile Deployment Script
# Usage: ./deploy.sh [environment] [version]

set -e

# Default values
ENVIRONMENT=${1:-staging}
VERSION=${2:-$(date +%Y%m%d-%H%M%S)}
PROJECT_NAME="eatfast-mobile"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Validate environment
if [[ ! "$ENVIRONMENT" =~ ^(development|staging|production)$ ]]; then
    print_error "Invalid environment: $ENVIRONMENT"
    print_error "Valid environments: development, staging, production"
    exit 1
fi

print_status "Starting deployment for $ENVIRONMENT environment"
print_status "Version: $VERSION"

# Set environment-specific variables
case $ENVIRONMENT in
    development)
        COMPOSE_FILE="docker-compose.dev.yml"
        API_BASE_URL="http://localhost:5000/api"
        PORT=3000
        ;;
    staging)
        COMPOSE_FILE="docker-compose.prod.yml"
        API_BASE_URL="https://eat-fast-backend-express-js.onrender.com"
        PORT=80
        ;;
    production)
        COMPOSE_FILE="docker-compose.prod.yml"
        API_BASE_URL="https://eat-fast-backend-express-js.onrender.com"
        PORT=80
        ;;
esac

# Export environment variables
export APP_VERSION=$VERSION
export API_BASE_URL=$API_BASE_URL
export ENVIRONMENT=$ENVIRONMENT

print_status "Environment variables set:"
print_status "  API_BASE_URL=$API_BASE_URL"
print_status "  APP_VERSION=$APP_VERSION"
print_status "  ENVIRONMENT=$ENVIRONMENT"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    print_error "Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if docker-compose is installed
if ! command -v docker-compose > /dev/null 2>&1; then
    print_error "docker-compose is not installed. Please install it and try again."
    exit 1
fi

# Navigate to project root
cd "$(dirname "$0")/.."

# Pre-deployment checks
print_status "Running pre-deployment checks..."

# Check if pubspec.yaml exists
if [ ! -f "pubspec.yaml" ]; then
    print_error "pubspec.yaml not found. Are you in the correct directory?"
    exit 1
fi

# Check if lib directory exists
if [ ! -d "lib" ]; then
    print_error "lib directory not found. Are you in the Flutter project directory?"
    exit 1
fi

# Backup current deployment (production only)
if [ "$ENVIRONMENT" = "production" ] && docker ps -q --filter "name=${PROJECT_NAME}" | grep -q .; then
    print_status "Creating backup of current deployment..."
    docker-compose -f docker/$COMPOSE_FILE -p ${PROJECT_NAME}-backup up -d
    sleep 5
fi

# Stop existing containers
print_status "Stopping existing containers..."
docker-compose -f docker/$COMPOSE_FILE down || true

# Remove old images (optional - uncomment if you want to save space)
# print_status "Removing old images..."
# docker image prune -f

# Build and start new containers
print_status "Building and starting new containers..."
docker-compose -f docker/$COMPOSE_FILE up -d --build

# Wait for services to be ready
print_status "Waiting for services to be ready..."
sleep 30

# Health check
print_status "Performing health check..."
if [ "$ENVIRONMENT" != "development" ]; then
    MAX_ATTEMPTS=10
    ATTEMPT=1
    
    while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
        if curl -f http://localhost:$PORT/health > /dev/null 2>&1; then
            print_status "Health check passed!"
            break
        else
            print_warning "Health check attempt $ATTEMPT/$MAX_ATTEMPTS failed, retrying in 10s..."
            sleep 10
            ATTEMPT=$((ATTEMPT + 1))
        fi
    done
    
    if [ $ATTEMPT -gt $MAX_ATTEMPTS ]; then
        print_error "Health check failed after $MAX_ATTEMPTS attempts"
        print_error "Deployment may have issues. Check logs with: docker-compose -f docker/$COMPOSE_FILE logs"
        exit 1
    fi
fi

# Show deployment status
print_status "Deployment completed successfully!"
print_status "Service Status:"
docker-compose -f docker/$COMPOSE_FILE ps

if [ "$ENVIRONMENT" = "development" ]; then
    print_status "Development server is running at: http://localhost:$PORT"
    print_status "Hot reload is enabled for development"
else
    print_status "Production app is running at: http://localhost:$PORT"
    print_status "Health check endpoint: http://localhost:$PORT/health"
fi

print_status "To view logs: docker-compose -f docker/$COMPOSE_FILE logs -f"
print_status "To stop services: docker-compose -f docker/$COMPOSE_FILE down"

# Post-deployment notifications (add your notification logic here)
if [ "$ENVIRONMENT" = "production" ]; then
    print_status "Deployment completed for production environment"
    # Add Slack/Discord/Email notifications here if needed
fi

print_status "Deployment script completed successfully! 🚀"
