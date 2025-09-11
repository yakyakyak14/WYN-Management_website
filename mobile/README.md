# WYN Management Mobile App

This directory contains the mobile app versions of the WYN Management website for iOS and Android platforms.

## 📱 App Overview

**App Name:** WYN Management  
**Package ID:** com.wynmanagement.app  
**Version:** 1.0.0  
**Platforms:** Android, iOS  

## 🚀 Quick Start

### Prerequisites
- Node.js (v16+)
- Cordova CLI (`npm install -g cordova`)
- Android Studio (for Android builds)
- Xcode (for iOS builds, macOS only)

### Build Commands

#### Android APK Generation
```bash
# Make script executable
chmod +x build-android.sh

# Run build script
./build-android.sh
```

#### iOS App Generation
```bash
# Make script executable  
chmod +x build-ios.sh

# Run build script
./build-ios.sh
```

## 📁 Project Structure

```
mobile/
├── config.xml              # Cordova configuration
├── package.json            # Node.js dependencies
├── www/                    # Web app source
│   ├── index.html          # App entry point
│   ├── js/app.js          # App JavaScript
│   └── css/               # App styles
├── platforms/             # Platform-specific files
│   ├── android/           # Android build files
│   └── ios/              # iOS build files
├── build-android.sh       # Android build script
├── build-ios.sh          # iOS build script
└── README.md             # This file
```

## 🔧 Configuration

### Android Configuration
- **Min SDK:** 22 (Android 5.1)
- **Target SDK:** 33 (Android 13)
- **Package:** com.wynmanagement.app
- **Permissions:** Internet, Network State, WiFi State

### iOS Configuration
- **Min iOS:** 12.0
- **Bundle ID:** com.wynmanagement.app
- **Orientation:** Portrait
- **Device Support:** iPhone, iPad

## 📦 App Store Deployment

### Google Play Store (Android)
1. Build release APK using `build-android.sh`
2. Sign APK with release keystore
3. Upload to Google Play Console
4. Complete store listing and metadata
5. Submit for review

### Apple App Store (iOS)
1. Build iOS app using `build-ios.sh`
2. Open Xcode project
3. Configure signing and provisioning
4. Archive and upload to App Store Connect
5. Complete app metadata
6. Submit for review

## 🎨 App Features

- **Responsive Design:** Optimized for mobile devices
- **Touch Interactions:** Native mobile touch feedback
- **Offline Support:** Basic offline functionality
- **Push Notifications:** Ready for implementation
- **Deep Linking:** Support for website URLs
- **Status Bar:** Customized for brand colors

## 🔐 Security & Permissions

### Android Permissions
- `INTERNET` - Network access
- `ACCESS_NETWORK_STATE` - Network status
- `ACCESS_WIFI_STATE` - WiFi status

### iOS Permissions
- Network access (automatic)
- Location services (optional)
- Camera access (optional)
- Photo library access (optional)

## 🛠 Development

### Adding Features
1. Modify `www/` directory files
2. Update `config.xml` if needed
3. Rebuild using build scripts
4. Test on devices/simulators

### Debugging
- Android: Use Chrome DevTools with `chrome://inspect`
- iOS: Use Safari Web Inspector
- Console logs available in device logs

## 📋 App Store Requirements

### Google Play Store
- Developer account ($25 one-time fee)
- Signed APK file
- App icons (multiple sizes)
- Screenshots (phone, tablet)
- Store listing content
- Privacy policy

### Apple App Store
- Apple Developer account ($99/year)
- Xcode project with valid signing
- App icons (all required sizes)
- Screenshots (all device sizes)
- App Store Connect metadata
- Privacy policy

## 🎯 Next Steps

1. **Test the apps** on physical devices
2. **Generate app icons** in all required sizes
3. **Create screenshots** for store listings
4. **Set up developer accounts** (Google Play, Apple)
5. **Prepare store metadata** and descriptions
6. **Submit for review** to app stores

## 📞 Support

For technical support or questions about the mobile app:
- Email: contact@wynmanagement.com
- Website: https://wynmanagement.com
