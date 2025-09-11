#!/bin/bash

# WYN Management Android Build Script
echo "Building WYN Management Android App..."

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

# Add Android platform if not exists
if [ ! -d "platforms/android" ]; then
    echo "Adding Android platform..."
    cordova platform add android
fi

# Copy website files to www directory
echo "Copying website files..."
cp -r ../index.html www/
cp -r ../assets www/
cp -r ../pages www/
cp -r ../api www/

# Prepare the app
echo "Preparing Android app..."
cordova prepare android

# Build release APK
echo "Building release APK..."
cordova build android --release

# Build debug APK
echo "Building debug APK..."
cordova build android --debug

echo "Android build complete!"
echo "Release APK: platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk"
echo "Debug APK: platforms/android/app/build/outputs/apk/debug/app-debug.apk"

# Instructions for signing
echo ""
echo "To sign the release APK for Play Store:"
echo "1. Generate keystore: keytool -genkey -v -keystore wyn-management-release-key.keystore -alias wyn-management-key -keyalg RSA -keysize 2048 -validity 10000"
echo "2. Sign APK: jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore wyn-management-release-key.keystore app-release-unsigned.apk wyn-management-key"
echo "3. Align APK: zipalign -v 4 app-release-unsigned.apk WYN-Management.apk"
