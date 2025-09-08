#!/bin/bash

# EatFast Mobile - Cleanup Script
# Removes mock data files and unused code

echo "🧹 EatFast Mobile Cleanup Script"
echo "Removing mock data and unused files..."

# Define project root
PROJECT_ROOT="$(dirname "$0")/.."

# Remove mock data files
echo "Removing mock data files..."
rm -f "$PROJECT_ROOT/lib/data/mock/mock_restaurant_data.dart"

# Remove any other mock files that might exist
find "$PROJECT_ROOT/lib" -name "*mock*" -type f -delete

# Remove any visitor-related files (if any exist)
find "$PROJECT_ROOT/lib" -name "*visitor*" -type f -delete

# Clean build directories
echo "Cleaning build directories..."
rm -rf "$PROJECT_ROOT/build"
rm -rf "$PROJECT_ROOT/.dart_tool/build"

# Clean pub cache if needed
echo "Getting fresh dependencies..."
cd "$PROJECT_ROOT"
flutter clean
flutter pub get

# Generate any missing generated files
echo "Regenerating code..."
flutter packages pub run build_runner build --delete-conflicting-outputs

echo "✅ Cleanup completed!"
echo "📋 Summary of changes:"
echo "  - Removed mock data files"
echo "  - Cleaned build directories" 
echo "  - Refreshed dependencies"
echo "  - Regenerated code files"
