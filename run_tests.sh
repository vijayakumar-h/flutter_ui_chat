#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "🚀 Starting Test Automation..."

# 1. Get dependencies
echo "📦 Fetching dependencies..."
flutter pub get

# 2. Run Analyze
echo "🔍 Running static analysis..."
flutter analyze

# 3. Run Unit and Widget Tests
echo "🧪 Running tests..."
flutter test

echo "✅ All tests passed successfully!"
