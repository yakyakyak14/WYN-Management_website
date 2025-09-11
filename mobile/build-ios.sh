#!/bin/bash

# WYN Management iOS Build Script
echo "Building WYN Management iOS App..."

# Check if Cordova is installed
if ! command -v cordova &> /dev/null; then
    echo "Installing Cordova CLI..."
    npm install -g cordova
fi

# Navigate to mobile directory
cd "$(dirname "$0")"

# Install dependencies
echo "Installing dependencies..."
npm install

# Add iOS platform if not exists
if [ ! -d "platforms/ios" ]; then
    echo "Adding iOS platform..."
    cordova platform add ios
fi

# Copy website files to www directory
echo "Copying website files..."
cp -r ../index.html www/
cp -r ../assets www/
cp -r ../pages www/
cp -r ../api www/

# Prepare the app
echo "Preparing iOS app..."
cordova prepare ios

# Build iOS app
echo "Building iOS app..."
cordova build ios --release

echo "iOS build complete!"
echo "Xcode project: platforms/ios/WYN Management.xcworkspace"

# Instructions for App Store submission
echo ""
echo "To submit to App Store:"
echo "1. Open platforms/ios/WYN Management.xcworkspace in Xcode"
echo "2. Select 'Generic iOS Device' or connected device"
echo "3. Set signing team and provisioning profile"
echo "4. Archive the app (Product > Archive)"
echo "5. Upload to App Store Connect via Organizer"
echo "6. Complete app metadata in App Store Connect"
echo "7. Submit for review"

echo ""
echo "Required for App Store:"
echo "- Apple Developer Account ($99/year)"
echo "- App Store Connect access"
echo "- Provisioning profiles and certificates"
echo "- App icons (all required sizes)"
echo "- Screenshots for all device sizes"
